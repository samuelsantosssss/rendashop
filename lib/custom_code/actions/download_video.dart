// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

Future<String> downloadVideo(String firebaseUrl) async {
  // Extrai o path codificado da URL
  final uri = Uri.parse(firebaseUrl);

  // Verifica se a URL tem o formato esperado
  if (uri.pathSegments.length < 3 || uri.pathSegments[2].isEmpty) {
    throw Exception('URL do Firebase Storage inválida.');
  }

  // Decodifica o path para obter o caminho no storage
  final encodedPath = uri.pathSegments[2]; // Exemplo: users%2Fabc%2Fvideo.mp4
  final storagePath = Uri.decodeComponent(encodedPath); // users/abc/video.mp4

  // Cria a referência no Firebase Storage
  final ref = FirebaseStorage.instance.ref().child(storagePath);

  // Obtém a URL de download (pode incluir token temporário)
  final downloadUrl = await ref.getDownloadURL();

  // Faz o download do vídeo
  final response = await http.get(Uri.parse(downloadUrl));

  // Obtém o diretório interno do app
  final appDir = await getApplicationDocumentsDirectory();

  // Cria o arquivo local com nome único
  final videoFile = File('${appDir.path}/${Uuid().v4()}.mp4');

  // Escreve os dados no arquivo
  await videoFile.writeAsBytes(response.bodyBytes);

  // Retorna o caminho local do vídeo salvo
  return videoFile.path;
}
