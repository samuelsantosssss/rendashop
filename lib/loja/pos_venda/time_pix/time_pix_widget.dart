import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'time_pix_model.dart';
export 'time_pix_model.dart';

class TimePixWidget extends StatefulWidget {
  const TimePixWidget({
    super.key,
    required this.data,
  });

  final DateTime? data;

  @override
  State<TimePixWidget> createState() => _TimePixWidgetState();
}

class _TimePixWidgetState extends State<TimePixWidget> {
  late TimePixModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePixModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
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
    return FlutterFlowTimer(
      initialTime: functions.timePix(widget.data!),
      getDisplayTime: (value) =>
          StopWatchTimer.getDisplayTime(value, milliSecond: false),
      controller: _model.timerController,
      updateStateInterval: Duration(milliseconds: 1000),
      onChanged: (value, displayTime, shouldUpdate) {
        _model.timerMilliseconds = value;
        _model.timerValue = displayTime;
        if (shouldUpdate) safeSetState(() {});
      },
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).headlineSmall.override(
            font: GoogleFonts.interTight(
              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
            ),
            color: Color(0xFFF8625F),
            fontSize: 14.0,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
          ),
    );
  }
}
