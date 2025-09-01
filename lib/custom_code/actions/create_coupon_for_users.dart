// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> createCouponForUsers(List<DocumentReference> userRefs) async {
  // Percorre cada DocumentReference na lista
  for (final userRef in userRefs) {
    try {
      // Criar 3 cupons do primeiro tipo
      for (int i = 0; i < 3; i++) {
        await userRef.collection('cupom').add({
          'nome': 'Frete Grátis acima de R\$10',
          'status': 'disponivel',
          'tipo_cupom': 'Produto a cima de R\$10',
          'valor': 20.0, // Valor double
          'data': FieldValue.serverTimestamp(), // Data e hora atual
        });
      }

      // Criar 2 cupons do segundo tipo
      for (int i = 0; i < 2; i++) {
        await userRef.collection('cupom').add({
          'nome': 'Frete Grátis acima de R\$19',
          'status': 'disponivel',
          'tipo_cupom': 'Produto a cima de R\$19',
          'valor': 20.0, // Valor double
          'data': FieldValue.serverTimestamp(), // Data e hora atual
        });
      }

      // Criar 1 cupom do terceiro tipo
      await userRef.collection('cupom').add({
        'nome': '50% OFF no Frete',
        'status': 'disponivel',
        'tipo_cupom': '50%OFF',
        'valor': 20.0, // Valor double
        'data': FieldValue.serverTimestamp(), // Data e hora atual
      });
    } catch (e) {
      print('Erro ao criar cupom para o usuário $userRef: $e');
    }
  }
}
