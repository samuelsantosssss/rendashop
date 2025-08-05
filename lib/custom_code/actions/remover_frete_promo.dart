// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future removerFretePromo(List<CarrinhoFinalRecord>? queryList) async {
  // Verifica se a lista é válida
  if (queryList == null || queryList.isEmpty) {
    return;
  }

  // Processa cada documento para remover o campo
  final batch = FirebaseFirestore.instance.batch();

  for (final carrinhoDoc in queryList) {
    try {
      // Remove apenas o campo fretePromo mantendo os demais
      batch.update(carrinhoDoc.reference, {
        'fretePromo': FieldValue.delete(),
      });
    } catch (e) {
      print(
          'Erro ao remover fretePromo do documento ${carrinhoDoc.reference.id}: $e');
    }
  }

  // Executa todas as operações em uma única transação
  await batch.commit();
}
