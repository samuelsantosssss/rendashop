// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future aplicarDescontoFrete(List<CarrinhoFinalRecord>? queryList) async {
  // Verifica se a lista é válida
  if (queryList == null || queryList.isEmpty) {
    // Reseta o appstate se não há carrinhos
    FFAppState().update(() {
      FFAppState().descontoFreteAplicado = 0.0;
    });
    return;
  }

  // 1. Primeiro refresh - Garante dados atualizados
  final refreshedDocs = await Future.wait(queryList.map((doc) => doc.reference
      .get()
      .then((snap) => CarrinhoFinalRecord.fromSnapshot(snap))));

  final documentosAtualizados = <DocumentReference>[];
  double totalDescontos = 0.0;

  // 2. Processa cada documento
  for (final carrinhoDoc in refreshedDocs) {
    try {
      double somaValores = 0.0;
      final freteOriginal = carrinhoDoc.frete;

      // Extrai e soma os valores unitários
      for (final produtoStr in carrinhoDoc.listProdutos) {
        final valorMatch =
            RegExp(r'\(valor Unidade "R\$([\d,]+)"\)').firstMatch(produtoStr);
        if (valorMatch != null) {
          final valorStr = valorMatch.group(1)!.replaceAll(',', '.');
          somaValores += double.tryParse(valorStr) ?? 0.0;
        }
      }

      // Aplica desconto apenas se somaValores > 10
      if (somaValores > 10.0) {
        final desconto = 20.0; // Valor fixo do desconto
        final fretePromo =
            (freteOriginal - desconto).clamp(0.0, double.infinity);
        final fretePromoFormatado =
            fretePromo.toStringAsFixed(2).replaceAll('.', ',');

        // Atualiza o documento
        await carrinhoDoc.reference.update({
          'fretePromo': fretePromoFormatado,
        });

        // Acumula o total de descontos
        totalDescontos += (freteOriginal - fretePromo);
      } else {
        // Remove o fretePromo se existir
        await carrinhoDoc.reference.update({
          'fretePromo': FieldValue.delete(),
        });
      }

      documentosAtualizados.add(carrinhoDoc.reference);
    } catch (e) {
      print('Erro ao processar documento ${carrinhoDoc.reference.id}: $e');
    }
  }

  // 3. Atualiza o AppState com o total de descontos
  FFAppState().update(() {
    FFAppState().descontoFreteAplicado = totalDescontos;
  });

  // 4. Refresh final - Força atualização dos documentos modificados
  if (documentosAtualizados.isNotEmpty) {
    await Future.wait(documentosAtualizados.map((ref) => ref.get()));
  }
}
