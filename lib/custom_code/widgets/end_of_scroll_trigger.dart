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

import 'dart:async'; // <-- ADICIONE ESTA LINHA

class EndOfScrollTrigger extends StatefulWidget {
  const EndOfScrollTrigger({
    super.key,
    // <-- necessários pro FlutterFlow
    this.width,
    this.height,
    // params do widget
    required this.child,
    this.thresholdPx,
    this.debounceMs,
    this.onReachEnd,
  });

  // *** novos: FF injeta esses quando "Enforce Width and Height" está marcado
  final double? width;
  final double? height;

  // existentes
  final Widget Function() child;
  final double? thresholdPx; // pixels antes do fim para disparar
  final int? debounceMs; // evita múltiplos disparos seguidos
  final Future<void> Function()? onReachEnd;

  @override
  State<EndOfScrollTrigger> createState() => _EndOfScrollTriggerState();
}

class _EndOfScrollTriggerState extends State<EndOfScrollTrigger> {
  Timer? _debounce;

  bool _shouldEmit(ScrollMetrics m, double threshold) {
    // Quando estamos a 'threshold' px do fim, dispara
    final max = m.maxScrollExtent; // total scrollável
    final cur = m.pixels; // posição atual
    return (max - cur) <= threshold;
  }

  void _emitOnce() {
    // Debounce simples
    final ms = widget.debounceMs ?? 400;
    if (_debounce?.isActive ?? false) return;
    _debounce = Timer(Duration(milliseconds: ms), () {});
    final cb = widget.onReachEnd;
    if (cb != null) cb();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final threshold = widget.thresholdPx ?? 200.0;

    return SizedBox(
      width: widget.width, // respeita width/height que o FF passa
      height: widget.height, // (podem ser null; o SizedBox deixa "livre")
      child: NotificationListener<ScrollNotification>(
        onNotification: (n) {
          if (n is ScrollUpdateNotification || n is OverscrollNotification) {
            final metrics = n.metrics;
            if (_shouldEmit(metrics, threshold)) {
              _emitOnce();
            }
          }
          return false; // não consome a notificação
        },
        child: widget.child(),
      ),
    );
  }
}
