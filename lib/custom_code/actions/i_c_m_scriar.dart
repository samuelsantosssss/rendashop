// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math; // Importando corretamente o math

Future<void> iCMScriar(
    List<CarrinhoRecord> documentList, String enderecoDestino) async {
  // Código para calcular ICMS e Imposto de Importação e atualizar os documentos
  Map<String, double> aliquotasICMS = {
    "AC": 19.00,
    "AL": 19.00,
    "AP": 18.00,
    "AM": 20.00,
    "BA": 20.50,
    "CE": 20.00,
    "DF": 20.00,
    "ES": 17.00,
    "GO": 19.00,
    "MA": 22.00,
    "MT": 17.00,
    "MS": 17.00,
    "MG": 18.00,
    "PA": 19.00,
    "PB": 20.00,
    "PR": 19.50,
    "PE": 20.50,
    "PI": 21.00,
    "RJ": 22.00,
    "RN": 18.00,
    "RS": 17.00,
    "RO": 17.00,
    "RR": 17.00,
    "SC": 17.00,
    "SP": 18.00,
    "SE": 18.00,
    "TO": 18.00,
  };

  // Extrai o estado do endereçoDestino e define a alíquota
  List<String> enderecoParts = enderecoDestino.split(",");
  String estado = enderecoParts.last.trim().split(" ")[0];
  double aliquotaICMS = aliquotasICMS[estado] ?? 18.00; // São Paulo por padrão

  const double taxaCambio = 5.81; // Cotação do dólar

  // Função de cálculo do Imposto de Importação
  double calcularImpostoImportacao(
      double frete, int? quantidade, double? produto) {
    if (quantidade == null || produto == null) {
      return 0.0; // Retorna 0 caso os valores sejam inválidos
    }

    // Calcula o valor total do pedido em BRL
    double totalPedidoBRL = (produto * quantidade) + frete;

    // Converte para USD
    double totalPedidoUSD = totalPedidoBRL / taxaCambio;

    double impostoUSD;

    if (totalPedidoUSD <= 50.0) {
      // Para pedidos até $50 → 20% de imposto
      impostoUSD = totalPedidoUSD * 0.20;
    } else {
      // Para pedidos acima de $50 → 60% menos $20 de desconto
      impostoUSD = (totalPedidoUSD * 0.60) - 20.0;
      // Garante que o imposto nunca seja negativo
      impostoUSD = math.max(impostoUSD, 0.0);
    }

    // Converte o imposto final de volta para BRL
    double impostoBRL = impostoUSD * taxaCambio;

    return impostoBRL;
  }

  // Percorre os documentos na lista
  for (var documento in documentList) {
    bool produtoNacional = documento.nacional ?? false;

    // Se for nacional, pula para o próximo
    if (produtoNacional) continue;

    double frete = documento.frete ?? 0.0;
    int quantidade = documento.quantidade ?? 0;
    double preco = documento.preco ?? 0.0;

    // Cálculo do ICMS com 40% a mais
    double valorProduto = preco * quantidade;
    double valorTotal = valorProduto + frete;
    double valorICMS =
        valorTotal * (aliquotaICMS / 100) * 1.40; // ICMS com 40% a mais

    // Cálculo do Imposto de Importação
    double impostoImportacao =
        calcularImpostoImportacao(frete, quantidade, preco);

    // Atualiza os campos icms e impostoImportacao no documento
    await documento.reference.update({
      "icms": valorICMS,
      "impostoImportacao": impostoImportacao,
    });
  }
}
