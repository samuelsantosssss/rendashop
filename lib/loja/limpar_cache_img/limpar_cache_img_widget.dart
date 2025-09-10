import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'limpar_cache_img_model.dart';
export 'limpar_cache_img_model.dart';

class LimparCacheImgWidget extends StatefulWidget {
  const LimparCacheImgWidget({super.key});

  @override
  State<LimparCacheImgWidget> createState() => _LimparCacheImgWidgetState();
}

class _LimparCacheImgWidgetState extends State<LimparCacheImgWidget> {
  late LimparCacheImgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimparCacheImgModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().imageCacheInit) {
        await actions.setupImageCacheLimits();
        FFAppState().imageCacheInit = true;
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
