// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> mapeamentoBaixarHomePaginaProduto(
  BuildContext context,
  String? ipinfo,
  List<BaixarAppRecord> baixarAppList,
) async {
  // 1. Obter o IP (com fallback para "unknown")
  final ip = ipinfo ?? 'unknown';

  // 2. Verificar na lista de documentos
  for (final documento in baixarAppList) {
    if (documento.ip == ip && documento.acessouMobile == false) {
      // Retorna 'baixarRef' apenas se 'acessouMobile' for false
      return documento.baixarRef;
    }
  }

  // 3. Se não encontrou correspondência
  return null;
}
