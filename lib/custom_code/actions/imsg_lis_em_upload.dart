// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// >>> Importações extras
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

/// Converte uma lista de strings (data URI/base64/URL) em
/// List<FFUploadedFile>.
///
/// - Data URI: "data:image/png;base64,AAAA..." - Base64 puro: "AAAA..."
/// (urlsafe aceito) - URL: http/https (Firebase Storage, Cloudinary, etc.)
///
/// Retorno: lista de FFUploadedFile preenchidos com name e bytes.
Future<List<FFUploadedFile>> imsgLisEmUpload(List<String> img) async {
  if (img.isEmpty) return <FFUploadedFile>[];

  // --- Helpers ---

  bool _looksLikeUrl(String s) =>
      s.startsWith('http://') || s.startsWith('https://');

  bool _looksLikeBareBase64(String s) {
    if (s.isEmpty) return false;
    final normalized = s.replaceAll(RegExp(r'\s+'), '');
    if (normalized.length < 8) return false;
    final valid = RegExp(r'^[A-Za-z0-9+/_-]+={0,2}$'); // aceita urlsafe
    return valid.hasMatch(normalized);
  }

  bool _isDataUri(String s) => s.startsWith('data:');

  // Extrai base64 e extensão de um data URI
  Map<String, String?> _parseDataUri(String s) {
    const prefix = 'data:';
    if (!s.startsWith(prefix)) return {'b64': null, 'ext': null};
    try {
      final commaIdx = s.indexOf(',');
      if (commaIdx == -1) return {'b64': null, 'ext': null};
      final meta = s.substring(0, commaIdx); // ex.: data:image/png;base64
      final b64 = s.substring(commaIdx + 1);

      String? ext;
      final mimeStart = prefix.length;
      final semiIdx = meta.indexOf(';', mimeStart);
      if (semiIdx > mimeStart) {
        final mime = meta.substring(mimeStart, semiIdx); // ex.: image/png
        final parts = mime.split('/');
        if (parts.length == 2 && parts[0] == 'image') {
          ext = parts[1].toLowerCase();
          if (ext == 'jpeg') ext = 'jpg';
          if (ext == 'svg+xml') ext = 'svg';
        }
      }
      return {'b64': b64, 'ext': ext};
    } catch (_) {
      return {'b64': null, 'ext': null};
    }
  }

  // Inferir extensão via content-type ou caminho da URL
  String _guessExt({String? urlPath, String? contentType}) {
    String? ext;
    if (contentType != null && contentType.startsWith('image/')) {
      ext = contentType.split('/').last.toLowerCase();
      if (ext == 'jpeg') ext = 'jpg';
    }
    if ((ext == null || ext.isEmpty) && urlPath != null) {
      final path = urlPath.toLowerCase();
      for (final k in [
        '.png',
        '.jpg',
        '.jpeg',
        '.webp',
        '.gif',
        '.bmp',
        '.svg'
      ]) {
        if (path.contains(k)) {
          ext = k.replaceFirst('.', '');
          if (ext == 'jpeg') ext = 'jpg';
          break;
        }
      }
    }
    return ext ?? 'jpg';
  }

  // Extrai nome de arquivo da URL (último segmento do path)
  String _fileNameFromUrl(String url) {
    try {
      final uri = Uri.parse(url);
      final segments = uri.pathSegments;
      if (segments.isEmpty) return 'image';
      final last =
          segments.lastWhere((s) => s.isNotEmpty, orElse: () => 'image');
      return last;
    } catch (_) {
      return 'image';
    }
  }

  // Download de URL (funciona Web + Mobile com pacote http)
  Future<({Uint8List bytes, String? contentType, String? fileName})?>
      _downloadUrl(String url) async {
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode < 200 || res.statusCode >= 300) return null;

      final ct = res.headers['content-type']; // p.ex. image/jpeg
      String? fn =
          res.headers['content-disposition']; // às vezes vem com filename=
      String? fileName;

      if (fn != null && fn.contains('filename=')) {
        // tenta extrair filename="..."
        final match = RegExp(r'filename\*?=([^;]+)').firstMatch(fn);
        if (match != null) {
          fileName = match.group(1)?.trim();
          // remove aspas se houver
          if (fileName != null &&
              fileName.startsWith('"') &&
              fileName.endsWith('"')) {
            fileName = fileName.substring(1, fileName.length - 1);
          }
        }
      }
      // fallback: pega do path
      fileName ??= _fileNameFromUrl(url);

      return (
        bytes: Uint8List.fromList(res.bodyBytes),
        contentType: ct,
        fileName: fileName
      );
    } catch (_) {
      return null;
    }
  }

  final List<FFUploadedFile> out = [];

  for (int i = 0; i < img.length; i++) {
    final s = img[i];
    if (s.isEmpty) continue;

    Uint8List? bytes;
    String fileName = 'image_$i';
    String? ext;

    try {
      // 1) Data URI
      final parsed = _parseDataUri(s);
      if (parsed['b64'] != null) {
        var b64 = parsed['b64']!.replaceAll(RegExp(r'\s+'), '');
        b64 =
            b64.replaceAll('-', '+').replaceAll('_', '/'); // urlsafe -> padrão
        bytes = base64Decode(b64);
        ext = parsed['ext'];
      }
      // 2) Base64 puro
      else if (_looksLikeBareBase64(s)) {
        var normalized = s.replaceAll(RegExp(r'\s+'), '');
        normalized = normalized.replaceAll('-', '+').replaceAll('_', '/');
        bytes = base64Decode(normalized);
        ext = 'jpg';
      }
      // 3) URL
      else if (_looksLikeUrl(s)) {
        final dl = await _downloadUrl(s);
        if (dl != null) {
          bytes = dl.bytes;
          ext = _guessExt(urlPath: s, contentType: dl.contentType);
          fileName = dl.fileName ?? fileName;
        }
      }
    } catch (_) {
      bytes = null;
    }

    // Finaliza nome/extensão
    if (ext == null || ext.isEmpty) ext = 'jpg';
    if (!fileName.toLowerCase().endsWith('.$ext')) {
      // se o fileName já tem outra extensão, mantemos e só garantimos uma extensão no final
      if (!fileName.contains('.')) {
        fileName = '$fileName.$ext';
      }
    }

    if (bytes != null) {
      out.add(FFUploadedFile(
        name: fileName,
        bytes: bytes,
      ));
    }
  }

  return out;
}
