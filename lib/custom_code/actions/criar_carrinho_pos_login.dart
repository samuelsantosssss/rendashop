// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> criarCarrinhoPosLogin(
  List<String> listaCarrinho,
  DocumentReference userRef,
) async {
  // Lista para armazenar os IDs dos documentos criados
  List<String> documentosCriados = [];

  // Função auxiliar para extrair valores da string formatada
  String extrairValor(String item, String chave) {
    try {
      String padrao = '($chave "';
      int startIndex = item.indexOf(padrao);
      if (startIndex == -1) return "";
      startIndex += padrao.length;
      int endIndex = item.indexOf('")', startIndex);
      if (endIndex == -1) return "";
      return item.substring(startIndex, endIndex);
    } catch (e) {
      print("Erro ao extrair $chave: $e");
      return "";
    }
  }

  try {
    // Referência à subcoleção 'carrinho' do usuário
    CollectionReference carrinhoCollection = userRef.collection('carrinho');

    // Primeiro: atualizar todos os produtos existentes no carrinho para selecionado = false
    final querySnapshot = await carrinhoCollection.get();
    final batch = FirebaseFirestore.instance.batch();

    for (final doc in querySnapshot.docs) {
      batch.update(doc.reference, {'selecionado': false});
    }

    await batch.commit();

    // Depois: processar cada item na lista de entrada para adicionar novos itens
    for (String item in listaCarrinho) {
      // Extrair e converter os valores do produto
      String titulo = extrairValor(item, "titulo");
      String fotoCapa = extrairValor(item, "foto");
      DateTime dataAdicao = parseDateTime(extrairValor(item, "data_adicao"));
      DocumentReference itens =
          FirebaseFirestore.instance.doc(extrairValor(item, "produtoRef"));
      DocumentReference lojaRef =
          FirebaseFirestore.instance.doc(extrairValor(item, "lojaRef"));
      bool nacional = extrairValor(item, "nacional").toLowerCase() == "sim";
      double preco = parseCurrency(extrairValor(item, "valor_unidade"));
      double precoAntes = parseCurrency(extrairValor(item, "valor_antes"));
      int quantidade = int.tryParse(extrairValor(item, "quantidade")) ?? 1;
      bool selecionado =
          extrairValor(item, "selecionado").toLowerCase() == "sim";
      String variante =
          extrairValor(item, "variante"); // Extrai a variante (string)
      double afiliadoComissao =
          double.tryParse(extrairValor(item, "afiliadoComissao")) ?? 0.0;
      DocumentReference? afiliadoRef = extrairValor(item, "afiliadoRef")
              .isNotEmpty
          ? FirebaseFirestore.instance.doc(extrairValor(item, "afiliadoRef"))
          : null;
      DocumentReference? variacaoRef = extrairValor(item, "variacaoRef")
              .isNotEmpty
          ? FirebaseFirestore.instance.doc(extrairValor(item, "variacaoRef"))
          : null;

      if (titulo.isNotEmpty) {
        // Criar documento no carrinho com todos os campos convertidos
        DocumentReference docRef = await carrinhoCollection.add({
          'titulo': titulo,
          'foto_capa': fotoCapa,
          'data_adicao': dataAdicao,
          'itens': itens,
          'lojaRef': lojaRef,
          'nacional': nacional,
          'preco': preco,
          'preco_antes': precoAntes,
          'quantidade': quantidade,
          'selecionado': selecionado,
          'userRef': userRef,
          'data_criacao': FieldValue.serverTimestamp(),
          'afiliadoComissao': afiliadoComissao,
          if (afiliadoRef != null) 'afiliadoRef': afiliadoRef,
          if (variante.isNotEmpty)
            'variacao': variante, // Campo de string simples
          if (variacaoRef != null)
            'variacaoRef': variacaoRef, // Campo de referência
        });

        documentosCriados.add(docRef.id);
      }
    }

    return documentosCriados;
  } catch (e) {
    print("Erro ao criar documentos do carrinho: $e");
    return [];
  }
}

// Função para converter string de data para DateTime
DateTime parseDateTime(String dateString) {
  try {
    // Formato esperado: "16/05/2025 22:35"
    List<String> parts = dateString.split(' ');
    List<String> dateParts = parts[0].split('/');
    List<String> timeParts = parts[1].split(':');

    return DateTime(
      int.parse(dateParts[2]), // ano
      int.parse(dateParts[1]), // mês
      int.parse(dateParts[0]), // dia
      int.parse(timeParts[0]), // hora
      int.parse(timeParts[1]), // minuto
    );
  } catch (e) {
    print("Erro ao converter data: $e");
    return DateTime.now();
  }
}

// Função para converter valor monetário para double
double parseCurrency(String currencyValue) {
  try {
    // Remove "R$", espaços e substitui vírgula por ponto
    String cleaned = currencyValue
        .replaceAll('R\$', '')
        .replaceAll(' ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');

    return double.parse(cleaned);
  } catch (e) {
    print("Erro ao converter valor monetário: $e");
    return 0.0;
  }
}
