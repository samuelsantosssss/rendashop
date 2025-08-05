import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_pix3_model.dart';
export 'time_pix3_model.dart';

class TimePix3Widget extends StatefulWidget {
  const TimePix3Widget({
    super.key,
    required this.vencimentoData,
  });

  final DateTime? vencimentoData;

  @override
  State<TimePix3Widget> createState() => _TimePix3WidgetState();
}

class _TimePix3WidgetState extends State<TimePix3Widget> {
  late TimePix3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePix3Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (loggedIn) {
        FFAppState().pixTimeLimite =
            functions.contagemregressivaPix(widget.vencimentoData!);
        safeSetState(() {});
        await Future.delayed(
          Duration(
            milliseconds: 1000,
          ),
        );
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

    return Align(
      alignment: AlignmentDirectional(1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
        child: Text(
          FFAppState().pixTimeLimite,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
      ),
    );
  }
}
