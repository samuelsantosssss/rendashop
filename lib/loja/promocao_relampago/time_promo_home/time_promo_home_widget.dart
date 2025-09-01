import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_promo_home_model.dart';
export 'time_promo_home_model.dart';

class TimePromoHomeWidget extends StatefulWidget {
  const TimePromoHomeWidget({super.key});

  @override
  State<TimePromoHomeWidget> createState() => _TimePromoHomeWidgetState();
}

class _TimePromoHomeWidgetState extends State<TimePromoHomeWidget> {
  late TimePromoHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePromoHomeModel());

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
            fontSize: 11.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
    );
  }
}
