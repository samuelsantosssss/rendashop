import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'carregando16_model.dart';
export 'carregando16_model.dart';

class Carregando16Widget extends StatefulWidget {
  const Carregando16Widget({super.key});

  @override
  State<Carregando16Widget> createState() => _Carregando16WidgetState();
}

class _Carregando16WidgetState extends State<Carregando16Widget> {
  late Carregando16Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando16Model());

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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 6.0, 5.0, 0.0),
                          child: Container(
                            width: 91.0,
                            height: 19.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFA1A1A1),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  Color(0xFFA1A1A1)
                                ],
                                stops: [0.0, 1.0, 1.0],
                                begin: AlignmentDirectional(1.0, -1.0),
                                end: AlignmentDirectional(-1.0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                        child: Container(
                          width: 67.7,
                          height: 71.1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFA1A1A1),
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                Color(0xFFA1A1A1)
                              ],
                              stops: [0.0, 1.0, 1.0],
                              begin: AlignmentDirectional(1.0, -1.0),
                              end: AlignmentDirectional(-1.0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 5.0, 0.0),
                                child: Container(
                                  width: 150.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 0.0, 0.0),
                                child: Container(
                                  width: 90.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 10.0, 0.0),
                                child: Container(
                                  width: 72.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 10.0, 0.0),
                                child: Container(
                                  width: 140.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 30.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFA1A1A1),
                            FlutterFlowTheme.of(context).secondaryBackground,
                            Color(0xFFA1A1A1)
                          ],
                          stops: [0.0, 1.0, 1.0],
                          begin: AlignmentDirectional(1.0, -1.0),
                          end: AlignmentDirectional(-1.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 6.0, 5.0, 0.0),
                          child: Container(
                            width: 91.0,
                            height: 19.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFA1A1A1),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  Color(0xFFA1A1A1)
                                ],
                                stops: [0.0, 1.0, 1.0],
                                begin: AlignmentDirectional(1.0, -1.0),
                                end: AlignmentDirectional(-1.0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                        child: Container(
                          width: 67.7,
                          height: 71.1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFA1A1A1),
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                Color(0xFFA1A1A1)
                              ],
                              stops: [0.0, 1.0, 1.0],
                              begin: AlignmentDirectional(1.0, -1.0),
                              end: AlignmentDirectional(-1.0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 5.0, 0.0),
                                child: Container(
                                  width: 150.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 0.0, 0.0),
                                child: Container(
                                  width: 90.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 10.0, 0.0),
                                child: Container(
                                  width: 72.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 10.0, 0.0),
                                child: Container(
                                  width: 140.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA1A1A1),
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        Color(0xFFA1A1A1)
                                      ],
                                      stops: [0.0, 1.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -1.0),
                                      end: AlignmentDirectional(-1.0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 30.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFA1A1A1),
                            FlutterFlowTheme.of(context).secondaryBackground,
                            Color(0xFFA1A1A1)
                          ],
                          stops: [0.0, 1.0, 1.0],
                          begin: AlignmentDirectional(1.0, -1.0),
                          end: AlignmentDirectional(-1.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
