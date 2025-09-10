// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> fazerPagamento(String texto) async {
  /// BEGIN CUSTOM ACTION CODE
  try {
    final firestore = FirebaseFirestore.instance;
    final batch = firestore.batch();

    // 1. Extrai a lista completa de caminhos de pedidoRef
    final listaRegExp = RegExp(r'lista pedidoRef ((?:"[^"]+"\s*)+)');
    final match = listaRegExp.firstMatch(texto);

    List<String> pedidosRef = [];

    if (match != null) {
      final listaPedidosStr = match.group(1)!; // pega tudo: "path1" "path2"
      // Agora separa cada item entre aspas
      final caminhoRegExp = RegExp(r'"([^"]+)"');
      pedidosRef = caminhoRegExp
          .allMatches(listaPedidosStr)
          .map((m) => m.group(1)!)
          .toList();
    }

    // 2. Adiciona TODAS as atualizações ao batch
    for (final path in pedidosRef) {
      final fullPath =
          path.startsWith('pedidos_total/') ? path : 'pedidos_total/$path';

      batch.update(firestore.doc(fullPath), {
        'afiliadoSacouDinheiro': true,
        'dataSaque': FieldValue.serverTimestamp(),
      });
    }

    // 3. Executa TODAS as atualizações em uma única operação
    if (pedidosRef.isNotEmpty) {
      await batch.commit();
      print('✅ Atualizou ${pedidosRef.length} documentos com sucesso.');
    } else {
      print('⚠️ Nenhum pedidoRef encontrado.');
    }
  } catch (e) {
    print('❌ Erro ao atualizar pedidos: $e');
    rethrow;
  }

  /// END CUSTOM ACTION CODE
}
