// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> mapeamentoBaixar(
  BuildContext context,
  String? ipinfo,
  DocumentReference? afiliadoRef,
  String statusValue,
  List<String>? nacional, // Nova entrada opcional
  List<String>? internacional, // Nova entrada opcional
) async {
  // 1. Criar referência do documento
  final baixarAppRef = FirebaseFirestore.instance.collection('baixarApp').doc();

  // 2. Dados iniciais
  final dadosIniciais = {
    'ip': ipinfo ?? 'unknown',
    'time': FieldValue.serverTimestamp(),
    'acessouMobile': false,
    'produtoAfiliadoRef': afiliadoRef,
    'status': statusValue,
    // Adiciona as listas apenas se não forem nulas
    if (nacional != null) 'carrinhoNacional': nacional,
    if (internacional != null) 'carrinhoInternacional': internacional,
  };

  // 3. Criar documento e adicionar auto-referência
  await baixarAppRef.set({
    ...dadosIniciais,
    'baixarRef': baixarAppRef,
  });
}
