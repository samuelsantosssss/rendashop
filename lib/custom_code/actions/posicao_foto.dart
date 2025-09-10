// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> posicaoFoto(
  int index,
  String lado,
) async {
  // Acessa a lista de fotos do AppState
  List<String> fotoProduto = FFAppState().fotoProduto.toList();

  // Verifica se a lista tem pelo menos 2 elementos e se o index é válido
  if (fotoProduto.length < 2 || index < 0 || index >= fotoProduto.length) {
    return; // Não faz nada se as condições não forem atendidas
  }

  // Realiza a troca de posição conforme o lado especificado
  if (lado == 'cima' && index > 0) {
    // Move para cima (troca com o elemento anterior)
    String foto = fotoProduto.removeAt(index);
    fotoProduto.insert(index - 1, foto);
  } else if (lado == 'baixo' && index < fotoProduto.length - 1) {
    // Move para baixo (troca com o próximo elemento)
    String foto = fotoProduto.removeAt(index);
    fotoProduto.insert(index + 1, foto);
  }

  // Atualiza o AppState com a nova ordem
  FFAppState().update(() {
    FFAppState().fotoProduto = fotoProduto;
  });
}
