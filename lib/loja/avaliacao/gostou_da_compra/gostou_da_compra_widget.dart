import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gostou_da_compra_model.dart';
export 'gostou_da_compra_model.dart';

class GostouDaCompraWidget extends StatefulWidget {
  const GostouDaCompraWidget({
    super.key,
    required this.pedidoRef,
  });

  final DocumentReference? pedidoRef;

  @override
  State<GostouDaCompraWidget> createState() => _GostouDaCompraWidgetState();
}

class _GostouDaCompraWidgetState extends State<GostouDaCompraWidget> {
  late GostouDaCompraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GostouDaCompraModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 155.71,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFF63C16F),
                              size: 40.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: Text(
                                'Gostou da sua compra?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: RatingBar.builder(
                                  onRatingUpdate: (newValue) async {
                                    safeSetState(
                                        () => _model.ratingBarValue = newValue);
                                    unawaited(
                                      () async {
                                        await widget!.pedidoRef!.update(
                                            createPedidosTotalRecordData(
                                          status: 'finalizado',
                                        ));
                                      }(),
                                    );
                                    Navigator.pop(context);

                                    context.pushNamed(
                                      CriarAvaliacaoWidget.routeName,
                                      queryParameters: {
                                        'pedidoRef2': serializeParam(
                                          widget!.pedidoRef,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    FFAppState().statusPreparando = false;
                                    FFAppState().statusNaopago = false;
                                    FFAppState().statusEnviado = false;
                                    FFAppState().statusReembolso = false;
                                    FFAppState().statusFinalizado = true;
                                    FFAppState().statusCancelado = false;
                                    safeSetState(() {});
                                  },
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFFCC10),
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating: _model.ratingBarValue ??= 0.0,
                                  unratedColor: Color(0x4B5E5E58),
                                  itemCount: 5,
                                  itemSize: 31.0,
                                  glowColor: Color(0xFFFFCC10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        unawaited(
                          () async {
                            await widget!.pedidoRef!
                                .update(createPedidosTotalRecordData(
                              status: 'finalizado',
                            ));
                          }(),
                        );
                        Navigator.pop(context);
                        FFAppState().statusPreparando = false;
                        FFAppState().statusNaopago = false;
                        FFAppState().statusEnviado = false;
                        FFAppState().statusReembolso = false;
                        FFAppState().statusFinalizado = true;
                        FFAppState().statusCancelado = false;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 31.0,
                        height: 31.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 3.0, 0.0),
                      child: Icon(
                        Icons.clear,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
