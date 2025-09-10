// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> atualizarTime24h(List<DocumentReference>? docRefs) async {
  if (docRefs == null || docRefs.isEmpty) {
    debugPrint('Erro: Nenhum documento para atualizar.');
    return;
  }

  final DateTime umaHoraAtras = DateTime.now().subtract(Duration(hours: 1));

  List<Future> updates = [];

  for (final documentRef in docRefs) {
    updates.add(
      documentRef.update({
        'time24h': Timestamp.fromDate(umaHoraAtras), // Atualiza a data e hora
      }).catchError((error) {
        debugPrint('Erro ao atualizar ${documentRef.id}: $error');
      }),
    );
  }

  await Future.wait(updates);
}
