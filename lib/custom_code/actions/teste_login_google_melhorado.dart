// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<String> testeLoginGoogleMelhorado() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  try {
    // 1. Inicia o processo de login com o Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return "Login cancelado pelo usuário.";
    }

    // 2. Obtém as credenciais de autenticação
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    if (googleAuth.accessToken == null || googleAuth.idToken == null) {
      return "Erro: Tokens de autenticação do Google estão nulos.";
    }

    // 3. Cria a credencial para o Firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 4. Autentica no Firebase
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    final User? user = userCredential.user;

    if (user == null) {
      return "Erro: usuário retornado é nulo.";
    }

    // 5. Retorna sucesso
    return "Login bem-sucedido! Nome: ${user.displayName}, Email: ${user.email}, UID: ${user.uid}";
  } catch (e) {
    // 6. Tratamento de erro detalhado
    String error = "Erro ao tentar login com Google.\n";

    if (e is FirebaseAuthException) {
      error += "FirebaseAuthException [${e.code}]: ${e.message}";
    } else if (e is Exception) {
      error += "Exception: ${e.toString()}";
    } else {
      error += "Erro desconhecido: ${e.toString()}";
    }

    return error;
  }
}
