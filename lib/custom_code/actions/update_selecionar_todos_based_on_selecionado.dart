// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateSelecionarTodosBasedOnSelecionado(
    List<CarrinhoRecord> query, DocumentReference queryRefCarrinho) async {
  try {
    // Obtém o documento atual
    var docSnapshot = await queryRefCarrinho.get();

    // Verifica se o documento existe
    if (docSnapshot.exists && docSnapshot.data() != null) {
      // Faz um cast correto para Map<String, dynamic>
      Map<String, dynamic> docData = docSnapshot.data() as Map<String, dynamic>;
      var lojaRefAtual = docData['lojaRef'];

      // Filtra os documentos que têm o mesmo 'lojaRef' que o documento atual
      var documentosMesmaLoja =
          query.where((doc) => doc.lojaRef == lojaRefAtual).toList();

      // Verifica se todos os documentos "selecionado" estão em true
      bool todosSelecionados =
          documentosMesmaLoja.every((doc) => doc.selecionado == true);

      // Atualiza o campo 'selecionar_todos' em todos os documentos da mesma loja
      for (final doc in documentosMesmaLoja) {
        await doc.reference.update({
          'selecionar_todos': todosSelecionados,
          // Atualiza o campo "selecionado" do próprio documento processado (para consistência)
          'selecionado': doc.reference == queryRefCarrinho
              ? docData['selecionado']
              : doc.selecionado,
        });
      }
    } else {
      print("Documento queryRefCarrinho não encontrado ou dados inválidos.");
    }
  } catch (e) {
    // Em caso de erro, exibe a mensagem de erro
    print("Erro ao atualizar os campos selecionar_todos: $e");
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
