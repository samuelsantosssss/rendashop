// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> setupImageCacheLimits() async {
  // Acesso ao cache global de imagens do Flutter
  final ImageCache cache = PaintingBinding.instance.imageCache;

  // Limites sugeridos (ponto de partida)
  cache.maximumSize = 200; // menos entradas em cache (padrão ~1000)
  cache.maximumSizeBytes = 60 * 1024 * 1024; // ~60 MB

  // Limpeza inicial (leve). Evite usar isso toda hora.
  cache.clear();
  cache.clearLiveImages();

  // debugPrint('[ImageCache] maxEntries=${cache.maximumSize}, maxBytes=${cache.maximumSizeBytes}');
}
