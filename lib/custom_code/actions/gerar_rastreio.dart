// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math'; // Importando corretamente a biblioteca de matemática para Random

Future<String> gerarRastreio(DocumentReference query) async {
  // Passo 1: Recuperar o documento "rastreio_geral"
  final documentSnapshot = await query.get();

  if (!documentSnapshot.exists) {
    throw Exception("O documento 'rastreio_geral' não foi encontrado.");
  }

  // Passo 2: Obter a lista de rastreios existente no campo 'lista_rastreios'
  final listaRastreios =
      List<String>.from(documentSnapshot.get('lista_rastreios') ?? []);

  // Passo 3: Gerar um código de rastreio único
  String novoRastreio = gerarCodigoRastreio();

  // Passo 4: Verificar se o código gerado já existe na lista de rastreios
  while (listaRastreios.contains(novoRastreio)) {
    novoRastreio = gerarCodigoRastreio(); // Se já existir, gera outro código
  }

  // Passo 5: Adicionar o código gerado à lista e atualizar o documento no Firestore
  listaRastreios.add(novoRastreio);

  await query.update({
    'lista_rastreios': listaRastreios,
  });

  // Passo 6: Retornar o código gerado
  return novoRastreio;
}

// Função para gerar um código de rastreio
String gerarCodigoRastreio() {
  const String prefix = 'BR';
  const int length = 25;
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  Random random = Random(); // Criando uma instância de Random

  // Gerar o código aleatório
  String rastreio = prefix;
  for (int i = 0; i < length; i++) {
    rastreio += chars[random.nextInt(chars
        .length)]; // Usando random.nextInt para pegar caracteres aleatórios
  }

  return rastreio;
}
