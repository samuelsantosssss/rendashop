// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> calcularFrete2(
  List<CarrinhoRecord> queryCarrinhoList,
  String enderecoCliente,
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

      // Atualiza o campo 'frete' no Firestore
      await carrinho.reference.update({
        'frete': freteFinal,
        'statusCupom': false, // Atualiza o campo 'statusCupom' para false
      });

      print(
          'Frete atualizado para o documento: ${carrinho.reference}, novo frete: $freteFinal');
    } catch (e) {
      print(
          'Erro ao calcular ou atualizar o frete para o documento: ${carrinho.reference}, erro: $e');
    }
  }
}
