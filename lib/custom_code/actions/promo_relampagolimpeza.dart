// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future promoRelampagolimpeza(List<DocumentReference>? produtoRefs) async {
  if (produtoRefs == null || produtoRefs.isEmpty) return;

  final batch = FirebaseFirestore.instance.batch();

  for (final produtoRef in produtoRefs) {
    try {
      // Verifica se o produto tem variantes
      final variantes = await produtoRef.collection('variante').get();
      final temVariantes = variantes.docs.isNotEmpty;

      // Primeiro precisamos obter os dados atuais do produto para restaurar o preço
      final produtoDoc = await produtoRef.get();
      final produtoData = produtoDoc.data() as Map<String, dynamic>?;

      // Limpeza dos campos de promoção do produto principal
      final deleteUpdates = {
        'promoRelampagoAgendado': FieldValue.delete(),
        'promoRelampagoAtivo': FieldValue.delete(),
        'promoRelampagoDiaHora': FieldValue.delete(),
        'promoRelampagoLimiteCompra': FieldValue.delete(),
        'promoRelampagoPorcentagem': FieldValue.delete(),
        'promoRelampagoValor': FieldValue.delete(),
        'promoRelampagoValorAntes': FieldValue.delete(),
        'promoRelampagoJaCriado': FieldValue.delete(),
        'promoRelampagoMenorValor': FieldValue.delete(),
      };

      // Restaura preço original se não tiver variantes
      if (!temVariantes &&
          produtoData?['preco'] != null &&
          produtoData?['promoRelampagoValorAntes'] != null) {
        batch.update(produtoRef, {
          'preco': produtoData!['promoRelampagoValorAntes'],
        });
      }

      batch.update(produtoRef, deleteUpdates);

      // Limpeza dos campos de promoção das variantes
      for (final variante in variantes.docs) {
        final varianteData = variante.data();
        final varianteDeleteUpdates = {
          'promoRelampagoAgendado': FieldValue.delete(),
          'promoRelampagoAtivo': FieldValue.delete(),
          'promoRelampagoDiaHora': FieldValue.delete(),
          'promoRelampagoLimiteCompra': FieldValue.delete(),
          'promoRelampagoPorcentagem': FieldValue.delete(),
          'promoRelampagoValor': FieldValue.delete(),
          'promoRelampagoValorAntes': FieldValue.delete(),
          'promoRelampagoJaCriado': FieldValue.delete(),
          'promoRelampagoEstoque': FieldValue.delete(),
        };

        if (varianteData['Preco'] != null &&
            varianteData['promoRelampagoValorAntes'] != null) {
          batch.update(variante.reference, {
            'Preco': varianteData['promoRelampagoValorAntes'],
          });
        }

        batch.update(variante.reference, varianteDeleteUpdates);
      }
    } catch (e) {
      print('Erro ao processar produto ${produtoRef.id}: $e');
    }
  }

  await batch.commit();
}
