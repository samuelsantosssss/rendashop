// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateSelecionadoToTrue(
  DocumentReference queryRefCarrinho,
  List<CarrinhoRecord> query,
) async {
  try {
    final docSnapshot = await queryRefCarrinho.get();

    if (docSnapshot.exists && docSnapshot.data() != null) {
      final docData = docSnapshot.data() as Map<String, dynamic>;
      final lojaRefAtual = docData['lojaRef'];
      final bool? selecionarTodosAtual = docData['selecionar_todos'];

      // Filtra apenas os documentos da mesma loja
      final docsDaLoja =
          query.where((doc) => doc.lojaRef == lojaRefAtual).toList();

      // Verifica se TODOS os itens da loja já estão selecionados
      final todosSelecionados =
          docsDaLoja.every((doc) => doc.selecionado == true);

      // Define o novo valor com base na condição
      final bool novoValorSelecionarTodos = todosSelecionados ? false : true;

      // Atualiza o documento principal
      await queryRefCarrinho.update({
        'selecionar_todos': novoValorSelecionarTodos,
        'selecionado': novoValorSelecionarTodos,
      });

      // Atualiza apenas os documentos da mesma loja
      for (final doc in docsDaLoja) {
        await doc.reference.update({
          'selecionar_todos': novoValorSelecionarTodos,
          'selecionado': novoValorSelecionarTodos,
        });
      }
    } else {
      // Inicialização padrão se o documento não existir
      await queryRefCarrinho.update({
        'selecionar_todos': true,
        'selecionado': true,
      });
    }
  } catch (e) {
    print("Erro ao atualizar os documentos: $e");
  }
}
