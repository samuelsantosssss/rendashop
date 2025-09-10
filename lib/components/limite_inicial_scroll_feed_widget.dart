import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'limite_inicial_scroll_feed_model.dart';
export 'limite_inicial_scroll_feed_model.dart';

class LimiteInicialScrollFeedWidget extends StatefulWidget {
  const LimiteInicialScrollFeedWidget({super.key});

  @override
  State<LimiteInicialScrollFeedWidget> createState() =>
      _LimiteInicialScrollFeedWidgetState();
}

class _LimiteInicialScrollFeedWidgetState
    extends State<LimiteInicialScrollFeedWidget> {
  late LimiteInicialScrollFeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimiteInicialScrollFeedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().limiteVistualizacaoProdutoHomePage = 0;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 1.0,
      height: 1.0,
      decoration: BoxDecoration(),
    );
  }
}
