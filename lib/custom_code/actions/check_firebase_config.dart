// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';

Future<String> checkFirebaseConfig() async {
  try {
    FirebaseOptions? options = Firebase.app().options;

    String info = '''
    ✅ Firebase Config Detectada:
    - Project ID: ${options.projectId}
    - Application ID: ${options.appId}
    - API Key: ${options.apiKey}
    - Messaging Sender ID: ${options.messagingSenderId}
    - Database URL: ${options.databaseURL ?? 'Não configurado'}
    ''';

    return info;
  } catch (e) {
    return '❌ Erro ao obter configuração do Firebase: $e';
  }
}
