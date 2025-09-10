// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> generateProductDeepLink(
  String productId,
  String productName, // No FlutterFlow, marque como não obrigatório
) async {
  // Cria mapa de parâmetros vazio
  final params = <String, String>{'id': productId};

  // Adiciona nome apenas se não estiver vazio
  if (productName.isNotEmpty) {
    params['nome'] = productName;
  }

  // Constrói a URL
  return Uri(
    scheme: 'seuapp',
    host: 'produto',
    path: '/detalhes',
    queryParameters: params,
  ).toString();
}
