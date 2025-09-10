import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'limpa_cache2_model.dart';
export 'limpa_cache2_model.dart';

class LimpaCache2Widget extends StatefulWidget {
  const LimpaCache2Widget({super.key});

  @override
  State<LimpaCache2Widget> createState() => _LimpaCache2WidgetState();
}

class _LimpaCache2WidgetState extends State<LimpaCache2Widget> {
  late LimpaCache2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimpaCache2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().limpaCache2 >= 6) {
        await actions.trimImageCacheNow();
        FFAppState().limpaCache2 = 0;
        safeSetState(() {});
      }
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
