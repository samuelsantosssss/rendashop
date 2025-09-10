// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> formatarSugestoesPalavrasChave(List<String> palavras) async {
  List<Map<String, String>> resultado = [];

  for (var palavra in palavras) {
    resultado.add({
      "sugestao": palavra,
      "destaque":
          palavra, // Podemos modificar se precisar destacar parte da palavra
    });
  }

  return resultado;
}
