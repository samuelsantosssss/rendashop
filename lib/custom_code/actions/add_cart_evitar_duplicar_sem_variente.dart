// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> addCartEvitarDuplicarSemVariente(
  DocumentReference produtoRef,
  List<CarrinhoRecord> carrinhoList,
  int quantidade,
) async {
  // Verifica se o produto já está no carrinho
  for (var item in carrinhoList) {
    if (item.itens == produtoRef) {
      // Se encontrou, incrementa a quantidade
      await item.reference.update({
        'quantidade': FieldValue.increment(quantidade),
      });
      return; // Sai da função após atualizar
    }
  }
  // Se não encontrou, não faz nada (deve adicionar novo item)
}
