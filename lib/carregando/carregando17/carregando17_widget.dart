import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'carregando17_model.dart';
export 'carregando17_model.dart';

class Carregando17Widget extends StatefulWidget {
  const Carregando17Widget({super.key});

  @override
  State<Carregando17Widget> createState() => _Carregando17WidgetState();
}

class _Carregando17WidgetState extends State<Carregando17Widget> {
  late Carregando17Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando17Model());

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
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 137.7,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(9.0, 13.0, 5.0, 0.0),
                    child: Container(
                      width: 110.0,
                      height: 21.0,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 35.0, 5.0, 0.0),
                        child: Container(
                          width: 19.59,
                          height: 22.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 13.0, 5.0, 0.0),
                        child: Container(
                          width: 59.3,
                          height: 60.71,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                9.0, 19.0, 5.0, 0.0),
                            child: Container(
                              width: 115.0,
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
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 61.0, 22.0, 0.0),
                          child: Container(
                            width: 83.0,
                            height: 26.0,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 137.7,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(9.0, 13.0, 5.0, 0.0),
                    child: Container(
                      width: 110.0,
                      height: 21.0,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 35.0, 5.0, 0.0),
                        child: Container(
                          width: 19.6,
                          height: 22.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 13.0, 5.0, 0.0),
                        child: Container(
                          width: 59.3,
                          height: 60.71,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                9.0, 19.0, 5.0, 0.0),
                            child: Container(
                              width: 115.0,
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
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 61.0, 22.0, 0.0),
                          child: Container(
                            width: 83.0,
                            height: 26.0,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 137.7,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(9.0, 13.0, 5.0, 0.0),
                    child: Container(
                      width: 110.0,
                      height: 21.0,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 35.0, 5.0, 0.0),
                        child: Container(
                          width: 19.6,
                          height: 22.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 13.0, 5.0, 0.0),
                        child: Container(
                          width: 59.3,
                          height: 60.71,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                9.0, 19.0, 5.0, 0.0),
                            child: Container(
                              width: 115.0,
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
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 61.0, 22.0, 0.0),
                          child: Container(
                            width: 83.0,
                            height: 26.0,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
