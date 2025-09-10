// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SmartImage extends StatelessWidget {
  const SmartImage({
    super.key,
    required this.url,
    // injetados pelo FF (toggle ligado)
    this.width,
    this.height,
    // seus overrides (painel)
    this.imgWidth,
    this.imgHeight,
    this.margem, // true => 3:4 ; false/null => 1:1
  });

  final String url;
  final double? width; // FF injeta
  final double? height; // FF injeta
  final double? imgWidth; // painel
  final double? imgHeight; // painel
  final bool? margem; // painel

  @override
  Widget build(BuildContext context) {
    final bool isMargem = margem ?? false;
    final double aspect = isMargem ? (3 / 4) : 1.0; // width/height
    const double defaultSize = 170.0;

    // 1) tamanhos "efetivos" preferidos (overrides do painel > tamanhos do FF)
    double? effW = imgWidth ?? width;
    double? effH = imgHeight ?? height;

    // 2) força proporção (anti-distorção)
    if (isMargem) {
      if (effW != null && effH == null) effH = effW / aspect;
      if (effH != null && effW == null) effW = effH * aspect;
      if (effW != null && effH != null)
        effH = effW / aspect; // ignora altura se vier
    } else {
      if (effW != null && effH == null) effH = effW; // 1:1
      if (effH != null && effW == null) effW = effH; // 1:1
    }

    // 3) fallbacks
    final double fbW = effW ?? defaultSize;
    final double fbH = effH ?? (isMargem ? (fbW / aspect) : fbW);
    if (url.isEmpty) return _errorBox(fbW, fbH);

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 4) dimensões reais no layout
          double logicalW = effW ?? constraints.maxWidth;
          if (!logicalW.isFinite) logicalW = fbW;
          double logicalH = effH ?? constraints.maxHeight;
          if (!logicalH.isFinite)
            logicalH = isMargem ? (logicalW / aspect) : logicalW;

          // 5) decode size (passando apenas um lado)
          final dpr = MediaQuery.of(context).devicePixelRatio.clamp(1.0, 3.0);
          final qualityBoost = (dpr < 1.5) ? 2.0 : 1.3;
          final targetW =
              (logicalW * dpr * qualityBoost).clamp(128.0, 3072.0).toInt();
          final targetH =
              (logicalH * dpr * qualityBoost).clamp(128.0, 3072.0).toInt();
          final bool isTall = logicalH >= logicalW;

          final provider = ResizeImage.resizeIfNeeded(
            isTall ? null : targetW, // limita pela largura se mais largo
            isTall ? targetH : null, // limita pela altura se mais alto
            NetworkImage(url),
          );

          final core = Image(
            image: provider,
            fit: BoxFit.cover, // cobre e recorta sem deformar
            alignment: Alignment.center,
            filterQuality:
                (dpr < 1.5) ? FilterQuality.high : FilterQuality.medium,
            gaplessPlayback: false,
            isAntiAlias: false,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return _skeletonBox(logicalW, logicalH);
            },
            errorBuilder: (context, error, stack) {
              return _errorBox(logicalW, logicalH);
            },
          );

          // 6) enquadre por AspectRatio e SizedBox quando necessário
          Widget framed;
          if (isMargem) {
            final ratioChild = AspectRatio(aspectRatio: aspect, child: core);
            if (effW != null && effH != null) {
              framed =
                  SizedBox(width: effW, child: ratioChild); // ignora altura
            } else if (effW != null) {
              framed = SizedBox(width: effW, child: ratioChild);
            } else if (effH != null) {
              framed = SizedBox(height: effH, child: ratioChild);
            } else {
              framed = ratioChild;
            }
          } else {
            final ratioChild = AspectRatio(aspectRatio: 1.0, child: core);
            if (effW != null && effH != null) {
              framed = SizedBox(width: effW, height: effH, child: core);
            } else if (effW != null) {
              framed = SizedBox(width: effW, child: ratioChild);
            } else if (effH != null) {
              framed = SizedBox(height: effH, child: ratioChild);
            } else {
              framed = ratioChild;
            }
          }

          // 7) bordas fixas: 5px no topo esquerdo e direito
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: framed,
          );
        },
      ),
    );
  }

  Widget _skeletonBox(double w, double h) {
    return Container(
      width: w,
      height: h,
      color: Colors.black12,
      alignment: Alignment.center,
      child: const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 1.6),
      ),
    );
  }

  Widget _errorBox(double w, double h) {
    return Container(
      width: w,
      height: h,
      color: Colors.black12,
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image_outlined, size: 20),
    );
  }
}
