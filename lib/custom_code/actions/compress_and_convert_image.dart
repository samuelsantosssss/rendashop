// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

Future<String> compressAndConvertImage(FFUploadedFile uploadedFile) async {
  // Pega o diretório temporário para salvar a imagem comprimida.
  final tempDir = await getTemporaryDirectory();

  // Se o arquivo for nulo, retorna um erro.
  if (uploadedFile.bytes == null) {
    throw Exception('Os dados da imagem não podem ser nulos.');
  }

  // Cria um nome de arquivo único para a nova imagem em formato .webp.
  final targetPath =
      '${tempDir.path}/${DateTime.now().microsecondsSinceEpoch}.webp';

  // Comprime a imagem a partir dos bytes e salva o resultado em um novo arquivo.
  var compressedFileBytes = await FlutterImageCompress.compressWithList(
    uploadedFile.bytes!, // O '!' garante que os bytes não são nulos.
    minHeight: 1920,
    minWidth: 1080,
    quality: 85,
    format: CompressFormat.webp,
  );

  // Escreve os bytes comprimidos para o arquivo de destino.
  final compressedFileObject =
      await File(targetPath).writeAsBytes(compressedFileBytes);

  // Se a compressão funcionar, retorna o caminho do novo arquivo.
  if (compressedFileObject.path.isNotEmpty) {
    return compressedFileObject.path;
  } else {
    // Se a compressão falhar, retorna um erro.
    throw Exception('Falha ao comprimir a imagem.');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
