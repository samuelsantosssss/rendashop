import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_promo_model.dart';
export 'time_promo_model.dart';

class TimePromoWidget extends StatefulWidget {
  const TimePromoWidget({super.key});

  @override
  State<TimePromoWidget> createState() => _TimePromoWidgetState();
}

class _TimePromoWidgetState extends State<TimePromoWidget> {
  late TimePromoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePromoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while ((isAndroid == true) ||
          (isiOS == true) ||
          (isWeb == true) ||
          (kDebugMode == true)) {
        FFAppState().cronometoPromo =
            functions.timePromo(FFAppState().horaPromo);
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

    return Text(
      FFAppState().cronometoPromo,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            color: FlutterFlowTheme.of(context).secondaryBackground,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
    );
  }
}
