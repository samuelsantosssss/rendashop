// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> testecodigo() async {
  // Teste de edição do AppState
  FFAppState().notificaafiliado = '1234';

  print(
      'Valor do AppState notificaafiliado definido como: ${FFAppState().notificaafiliado}');

  // Adicione um pequeno delay para garantir que o valor foi atualizado
  await Future.delayed(Duration(milliseconds: 100));

  // Verifica se o valor foi realmente atualizado
  if (FFAppState().notificaafiliado == '1234') {
    print('TESTE BEM SUCEDIDO: AppState foi atualizado corretamente!');
  } else {
    print('TESTE FALHOU: AppState não foi atualizado como esperado');
  }
}
