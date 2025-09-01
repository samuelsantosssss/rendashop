// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

class WidgetAction extends StatefulWidget {
  const WidgetAction({
    super.key,
    this.width,
    this.height,
    this.nameOfCaptureImage,
    this.iconSizeButton,
    this.colorButton,
    required this.screenshotFFpage,
  });

  final double? width;
  final double? height;
  final String? nameOfCaptureImage;
  final double? iconSizeButton;
  final Color? colorButton;
  final Widget Function() screenshotFFpage;

  @override
  _WidgetActionState createState() => _WidgetActionState();
}

class _WidgetActionState extends State<WidgetAction> {
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Screenshot(
          controller: screenshotController,
          child: SingleChildScrollView(
            child: widget.screenshotFFpage(),
          ),
        ),
        Container(
          width: 40, // Largura do botão
          height: 40, // Altura do botão
          decoration: BoxDecoration(
            color: Color(0xFF1a3740), // Cor de fundo do botão
            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
          ),
          child: IconButton(
            onPressed: () {
              screenshotController
                  .capture(delay: Duration(milliseconds: 10))
                  .then((capturedImage) async {
                if (kIsWeb) {
                  final xFile = XFile.fromData(capturedImage!,
                      name: '${widget.nameOfCaptureImage ?? 'image'}.jpg');
                  await Share.shareXFiles([xFile]);
                } else {
                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/image.jpg';

                  File(path).writeAsBytesSync(capturedImage!);

                  final xFile = XFile(path);
                  await Share.shareXFiles([xFile]);
                }
              });
            },
            iconSize: 24, // Tamanho do ícone
            icon: const Icon(
              Icons.share, // Ícone de compartilhamento
              color: Colors.white, // Cor do ícone
            ),
          ),
        ),
      ],
    );
  }
}
