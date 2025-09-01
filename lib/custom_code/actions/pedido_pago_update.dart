// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future pedidoPagoUpdate(List<DocumentReference> doc) async {
  // Obtém o método de pagamento do AppState
  final metodoPagamento = FFAppState().metodoPagamento;

  // Lista de operações assíncronas
  List<Future> updates = [];

  for (final documentRef in doc) {
    updates.add(
      documentRef.update({
        'status': 'preparando',
        'status_pagamento': 'pago',
        'forma_pagamento': metodoPagamento, // Atualiza forma de pagamento
      }).catchError((error) {
        debugPrint('Erro ao atualizar pedido: $error');
      }),
    );
  }

  // Aguarda todas as atualizações finalizarem
  await Future.wait(updates);
}
