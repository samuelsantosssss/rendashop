// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateSelecionadoToTrue2(
  DocumentReference queryRefCarrinho,
  List<CarrinhoRecord> query,
) async {
  try {
    // Verifica se TODOS os itens já estão selecionados
    final todosSelecionados = query.every((doc) => doc.selecionado == true);

    // Define o novo valor com base na condição
    final bool novoValor = todosSelecionados ? false : true;

    // Atualiza o documento principal
    await queryRefCarrinho.update({
      'selecionar_todos': novoValor,
      'selecionado': novoValor,
    });

    // Atualiza TODOS os documentos da lista
    for (final doc in query) {
      await doc.reference.update({
        'selecionar_todos': novoValor,
        'selecionado': novoValor,
      });
    }
  } catch (e) {
    print("Erro ao atualizar os documentos: $e");
    // Opcional: Lançar o erro novamente se necessário
    // throw e;
  }
}
