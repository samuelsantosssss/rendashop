// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> addCartEvitarDuplicar(
  DocumentReference produtoRef,
  String variante,
  List<CarrinhoRecord> carrinhoList,
  int quantidade,
) async {
  // Procura um item com o mesmo produto e variante
  for (var item in carrinhoList) {
    if (item.itens == produtoRef && item.variacao == variante) {
      // Se encontrar, atualiza a quantidade (+= quantidade)
      await item.reference.update({
        'quantidade': FieldValue.increment(quantidade),
      });
      return; // Sai da função após atualizar
    }
  }
  // Se não encontrar, não faz nada (quem chamou deve adicionar o novo item)
}
