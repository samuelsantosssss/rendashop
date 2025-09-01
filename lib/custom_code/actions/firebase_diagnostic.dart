// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String> firebaseDiagnostic() async {
  final result = StringBuffer();
  result.writeln('=== DIAGNÓSTICO DO FIREBASE ===\n');

  // 1. Verificar inicialização do Firebase
  result.writeln('1. INICIALIZAÇÃO DO FIREBASE:');
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
      result.writeln('✅ Inicializado com sucesso');
      result.writeln('   - Nome do app: ${Firebase.app().name}');
      result.writeln('   - ProjectID: ${Firebase.app().options.projectId}');
    } else {
      result.writeln('✅ Já estava inicializado');
    }
  } catch (e) {
    result.writeln('❌ FALHA NA INICIALIZAÇÃO: $e');
    return result.toString();
  }

  // 2. Testar Firestore
  result.writeln('\n2. FIRESTORE:');
  try {
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('test').limit(1).get();
    result.writeln('✅ Conexão estabelecida com sucesso');
  } catch (e) {
    result.writeln('❌ ERRO NO FIRESTORE: $e');
  }

  // 3. Testar Authentication
  result.writeln('\n3. AUTHENTICATION:');
  try {
    final auth = FirebaseAuth.instance;
    result.writeln('✅ Serviço disponível');
    result.writeln('   - Usuário atual: ${auth.currentUser?.uid ?? "Nenhum"}');
  } catch (e) {
    result.writeln('❌ ERRO NO AUTH: $e');
  }

  // 4. Testar Storage
  result.writeln('\n4. STORAGE:');
  try {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('test.txt');
    try {
      await ref.getDownloadURL();
      result.writeln('✅ Arquivo de teste encontrado');
    } catch (e) {
      result.writeln('⚠ Configurado mas arquivo não encontrado');
    }
  } catch (e) {
    result.writeln('❌ ERRO NO STORAGE: $e');
  }

  result.writeln('\n=== FIM DO DIAGNÓSTICO ===');
  return result.toString();
}
