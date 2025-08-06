import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carregando23_model.dart';
export 'carregando23_model.dart';

class Carregando23Widget extends StatefulWidget {
  const Carregando23Widget({super.key});

  @override
  State<Carregando23Widget> createState() => _Carregando23WidgetState();
}

class _Carregando23WidgetState extends State<Carregando23Widget> {
  late Carregando23Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando23Model());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().dataFiltroAfiliado =
                            functions.filtroAfiliadoHoje();
                        FFAppState().corFiltroAfiliado = 'hoje';
                        FFAppState().update(() {});
                        _model.query1 = await queryPedidosTotalRecordOnce(
                          queryBuilder: (pedidosTotalRecord) =>
                              pedidosTotalRecord
                                  .where(
                                    'data_pedido',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().dataFiltroAfiliado,
                                  )
                                  .where(
                                    'afiliadoRef',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'status_pagamento',
                                    isEqualTo: 'pago',
                                  ),
                        );
                        FFAppState().listaFiltroAfiliado = functions
                            .listaFiltroAfiliado(3)
                            .toList()
                            .cast<int>();
                        FFAppState().filtroGraficoyAfiliado = functions
                            .filtroGraficoyAfiliado(_model.query1!.toList(), 1)
                            .toList()
                            .cast<double>();
                        FFAppState().update(() {});

                        safeSetState(() {});
                      },
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(
                          color: () {
                            if (FFAppState().corFiltroAfiliado == 'hoje') {
                              return FlutterFlowTheme.of(context).primary;
                            } else if (FFAppState().corFiltroAfiliado == null ||
                                FFAppState().corFiltroAfiliado == '') {
                              return FlutterFlowTheme.of(context).primary;
                            } else {
                              return Colors.white;
                            }
                          }(),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Hoje',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: () {
                                      if (FFAppState().corFiltroAfiliado ==
                                          'hoje') {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      } else if (FFAppState()
                                                  .corFiltroAfiliado ==
                                              null ||
                                          FFAppState().corFiltroAfiliado ==
                                              '') {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryText;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().dataFiltroAfiliado =
                            functions.filtroAfiliado7diasAtras();
                        FFAppState().corFiltroAfiliado = '7dias';
                        FFAppState().update(() {});
                        _model.query2 = await queryPedidosTotalRecordOnce(
                          queryBuilder: (pedidosTotalRecord) =>
                              pedidosTotalRecord
                                  .where(
                                    'data_pedido',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().dataFiltroAfiliado,
                                  )
                                  .where(
                                    'afiliadoRef',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'status_pagamento',
                                    isEqualTo: 'pago',
                                  ),
                        );
                        FFAppState().listaFiltroAfiliado = functions
                            .listaFiltroAfiliado(8)
                            .toList()
                            .cast<int>();
                        FFAppState().filtroGraficoyAfiliado = functions
                            .filtroGraficoyAfiliado(_model.query2!.toList(), 7)
                            .toList()
                            .cast<double>();
                        FFAppState().update(() {});

                        safeSetState(() {});
                      },
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(
                          color: FFAppState().corFiltroAfiliado == '7dias'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Últimos 7 dias',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppState().corFiltroAfiliado ==
                                            '7dias'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().dataFiltroAfiliado =
                            functions.filtroAfiliado30diasAtras();
                        FFAppState().corFiltroAfiliado = '30dias';
                        FFAppState().update(() {});
                        _model.query3 = await queryPedidosTotalRecordOnce(
                          queryBuilder: (pedidosTotalRecord) =>
                              pedidosTotalRecord
                                  .where(
                                    'data_pedido',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().dataFiltroAfiliado,
                                  )
                                  .where(
                                    'afiliadoRef',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'status_pagamento',
                                    isEqualTo: 'pago',
                                  ),
                        );
                        FFAppState().listaFiltroAfiliado = functions
                            .listaFiltroAfiliado(31)
                            .toList()
                            .cast<int>();
                        FFAppState().filtroGraficoyAfiliado = functions
                            .filtroGraficoyAfiliado(_model.query3!.toList(), 30)
                            .toList()
                            .cast<double>();
                        safeSetState(() {});

                        safeSetState(() {});
                      },
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(
                          color: FFAppState().corFiltroAfiliado == '30dias'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Últimos 30 dias',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppState().corFiltroAfiliado ==
                                            '30dias'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().dataFiltroAfiliado =
                            functions.filtroAfiliado90diasAtras();
                        FFAppState().corFiltroAfiliado = '90dias';
                        FFAppState().update(() {});
                        _model.query4 = await queryPedidosTotalRecordOnce(
                          queryBuilder: (pedidosTotalRecord) =>
                              pedidosTotalRecord
                                  .where(
                                    'data_pedido',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().dataFiltroAfiliado,
                                  )
                                  .where(
                                    'afiliadoRef',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'status_pagamento',
                                    isEqualTo: 'pago',
                                  ),
                        );
                        FFAppState().listaFiltroAfiliado = functions
                            .listaFiltroAfiliado(91)
                            .toList()
                            .cast<int>();
                        FFAppState().filtroGraficoyAfiliado = functions
                            .filtroGraficoyAfiliado(_model.query4!.toList(), 90)
                            .toList()
                            .cast<double>();
                        FFAppState().update(() {});

                        safeSetState(() {});
                      },
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(
                          color: FFAppState().corFiltroAfiliado == '90dias'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Últimos 90 dias',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppState().corFiltroAfiliado ==
                                            '90dias'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().dataFiltroAfiliado =
                            functions.filtroAfiliado24Meses();
                        FFAppState().corFiltroAfiliado = '24meses';
                        safeSetState(() {});
                        _model.query5 = await queryPedidosTotalRecordOnce(
                          queryBuilder: (pedidosTotalRecord) =>
                              pedidosTotalRecord
                                  .where(
                                    'data_pedido',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().dataFiltroAfiliado,
                                  )
                                  .where(
                                    'afiliadoRef',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'status_pagamento',
                                    isEqualTo: 'pago',
                                  ),
                        );
                        FFAppState().listaFiltroAfiliado = functions
                            .listaFiltroAfiliado(731)
                            .toList()
                            .cast<int>();
                        FFAppState().filtroGraficoyAfiliado = functions
                            .filtroGraficoyAfiliado(
                                _model.query5!.toList(), 730)
                            .toList()
                            .cast<double>();
                        safeSetState(() {});

                        safeSetState(() {});
                      },
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(
                          color: FFAppState().corFiltroAfiliado == '24meses'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Text(
                              '24 Meses',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppState().corFiltroAfiliado ==
                                            '24meses'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
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
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 0.0),
              child: Text(
                'R\$ 0,00',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFF434343),
                      fontSize: 21.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 0.0, 5.0),
              child: Text(
                '0 Pedidos',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 192.2,
              child: FlutterFlowLineChart(
                data: [
                  FFLineChartData(
                    xData: FFAppState().listaFiltroAfiliado,
                    yData: FFAppState().filtroGraficoyAfiliado,
                    settings: LineChartBarData(
                      color: FlutterFlowTheme.of(context).primary,
                      barWidth: 1.7,
                      isCurved: true,
                      preventCurveOverShooting: true,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Color(0x534AA756),
                      ),
                    ),
                  )
                ],
                chartStylingInfo: ChartStylingInfo(
                  enableTooltip: true,
                  tooltipBackgroundColor: Color(0x534AA756),
                  backgroundColor: Color(0x00FFFFFF),
                  showGrid: true,
                  showBorder: false,
                ),
                axisBounds: AxisBounds(),
                xAxisLabelInfo: AxisLabelInfo(
                  reservedSize: 32.0,
                ),
                yAxisLabelInfo: AxisLabelInfo(
                  reservedSize: 40.0,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 11.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x534AA756), Color(0x004AA756)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 9.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Central Vendedor',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF464647),
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(MeusProdutosAfiliadoWidget.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 42.32,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.storefront_outlined,
                                  color: Color(0xFF464647),
                                  size: 21.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Meus Produtos',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.navigate_next_outlined,
                                      color: Color(0xFF75787A),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(MinhasVendasWidget.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 42.3,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14.0, 0.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.coins,
                                  color: Color(0xFF464647),
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Minhas Vendas',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.navigate_next_outlined,
                                      color: Color(0xFF75787A),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
