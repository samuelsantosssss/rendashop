// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> trimImageCacheNow() async {
  final ImageCache cache = PaintingBinding.instance.imageCache;

  // Faxina LEVE: remove somente imagens que não estão sendo usadas no momento.
  cache.clear();

  // Se, em aparelhos muito fracos, ainda faltar memória, descomente a linha abaixo
  // (AGRESSIVO: pode causar recarregamento visual pontual).
  // cache.clearLiveImages();
}
