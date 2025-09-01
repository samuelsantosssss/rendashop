// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> notificarVenda(
  String titulo,
  String texto,
  String userRef,
) async {
  try {
    // 1. Validação inicial
    if (titulo.isEmpty || texto.isEmpty) {
      return 'ERRO: Título e texto não podem ser vazios';
    }

    if (!userRef.startsWith('/user/')) {
      return 'ERRO: Formato inválido (deve ser "/user/UID") - Recebido: "$userRef"';
    }

    // 2. Tentativa de escrita no Firestore
    final docRef = await FirebaseFirestore.instance
        .collection('sendUserPushNotificationsTrigger')
        .add({
      'scheduled_time': '',
      'initial_page_name': '',
      'notification_title': titulo,
      'notification_text': texto,
      'user_refs': userRef,
      'created_at': FieldValue.serverTimestamp(),
      'debug_status': 'pending',
    });

    // 3. Verificação pós-escrita
    final snapshot = await docRef.get();
    if (!snapshot.exists) {
      return 'ERRO: Documento não foi criado (Firestore)';
    }

    // 4. Monitoramento do status (opcional)
    await Future.delayed(
        Duration(seconds: 3)); // Tempo para a Cloud Function processar

    final updatedDoc = await docRef.get();
    final status = updatedDoc.data()?['debug_status'] ?? 'no_status';

    return status == 'processed'
        ? 'SUCESSO: Notificação disparada para $userRef'
        : 'ALERTA: Cloud Function não processou (status: $status)';
  } catch (e) {
    return 'ERRO CRÍTICO: ${e.toString()}';
  }
}
