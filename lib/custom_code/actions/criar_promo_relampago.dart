// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future criarPromoRelampago(
  List<DocumentReference> produto,
  int? promoRelampagoLimiteCompra,
  int? promoRelampagoEstoque,
  String promoRelampagoDiaHora,
  int porcentagem,
) async {
  if (produto == null || produto.isEmpty) return;

  for (var i = 0; i < produto.length; i += 50) {
    final batch = FirebaseFirestore.instance.batch();
    final batchEnd = (i + 50 < produto.length) ? i + 50 : produto.length;

    for (var j = i; j < batchEnd; j++) {
      final docRef = produto[j];
      try {
        final docSnapshot = await docRef.get();
        final docData = docSnapshot.data() as Map<String, dynamic>? ?? {};

        final updateDataProduto = {
          'promoRelampagoAgendado': true,
          'promoRelampagoAtivo': false,
          'promoRelampagoDiaHora': promoRelampagoDiaHora,
        };

        final variantes = await docRef.collection('variante').get();
        double menorValor = 0.0;
        bool temVariantes = variantes.docs.isNotEmpty;

        if (temVariantes) {
          for (final varianteDoc in variantes.docs) {
            final varianteData = varianteDoc.data() as Map<String, dynamic>;

            if (!varianteData.containsKey('Preco')) {
              print(
                  'Aviso: Variante ${varianteDoc.id} não possui campo "Preco"');
              continue;
            }

            final precoVariante = varianteData['Preco'] as double;
            final valorVarianteComDesconto = double.parse(
                (precoVariante - (precoVariante * porcentagem / 100))
                    .toStringAsFixed(2));

            if (menorValor == 0.0 || valorVarianteComDesconto < menorValor) {
              menorValor = valorVarianteComDesconto;
            }

            final varianteUpdate = {
              'promoRelampagoAgendado': true,
              'promoRelampagoAtivo': false,
              'promoRelampagoDiaHora': promoRelampagoDiaHora,
              'promoRelampagoPorcentagem': porcentagem,
              'promoRelampagoValorAntes': precoVariante,
              'promoRelampagoValor': valorVarianteComDesconto,
              if (promoRelampagoLimiteCompra != null)
                'promoRelampagoLimiteCompra': promoRelampagoLimiteCompra,
              if (promoRelampagoEstoque != null)
                'promoRelampagoEstoque': promoRelampagoEstoque,
            };

            batch.update(varianteDoc.reference, varianteUpdate);
          }

          updateDataProduto['promoRelampagoMenorValor'] = menorValor;
        } else {
          if (docData.containsKey('preco')) {
            final precoAtual = docData['preco'] as double;
            final valorComDesconto = double.parse(
                (precoAtual - (precoAtual * porcentagem / 100))
                    .toStringAsFixed(2));

            // MODIFICADO: Não inclui o campo 'preco' no update
            updateDataProduto.addAll({
              'promoRelampagoValorAntes': precoAtual,
              'promoRelampagoValor': valorComDesconto,
              'promoRelampagoPorcentagem': porcentagem,
            });

            if (promoRelampagoLimiteCompra != null) {
              updateDataProduto['promoRelampagoLimiteCompra'] =
                  promoRelampagoLimiteCompra;
            }
            if (promoRelampagoEstoque != null) {
              updateDataProduto['promoRelampagoEstoque'] =
                  promoRelampagoEstoque;
            }
          } else {
            print(
                'Aviso: Produto ${docRef.id} não possui campo "preco" e não tem variantes');
            continue;
          }
        }

        batch.update(docRef, updateDataProduto);
      } catch (e) {
        print('Erro ao processar ${docRef.id}: $e');
        print('Detalhes do erro: ${e.toString()}');
      }
    }

    await batch.commit();
    print('✅ Lote ${i ~/ 50 + 1} concluído (${batchEnd - i} produtos)');
  }
}
