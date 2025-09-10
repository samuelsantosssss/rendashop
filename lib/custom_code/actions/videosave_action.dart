// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:io' as io;
import 'package:permission_handler/permission_handler.dart';
import 'dart:html'
    if (dart.library.io) '/custom_code/actions/download_file.dart' as html;
import 'package:http/http.dart' as http;

Future videosaveAction(
  BuildContext context,
  String video,
) async {
  try {
    String directoryPath = '';

    if (kIsWeb) {
      directoryPath = '/downloads';
    } else {
      io.Directory? directory;
      try {
        await Permission.storage.request();
        await Permission.manageExternalStorage.request();
        if (io.Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          directory = io.Directory('/storage/emulated/0/Download');

          if (!await directory.exists())
            directory = await getExternalStorageDirectory();
        }
      } catch (err, stack) {
        print("Cannot get download folder path");
      }
      directoryPath = directory?.path ?? '';
    }

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');

    final name = 'video_$time';

    final filePath = '$directoryPath/$name.mp4';

    final response = await http.get(Uri.parse(video));
    List<int> videoBytes = response.bodyBytes;
    print('Video downloaded. Bytes: ${videoBytes.length}');

    Uint8List videoData = Uint8List.fromList(videoBytes);

    if (kIsWeb) {
      if (video != null) {
        final blob = html.Blob([videoData]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..target = 'web-save-audio'
          ..download = '$name.mp4'
          ..click();
        html.Url.revokeObjectUrl(url);
      }
    } else {
      io.File file = io.File(filePath);
      await file.writeAsBytes(videoData);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Video downloaded successfully to the gallery!'),
        duration: Duration(seconds: 7),
      ),
    );
  } catch (error) {
    print('Error:  $error');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao baixar o vídeo: $error'),
        duration: Duration(seconds: 7),
      ),
    );
  }
}
