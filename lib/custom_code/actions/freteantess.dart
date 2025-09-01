// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> freteantess(List<CarrinhoRecord> doc) async {
  // Inicializa a variável para armazenar a soma dos fretes
  double totalFrete = 0.0;

  // Percorre todos os documentos na lista e soma os valores do campo 'frete'
  for (var item in doc) {
    if (item.frete != null) {
      totalFrete += item.frete!;
    }
  }

  // Atualiza o estado global do app com o total de frete calculado
  FFAppState().freteantes = totalFrete;
}
