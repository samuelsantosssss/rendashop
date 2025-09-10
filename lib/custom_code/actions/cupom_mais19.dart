// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> cupomMais19(List<CarrinhoRecord> query) async {
  // Verifica se a query está vazia
  if (query.isEmpty) {
    print('A query está vazia.');
    return false; // Retorna falso se a lista estiver vazia
  }

  // Itera por todos os documentos na lista
  for (final doc in query) {
    // Verifica se o campo 'preco' é maior ou igual a 19
    if (doc.preco != null && doc.preco! >= 19) {
      print(
          'Documento válido encontrado: ${doc.reference} com preco: ${doc.preco}');
      return true; // Retorna true assim que encontrar um documento válido
    }
  }

  // Se nenhum documento atender ao critério, retorna falso
  print('Nenhum documento possui preco >= 19');
  return false;
}
