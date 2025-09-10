// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<bool> detectarAndroidOuIOS() async {
  if (kIsWeb) {
    // Na web, não temos como detectar com certeza sem dart:html
    return false; // Assume como iOS (ou altere para seu caso de uso padrão)
  }

  // Para mobile
  return Platform.isAndroid; // true para Android, false para iOS
}
