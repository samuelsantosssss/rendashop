// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> somaFreteCartao(List<DocumentReference> doc) async {
  double totalFrete = 0.0;
  double totalPreco = 0.0;
  double totalICMS = 0.0;
  double totalImpostoImportacao = 0.0;

  // Percorre todos os documentos da lista
  for (var document in doc) {
    var snapshot = await document.get();

    if (snapshot.exists) {
      // Obtém o valor do campo "frete"
      double? frete = snapshot.get("frete");
      if (frete != null) {
        totalFrete += frete;
      }

      // Obtém os valores do campo "preco" e "quantidade"
      double? preco = snapshot.get("preco");
      double? quantidade = snapshot.get("quantidade");
      if (preco != null && quantidade != null) {
        totalPreco += preco * quantidade; // Multiplica preço pela quantidade
      }

      // Obtém o valor do campo "icms"
      double? icms = snapshot.get("icms");
      if (icms != null) {
        totalICMS += icms;
      }

      // Obtém o valor do campo "impostoImportacao"
      double? impostoImportacao = snapshot.get("impostoImportacao");
      if (impostoImportacao != null) {
        totalImpostoImportacao += impostoImportacao;
      }
    }
  }

  // Calcula o total do pedido somando todos os valores
  double totalPedido =
      totalFrete + totalPreco + totalICMS + totalImpostoImportacao;

  // Atualiza os valores no App State
  FFAppState().freteCartaoErro = double.parse(totalFrete.toStringAsFixed(2));
  FFAppState().produtosCartaoErro = double.parse(totalPreco.toStringAsFixed(2));
  FFAppState().totalPedidoCartao = double.parse(totalPedido.toStringAsFixed(2));
  FFAppState().icmsCartaoErro = double.parse(totalICMS.toStringAsFixed(2));
  FFAppState().impostoImportacaoCartaoErro =
      double.parse(totalImpostoImportacao.toStringAsFixed(2));
}
