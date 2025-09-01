// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports já existentes
// ... outros imports

// Adicione este import para o url_launcher
import 'package:url_launcher/url_launcher.dart';

// ... seu código

Future<void> alertLinkWeb(String url) async {
  String formattedUrl = url;

  // Corrigindo a condição do if
  if (!formattedUrl.startsWith('http://') &&
      !formattedUrl.startsWith('https://')) {
    formattedUrl = 'https://$formattedUrl';
  }

  // Corrigindo a verificação canLaunch e usando launchUrl
  final Uri uri = Uri.parse(formattedUrl);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    debugPrint('Erro ao abrir a URL: $formattedUrl');
  }
}
