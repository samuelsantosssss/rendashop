// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<void> salvarAfiliadoNoAppState(BuildContext context) async {
  // 1. Pega a URL atual
  Uri uri = Uri.parse(Uri.base.toString());

  // 2. Extrai o parâmetro 'produtoRef2' (que contém a chave no final)
  String? produtoRef2 = uri.queryParameters['produtoRef2'];

  if (produtoRef2 != null && produtoRef2.isNotEmpty) {
    // 3. Divide os valores separados por pipe (|)
    List<String> partes = produtoRef2.split('|');

    // 4. Pega a última parte como chave do afiliado (se existir)
    if (partes.length >= 3) {
      // Verifica se há pelo menos 3 partes (ID1|ID2|chave)
      String chaveAfiliado = partes[2]; // Índice 2 = terceira parte
      FFAppState().afiliadoid = chaveAfiliado; // Salva no AppState
    }
  }
}
