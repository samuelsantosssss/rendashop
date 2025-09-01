import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'carregando8_model.dart';
export 'carregando8_model.dart';

class Carregando8Widget extends StatefulWidget {
  const Carregando8Widget({super.key});

  @override
  State<Carregando8Widget> createState() => _Carregando8WidgetState();
}

class _Carregando8WidgetState extends State<Carregando8Widget> {
  late Carregando8Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando8Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: 54.6,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 15.0),
          child: Container(
            width: double.infinity,
            height: 207.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFCCCCCC),
                      Color(0xFFEEEEEE),
                      Color(0xFFCCCCCC)
                    ],
                    stops: [0.0, 1.0, 1.0],
                    begin: AlignmentDirectional(1.0, -1.0),
                    end: AlignmentDirectional(-1.0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 202.47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFCCCCCC),
                      Color(0xFFEEEEEE),
                      Color(0xFFCCCCCC)
                    ],
                    stops: [0.0, 1.0, 1.0],
                    begin: AlignmentDirectional(1.0, -1.0),
                    end: AlignmentDirectional(-1.0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 100.91,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFCCCCCC),
                      Color(0xFFEEEEEE),
                      Color(0xFFCCCCCC)
                    ],
                    stops: [0.0, 1.0, 1.0],
                    begin: AlignmentDirectional(1.0, -1.0),
                    end: AlignmentDirectional(-1.0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 66.21,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFCCCCCC),
                      Color(0xFFEEEEEE),
                      Color(0xFFCCCCCC)
                    ],
                    stops: [0.0, 1.0, 1.0],
                    begin: AlignmentDirectional(1.0, -1.0),
                    end: AlignmentDirectional(-1.0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
