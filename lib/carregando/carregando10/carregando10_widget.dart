import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'carregando10_model.dart';
export 'carregando10_model.dart';

class Carregando10Widget extends StatefulWidget {
  const Carregando10Widget({super.key});

  @override
  State<Carregando10Widget> createState() => _Carregando10WidgetState();
}

class _Carregando10WidgetState extends State<Carregando10Widget> {
  late Carregando10Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando10Model());

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
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 5.0),
                          child: Container(
                            width: 52.0,
                            height: 8.0,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: 47.2,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Icon(
                                    Icons.circle_sharp,
                                    color: Color(0xFFBCBDBD),
                                    size: 11.0,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFBCBDBD),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 5.0),
                                        child: Container(
                                          width: 150.0,
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFA1A1A1),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                Color(0xFFA1A1A1)
                                              ],
                                              stops: [0.0, 1.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -1.0),
                                              end: AlignmentDirectional(
                                                  -1.0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                      ),
                                    ),
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
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 5.0),
                          child: Container(
                            width: 52.0,
                            height: 8.0,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: 47.2,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFBCBDBD),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Icon(
                                    Icons.circle_sharp,
                                    color: Color(0xFFBCBDBD),
                                    size: 11.0,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFBCBDBD),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 5.0),
                                        child: Container(
                                          width: 150.0,
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFA1A1A1),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                Color(0xFFA1A1A1)
                                              ],
                                              stops: [0.0, 1.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -1.0),
                                              end: AlignmentDirectional(
                                                  -1.0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                      ),
                                    ),
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
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 5.0),
                          child: Container(
                            width: 52.0,
                            height: 8.0,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: 47.2,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFBCBDBD),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Icon(
                                    Icons.circle_sharp,
                                    color: Color(0xFFBCBDBD),
                                    size: 11.0,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFBCBDBD),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 5.0),
                                        child: Container(
                                          width: 150.0,
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFA1A1A1),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                Color(0xFFA1A1A1)
                                              ],
                                              stops: [0.0, 1.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -1.0),
                                              end: AlignmentDirectional(
                                                  -1.0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                      ),
                                    ),
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
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 5.0),
                          child: Container(
                            width: 52.0,
                            height: 8.0,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: 47.2,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFBCBDBD),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Icon(
                                    Icons.circle_sharp,
                                    color: Color(0xFFBCBDBD),
                                    size: 11.0,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Container(
                                    width: 1.0,
                                    height: 19.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFBCBDBD),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 5.0),
                                        child: Container(
                                          width: 150.0,
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFA1A1A1),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                Color(0xFFA1A1A1)
                                              ],
                                              stops: [0.0, 1.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -1.0),
                                              end: AlignmentDirectional(
                                                  -1.0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                      ),
                                    ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
