// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> freteCupomNovo(
  List<CarrinhoRecord> queryCarrinhoList,
  String enderecoCliente,
  double cupom,
  String tipoCupom,
) async {
  // Verifica se a lista está vazia
  if (queryCarrinhoList.isEmpty) {
    print('A lista de carrinho está vazia.');
    return;
  }

  // Lista de estados brasileiros com suas respectivas abreviações
  Map<String, String> estados = {
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
    "Tocantins": "TO",
  };

  // Verifica o estado no endereço do cliente
  String estadoCliente = "SP"; // Default
  if (enderecoCliente.isEmpty) {
    print('Endereço do cliente está vazio. Usando padrão: São Paulo (SP).');
  } else {
    estados.forEach((nomeEstado, abreviacao) {
      if (enderecoCliente.contains(nomeEstado) ||
          enderecoCliente.contains(abreviacao)) {
        estadoCliente = abreviacao;
      }
    });
  }

  // Itera por todos os itens no carrinho
  for (final carrinho in queryCarrinhoList) {
    try {
      // Acessa o documento "produto" pelo doc reference da pasta "itens"
      final produtoRef =
          carrinho.itens; // Assume que 'itens' é um DocumentReference
      if (produtoRef == null) {
        print(
            'Documento "produto" não encontrado para o carrinho: ${carrinho.reference}');
        continue;
      }

      // Busca os dados do documento "produto"
      final produtoDoc = await produtoRef.get();
      if (!produtoDoc.exists) {
        print(
            'Documento "produto" não existe para o carrinho: ${carrinho.reference}');
        continue;
      }

      final produtoData = produtoDoc.data() as Map<String, dynamic>?;

      // Verifica se os campos "listFrete" e "freteSP" existem
      if (produtoData == null ||
          !produtoData.containsKey('listFrete') ||
          !produtoData.containsKey('freteSP')) {
        print(
            'Campos "listFrete" ou "freteSP" não encontrados no documento produto.');
        continue;
      }

      final List<String> listFrete =
          List<String>.from(produtoData['listFrete'] ?? []);
      final double freteBase = produtoData['freteSP'] ?? 0.0;

      // Busca a porcentagem de frete correspondente ao estado do cliente
      double porcentagemFrete = 0.0; // Default caso não encontre o estado
      for (String item in listFrete) {
        if (item.startsWith(estadoCliente)) {
          porcentagemFrete = double.parse(item.split(" ")[1]);
          break;
        }
      }

      // Calcula o frete final
      double freteFinal = freteBase + (freteBase * porcentagemFrete / 100);

      // Verifica se o tipo de cupom permite desconto no frete
      bool statusCupom = false; // Inicializa como false
      if (tipoCupom.contains('acima de R\$')) {
        // Extraindo o valor mínimo do tipoCupom
        final regex = RegExp(r'acima de R\$(\d+)');
        final match = regex.firstMatch(tipoCupom);

        if (match != null) {
          double valorMinimo = double.parse(match.group(1)!);

          // Verificando se o valor do produto é elegível para o cupom
          if (carrinho.preco >= valorMinimo) {
            // Aplica o desconto no frete
            freteFinal -= cupom;

            // Garantindo que o frete não fique abaixo de zero
            freteFinal = freteFinal > 0 ? freteFinal : 0.0;

            // Atualiza o status do cupom para true
            statusCupom = true;
          }
        }
      }

      // Verifica se o tipo de cupom é "50% OFF no Frete"
      if (tipoCupom.contains('50% OFF no Frete')) {
        // Aplica 50% de desconto no frete
        freteFinal = freteFinal / 2;

        // Atualiza o status do cupom para true
        statusCupom = true;
      }

      // Atualiza o campo 'frete' e 'statusCupom' no Firestore
      await carrinho.reference.update({
        'frete': freteFinal,
        'statusCupom': statusCupom,
      });

      print(
          'Frete e status do cupom atualizados para o carrinho: ${carrinho.reference}, novo frete: $freteFinal, statusCupom: $statusCupom');
    } catch (e) {
      print(
          'Erro ao calcular ou atualizar o frete para o documento: ${carrinho.reference}, erro: $e');
    }
  }
}
