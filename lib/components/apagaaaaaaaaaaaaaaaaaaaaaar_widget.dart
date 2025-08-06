import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'apagaaaaaaaaaaaaaaaaaaaaaar_model.dart';
export 'apagaaaaaaaaaaaaaaaaaaaaaar_model.dart';

class ApagaaaaaaaaaaaaaaaaaaaaaarWidget extends StatefulWidget {
  const ApagaaaaaaaaaaaaaaaaaaaaaarWidget({super.key});

  @override
  State<ApagaaaaaaaaaaaaaaaaaaaaaarWidget> createState() =>
      _ApagaaaaaaaaaaaaaaaaaaaaaarWidgetState();
}

class _ApagaaaaaaaaaaaaaaaaaaaaaarWidgetState
    extends State<ApagaaaaaaaaaaaaaaaaaaaaaarWidget> {
  late ApagaaaaaaaaaaaaaaaaaaaaaarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApagaaaaaaaaaaaaaaaaaaaaaarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().liberarMais = 8;
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

    return Container();
  }
}
