// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> calcularFreteCarrinhoFinal(
  List<CarrinhoFinalRecord> carrinhoFinalList,
  String? enderecoCliente,
) async {
  // Verifica se a lista está vazia
  if (carrinhoFinalList.isEmpty) {
    print('A lista de carrinhoFinal está vazia.');
    return;
  }

  // Lista completa de estados brasileiros
  final Map<String, String> estados = {
    "Acre": "AC",
    "Alagoas": "AL",
    "Amapá": "AP",
    "Amazonas": "AM",
    "Bahia": "BA",
    "Ceará": "CE",
    "Distrito Federal": "DF",
    "Espírito Santo": "ES",
    "Goiás": "GO",
    "Maranhão": "MA",
    "Mato Grosso": "MT",
    "Mato Grosso do Sul": "MS",
    "Minas Gerais": "MG",
    "Pará": "PA",
    "Paraíba": "PB",
    "Paraná": "PR",
    "Pernambuco": "PE",
    "Piauí": "PI",
    "Rio de Janeiro": "RJ",
    "Rio Grande do Norte": "RN",
    "Rio Grande do Sul": "RS",
    "Rondônia": "RO",
    "Roraima": "RR",
    "Santa Catarina": "SC",
    "São Paulo": "SP",
    "Sergipe": "SE",
    "Tocantins": "TO"
  };

  // Determina o estado do cliente (SP como padrão)
  String estadoCliente = "SP";
  if (enderecoCliente != null && enderecoCliente.isNotEmpty) {
    estados.forEach((nome, sigla) {
      if (enderecoCliente.contains(nome) || enderecoCliente.contains(sigla)) {
        estadoCliente = sigla;
      }
    });
  }

  // Processa cada item do carrinho
  for (final carrinhoFinal in carrinhoFinalList) {
    try {
      final listProdutos = carrinhoFinal.listProdutos ?? [];
      if (listProdutos.isEmpty) continue;

      List<double> fretesCalculados = [];

      // Calcula frete para cada produto
      for (final produtoStr in listProdutos) {
        final produtoStrSafe = produtoStr ?? '';

        // Extrai a referência do produto e a quantidade
        final refMatch =
            RegExp(r'produtoRef "([^"]+)"').firstMatch(produtoStrSafe);
        final qtdMatch =
            RegExp(r'quantidade "(\d+)"').firstMatch(produtoStrSafe);

        final produtoPath = refMatch?.group(1);
        final quantidade = int.tryParse(qtdMatch?.group(1) ?? '1') ?? 1;

        if (produtoPath == null || produtoPath.isEmpty) continue;

        // Busca os dados do produto no Firestore
        final produtoDoc =
            await FirebaseFirestore.instance.doc(produtoPath).get();
        if (!produtoDoc.exists) continue;

        final produtoData = produtoDoc.data() as Map<String, dynamic>?;
        if (produtoData == null) continue;

        // Obtém frete base e ajustes regionais
        final freteBase = (produtoData['freteSP'] as num?)?.toDouble() ?? 0.0;
        final listFrete = List<String>.from(produtoData['listFrete'] ?? []);

        // Calcula ajuste regional
        double porcentagem = 0.0;
        for (final item in listFrete) {
          if (item.startsWith(estadoCliente)) {
            porcentagem = double.tryParse(item.split(' ')[1]) ?? 0.0;
            break;
          }
        }

        // NOVO CÁLCULO CONSIDERANDO QUANTIDADE
        double freteItemTotal = 0.0;
        final freteUnitario = freteBase * (1 + porcentagem / 100);

        if (quantidade == 1) {
          freteItemTotal = freteUnitario;
        } else {
          // Primeira unidade: 100%
          freteItemTotal = freteUnitario;
          // Unidades adicionais: 30% cada
          for (int i = 1; i < quantidade; i++) {
            freteItemTotal += freteUnitario * 0.3;
          }
        }

        fretesCalculados.add(freteItemTotal);
      }

      // CONDICIONAIS DE CÁLCULO FINAL
      double freteFinal;

      // 1 produto: valor completo
      if (fretesCalculados.length == 1) {
        freteFinal = fretesCalculados[0];
      }
      // 2+ produtos: frete mais caro + 30% dos demais
      else {
        final freteMaisCaro = fretesCalculados.reduce((a, b) => a > b ? a : b);
        double somaSecundarios = 0.0;

        for (final frete in fretesCalculados) {
          if (frete != freteMaisCaro) {
            somaSecundarios += frete * 0.3;
          }
        }

        freteFinal = freteMaisCaro + somaSecundarios;
      }

      // Formata e salva com 2 casas decimais
      await carrinhoFinal.reference.update({
        'frete': double.parse(freteFinal.toStringAsFixed(2)),
      });

      print('Frete calculado: R\$${freteFinal.toStringAsFixed(2)}');
    } catch (e) {
      print('Erro ao calcular frete: $e');
    }
  }
}
