// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future promoRelampagoUpdate(List<ProdutoRecord>? docList) async {
  if (docList == null || docList.isEmpty) return;

  final agora = DateTime.now();
  final formatadorData = DateFormat('d/M/yyyy HH:mm');
  final batch = FirebaseFirestore.instance.batch();

  for (final produtoDoc in docList) {
    try {
      // Verifica se o produto tem variantes
      final variantes = await produtoDoc.reference.collection('variante').get();
      final temVariantes = variantes.docs.isNotEmpty;

      // Processa o produto principal
      final promoDiaHora = produtoDoc.promoRelampagoDiaHora;
      final partes = promoDiaHora.split(' - ');
      if (partes.length != 2) continue;

      final dataHoraInicio = formatadorData.parse(partes[0].trim());

      // CORREÇÃO AQUI: Usar o horário final especificado no campo
      final dataHoraFimString =
          '${partes[0].split(' ')[0]} ${partes[1].trim()}';
      final dataHoraFim = partes[1].trim() == '00:00'
          ? DateTime(dataHoraInicio.year, dataHoraInicio.month,
              dataHoraInicio.day, 23, 59, 0)
          : formatadorData.parse(dataHoraFimString);

      // Verifica se já passou do horário de término
      if (agora.isAfter(dataHoraInicio) && agora.isBefore(dataHoraFim)) {
        if (produtoDoc.promoRelampagoJaCriado != true) {
          // Só atualiza preco se NÃO tiver variantes
          if (!temVariantes && produtoDoc.preco != null) {
            batch.update(produtoDoc.reference, {
              'promoRelampagoAtivo': true,
              'preco': produtoDoc.promoRelampagoValor,
              'promoRelampagoJaCriado': true,
            });
          } else {
            batch.update(produtoDoc.reference, {
              'promoRelampagoAtivo': true,
              'promoRelampagoJaCriado': true,
            });
          }
        }
      } else if (agora.isAfter(dataHoraFim)) {
        // Limpeza após promoção - nunca cria 'preco' se tiver variantes
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

        // Só restaura preco se NÃO tiver variantes E o campo existir
        if (!temVariantes &&
            produtoDoc.preco != null &&
            produtoDoc.promoRelampagoValorAntes != null) {
          batch.update(produtoDoc.reference, {
            'preco': produtoDoc.promoRelampagoValorAntes,
          });
        }

        batch.update(produtoDoc.reference, deleteUpdates);
      }

      // Processa as variantes (mesma correção para o horário final)
      for (final variante in variantes.docs) {
        final varianteData = variante.data();
        final variantePromoDiaHora =
            varianteData['promoRelampagoDiaHora'] as String?;

        if (variantePromoDiaHora == null) continue;

        final variantePartes = variantePromoDiaHora.split(' - ');
        if (variantePartes.length != 2) continue;

        final varianteDataHoraInicio =
            formatadorData.parse(variantePartes[0].trim());

        // CORREÇÃO AQUI: Usar o horário final especificado no campo
        final varianteDataHoraFimString =
            '${variantePartes[0].split(' ')[0]} ${variantePartes[1].trim()}';
        final varianteDataHoraFim = variantePartes[1].trim() == '00:00'
            ? DateTime(
                varianteDataHoraInicio.year,
                varianteDataHoraInicio.month,
                varianteDataHoraInicio.day,
                23,
                59,
                0)
            : formatadorData.parse(varianteDataHoraFimString);

        if (agora.isAfter(varianteDataHoraInicio) &&
            agora.isBefore(varianteDataHoraFim)) {
          if (varianteData['promoRelampagoJaCriado'] != true) {
            batch.update(variante.reference, {
              'promoRelampagoAtivo': true,
              'Preco': varianteData['promoRelampagoValor'],
              'promoRelampagoJaCriado': true,
            });
          }
        } else if (agora.isAfter(varianteDataHoraFim)) {
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
      }
    } catch (e) {
      print('Erro ao processar produto ${produtoDoc.reference.id}: $e');
    }
  }

  await batch.commit();
}
