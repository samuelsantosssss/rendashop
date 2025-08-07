// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

Future notificacaoVenda() async {
  // Add your function code here!
  final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
    'sendCustomNotification',
  );

  final dynamic results = await callable.call(<String, dynamic>{
    'recipientId': 'K5UU779ygGRgWfEQ6HwGG26u4ay1',
    'title': 'Venda Aprovada!',
    'body': 'Parabéns, você fez uma venda!',
  });
}
