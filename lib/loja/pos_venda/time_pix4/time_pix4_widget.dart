import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'time_pix4_model.dart';
export 'time_pix4_model.dart';

class TimePix4Widget extends StatefulWidget {
  const TimePix4Widget({
    super.key,
    required this.data,
  });

  final DateTime? data;

  @override
  State<TimePix4Widget> createState() => _TimePix4WidgetState();
}

class _TimePix4WidgetState extends State<TimePix4Widget> {
  late TimePix4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePix4Model());

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
            color: Color(0xFF45454D),
            fontSize: 13.0,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
          ),
    );
  }
}
