import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_loja_vendedor2_model.dart';
export 'home_loja_vendedor2_model.dart';

class HomeLojaVendedor2Widget extends StatefulWidget {
  const HomeLojaVendedor2Widget({
    super.key,
    required this.lojaRef,
  });

  final DocumentReference? lojaRef;

  static String routeName = 'home_loja_vendedor-2';
  static String routePath = '/homeLojaVendedor2';

  @override
  State<HomeLojaVendedor2Widget> createState() =>
      _HomeLojaVendedor2WidgetState();
}

class _HomeLojaVendedor2WidgetState extends State<HomeLojaVendedor2Widget> {
  late HomeLojaVendedor2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeLojaVendedor2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<LojasRecord>(
      stream: LojasRecord.getDocument(widget.lojaRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF5F5F5),
            body: Center(
              child: SizedBox(
                width: 26.0,
                height: 26.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 26.0,
                ),
              ),
            ),
          );
        }

        final homeLojaVendedor2LojasRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF5F5F5),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (isWeb == false)
                    Container(
                      width: double.infinity,
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 37.0,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 26.0, 0.0),
                                        child: Text(
                                          homeLojaVendedor2LojasRecord.nome,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 15.0, 0.0, 0.0),
                                  child: Container(
                                    width: 63.0,
                                    height: 63.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        homeLojaVendedor2LojasRecord.fotoperfil,
                                        'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(37).png?alt=media&token=97e66ecd-ec6f-4415-b1b0-23bb6aa9ac20',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  height: 76.0,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        functions.formatNumber(
                                                            homeLojaVendedor2LojasRecord
                                                                .seguidores
                                                                .length),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Seguidores',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        functions.formatNumber(
                                                            homeLojaVendedor2LojasRecord
                                                                .produtosVendidos),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Vendas',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        functions.formatNumber(
                                                            homeLojaVendedor2LojasRecord
                                                                .produtosTotal),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Produtos',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Stack(
                                          children: [
                                            if (homeLojaVendedor2LojasRecord
                                                    .seguidores
                                                    .contains(
                                                        currentUserReference) ==
                                                false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 11.0, 20.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (loggedIn) {
                                                      await homeLojaVendedor2LojasRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'seguidores':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      context.pushNamed(
                                                          LoginPrincipalWidget
                                                              .routeName);
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 27.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .storefront_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 19.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Seguir',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (homeLojaVendedor2LojasRecord
                                                    .seguidores
                                                    .contains(
                                                        currentUserReference) ==
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 11.0, 20.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (loggedIn) {
                                                      await homeLojaVendedor2LojasRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'seguidores':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      context.pushNamed(
                                                          LoginPrincipalWidget
                                                              .routeName);
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 27.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Seguindo',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().filtroPerfilLoja2 = 'itens';
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: 65.0,
                                    height: 34.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 7.0),
                                          child: Text(
                                            'Itens',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().filtroPerfilLoja2 ==
                                                            'itens'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        if (FFAppState().filtroPerfilLoja2 ==
                                            'itens')
                                          Container(
                                            width: 40.0,
                                            height: 2.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: StreamBuilder<List<AvaliacaoLojaRecord>>(
                                  stream: queryAvaliacaoLojaRecord(
                                    parent: widget.lojaRef,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 26.0,
                                          height: 26.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 26.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<AvaliacaoLojaRecord>
                                        containerAvaliacaoLojaRecordList =
                                        snapshot.data!;

                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().filtroPerfilLoja2 =
                                            'avaliacao';
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 127.0,
                                        height: 34.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 7.0),
                                                  child: Text(
                                                    'Avaliações',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                        .filtroPerfilLoja2 ==
                                                                    'avaliacao'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 7.0),
                                                  child: Text(
                                                    '(${functions.avaliacaoMediaLoja(containerAvaliacaoLojaRecordList.toList())}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                        .filtroPerfilLoja2 ==
                                                                    'avaliacao'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 7.0),
                                                  child: Icon(
                                                    Icons.star,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                                  .filtroPerfilLoja2 ==
                                                              'avaliacao'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                    ),
                                                    size: 15.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 7.0),
                                                  child: Text(
                                                    ')',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (FFAppState()
                                                    .filtroPerfilLoja2 ==
                                                'avaliacao')
                                              Container(
                                                width: 40.0,
                                                height: 2.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (FFAppState().filtroPerfilLoja2 == 'itens')
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().filtroPerfilLoja = 'relevancia';
                                  safeSetState(() {});
                                },
                                child: Text(
                                  'Relevância',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: valueOrDefault<Color>(
                                          FFAppState().filtroPerfilLoja ==
                                                  'relevancia'
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().filtroPerfilLoja = 'maisvendido';
                                  safeSetState(() {});
                                },
                                child: Text(
                                  'Mais vendidos',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: valueOrDefault<Color>(
                                          FFAppState()
                                                      .filtroPerfilLoja ==
                                                  'maisvendido'
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().filtroPerfilLoja = 'maisrecente';
                                  safeSetState(() {});
                                },
                                child: Text(
                                  'Mais recentes',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: valueOrDefault<Color>(
                                          FFAppState()
                                                      .filtroPerfilLoja ==
                                                  'maisrecente'
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Container(
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().filtroPerfilLoja =
                                            'precomais';
                                        safeSetState(() {});
                                      },
                                      child: Text(
                                        'Preço',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                (FFAppState().filtroPerfilLoja ==
                                                            'precomais') ||
                                                        (FFAppState()
                                                                .filtroPerfilLoja ==
                                                            'precomenos')
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().filtroPerfilLoja =
                                                'precomais';
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.arrow_drop_up_sharp,
                                            color: valueOrDefault<Color>(
                                              FFAppState().filtroPerfilLoja ==
                                                      'precomais'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            size: 24.0,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().filtroPerfilLoja =
                                                'precomenos';
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: valueOrDefault<Color>(
                                              FFAppState().filtroPerfilLoja ==
                                                      'precomenos'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (FFAppState().filtroPerfilLoja == 'precomais')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProdutoRecord>>(
                                  stream: queryProdutoRecord(
                                    queryBuilder: (produtoRecord) =>
                                        produtoRecord
                                            .where(
                                              'lojaRef',
                                              isEqualTo: widget.lojaRef,
                                            )
                                            .orderBy('preco', descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 26.0,
                                          height: 26.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 26.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProdutoRecord>
                                        staggeredViewProdutoRecordList =
                                        snapshot.data!;

                                    return MasonryGridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: valueOrDefault<int>(
                                          MediaQuery.sizeOf(context).width >=
                                                  500.0
                                              ? 5
                                              : 2,
                                          2,
                                        ),
                                      ),
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount:
                                          staggeredViewProdutoRecordList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewProdutoRecord =
                                            staggeredViewProdutoRecordList[
                                                staggeredViewIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PaginaProdutoWidget.routeName,
                                                  queryParameters: {
                                                    'produtoRef':
                                                        serializeParam(
                                                      staggeredViewProdutoRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                FFAppState().quantidadeProduto =
                                                    1;
                                                FFAppState()
                                                    .selecionarVariante1 = '';
                                                FFAppState()
                                                    .selecionarVariante2 = '';
                                                FFAppState()
                                                    .selecionarVariante1foto = '';
                                                FFAppState().verTudo = false;
                                                FFAppState().adicionarCarrinho =
                                                    false;
                                                safeSetState(() {});
                                                if ((currentUserDocument
                                                                ?.vistoRecente
                                                                .toList() ??
                                                            [])
                                                        .length ==
                                                    6) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayRemove([
                                                          (currentUserDocument
                                                                      ?.vistoRecente
                                                                      .toList() ??
                                                                  [])
                                                              .firstOrNull
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  7.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              staggeredViewProdutoRecord
                                                                          .margem ==
                                                                      'story'
                                                                  ? 250.0
                                                                  : 190.0,
                                                              190.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    staggeredViewProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull!,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                if (staggeredViewProdutoRecord
                                                                            .video !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            23.0,
                                                                        height:
                                                                            23.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x91272727),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              17.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (staggeredViewProdutoRecord
                                                                            .capsula1 !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x4E000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xBBFFFFFF),
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.4,
                                                                              0.2,
                                                                              0.4,
                                                                              0.2),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.5, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 9.5,
                                                                                  height: 9.5,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xE2FFFFFF),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 9.0,
                                                                                      height: 9.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        staggeredViewProdutoRecord.capsula1,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (staggeredViewProdutoRecord.capsula2 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula2,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsula3 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula3,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsulaExtra != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                  child: Text(
                                                                                    staggeredViewProdutoRecord.capsulaExtra,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              Container(
                                                                                width: 1.0,
                                                                                height: 0.5,
                                                                                decoration: BoxDecoration(),
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        5.0,
                                                                        9.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              29.0,
                                                                          height:
                                                                              16.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                            border: Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                            child: Text(
                                                                              functions.porcentagemPromo(staggeredViewProdutoRecord.precoAntes, staggeredViewProdutoRecord.titulo1 != '' ? staggeredViewProdutoRecord.menorPrecoRevenda : staggeredViewProdutoRecord.preco),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      staggeredViewProdutoRecord
                                                                          .nome
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF4C4D4F),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ProdutoRecord>>(
                                                                  stream:
                                                                      queryProdutoRecord(
                                                                    queryBuilder: (produtoRecord) =>
                                                                        produtoRecord
                                                                            .where(
                                                                              'categoria',
                                                                              isEqualTo: staggeredViewProdutoRecord.categoria,
                                                                            )
                                                                            .orderBy('vendas',
                                                                                descending: true),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              1.0,
                                                                          height:
                                                                              1.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x004AA756),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProdutoRecord>
                                                                        containerProdutoRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible: functions.maisVendidoBooleanFeed(
                                                                            staggeredViewProdutoRecord.reference,
                                                                            containerProdutoRecordList.toList(),
                                                                            staggeredViewProdutoRecord.vendas),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                13.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFFBF9E9),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(2.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Container(
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF5DB9D),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(9.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 5.0, 0.0),
                                                                                      child: Text(
                                                                                        '${functions.maisVendido(staggeredViewProdutoRecord.reference, containerProdutoRecordList.toList())}° Mais Vendido',
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFFC48730),
                                                                                              fontSize: 9.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'em ${staggeredViewProdutoRecord.categoria}'.maybeHandleOverflow(
                                                                                      maxChars: 14,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFFD4C1A2),
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.navigate_next,
                                                                                        color: Color(0xFFD4C1A2),
                                                                                        size: 12.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        'R\$ ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorRealString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorRealString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorCentavosEmString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorCentavosEmString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas >=
                                                                          1)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              staggeredViewProdutoRecord.vendas.toString(),
                                                                              '0',
                                                                            )}+ vendidos',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas ==
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star_half,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '(+100)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (staggeredViewProdutoRecord
                                                                        .freteRapido)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            7.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF2EA597),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                1.0,
                                                                                0.0,
                                                                                1.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.shippingFast,
                                                                                    color: Color(0xFF2EA597),
                                                                                    size: 9.0,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    'Chega em 3 dias',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF2EA597),
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (staggeredViewProdutoRecord
                                                                        .envioNaciona)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE8FBF1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                1.0,
                                                                                4.0,
                                                                                1.0),
                                                                            child:
                                                                                Text(
                                                                              'Envio Nacional',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF4F4C4C),
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                        ],
                                                      ),
                                                    ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.7,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 27.0,
                                                            height: 19.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.5,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 26.5,
                                                            height: 17.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF0E8E2D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Ainda_no_Existem_Pedidos_(10).png',
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .contain,
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().filtroPerfilLoja == 'precomenos')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProdutoRecord>>(
                                  stream: queryProdutoRecord(
                                    queryBuilder: (produtoRecord) =>
                                        produtoRecord
                                            .where(
                                              'lojaRef',
                                              isEqualTo: widget.lojaRef,
                                            )
                                            .orderBy('preco'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 26.0,
                                          height: 26.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 26.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProdutoRecord>
                                        staggeredViewProdutoRecordList =
                                        snapshot.data!;

                                    return MasonryGridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: valueOrDefault<int>(
                                          MediaQuery.sizeOf(context).width >=
                                                  500.0
                                              ? 5
                                              : 2,
                                          2,
                                        ),
                                      ),
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount:
                                          staggeredViewProdutoRecordList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewProdutoRecord =
                                            staggeredViewProdutoRecordList[
                                                staggeredViewIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PaginaProdutoWidget.routeName,
                                                  queryParameters: {
                                                    'produtoRef':
                                                        serializeParam(
                                                      staggeredViewProdutoRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                FFAppState().quantidadeProduto =
                                                    1;
                                                FFAppState()
                                                    .selecionarVariante1 = '';
                                                FFAppState()
                                                    .selecionarVariante2 = '';
                                                FFAppState()
                                                    .selecionarVariante1foto = '';
                                                FFAppState().verTudo = false;
                                                FFAppState().adicionarCarrinho =
                                                    false;
                                                safeSetState(() {});
                                                if ((currentUserDocument
                                                                ?.vistoRecente
                                                                .toList() ??
                                                            [])
                                                        .length ==
                                                    6) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayRemove([
                                                          (currentUserDocument
                                                                      ?.vistoRecente
                                                                      .toList() ??
                                                                  [])
                                                              .firstOrNull
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  7.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              staggeredViewProdutoRecord
                                                                          .margem ==
                                                                      'story'
                                                                  ? 250.0
                                                                  : 190.0,
                                                              190.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    staggeredViewProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull!,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                if (staggeredViewProdutoRecord
                                                                            .video !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            23.0,
                                                                        height:
                                                                            23.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x91272727),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              17.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (staggeredViewProdutoRecord
                                                                            .capsula1 !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x4E000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xBBFFFFFF),
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.4,
                                                                              0.2,
                                                                              0.4,
                                                                              0.2),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.5, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 9.5,
                                                                                  height: 9.5,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xE2FFFFFF),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 9.0,
                                                                                      height: 9.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        staggeredViewProdutoRecord.capsula1,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (staggeredViewProdutoRecord.capsula2 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula2,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsula3 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula3,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsulaExtra != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                  child: Text(
                                                                                    staggeredViewProdutoRecord.capsulaExtra,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              Container(
                                                                                width: 1.0,
                                                                                height: 0.5,
                                                                                decoration: BoxDecoration(),
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        5.0,
                                                                        9.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              29.0,
                                                                          height:
                                                                              16.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                            border: Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                            child: Text(
                                                                              functions.porcentagemPromo(staggeredViewProdutoRecord.precoAntes, staggeredViewProdutoRecord.titulo1 != '' ? staggeredViewProdutoRecord.menorPrecoRevenda : staggeredViewProdutoRecord.preco),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      staggeredViewProdutoRecord
                                                                          .nome
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF4C4D4F),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ProdutoRecord>>(
                                                                  stream:
                                                                      queryProdutoRecord(
                                                                    queryBuilder: (produtoRecord) =>
                                                                        produtoRecord
                                                                            .where(
                                                                              'categoria',
                                                                              isEqualTo: staggeredViewProdutoRecord.categoria,
                                                                            )
                                                                            .orderBy('vendas',
                                                                                descending: true),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              1.0,
                                                                          height:
                                                                              1.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x004AA756),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProdutoRecord>
                                                                        containerProdutoRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible: functions.maisVendidoBooleanFeed(
                                                                            staggeredViewProdutoRecord.reference,
                                                                            containerProdutoRecordList.toList(),
                                                                            staggeredViewProdutoRecord.vendas),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                13.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFFBF9E9),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(2.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Container(
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF5DB9D),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(9.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 5.0, 0.0),
                                                                                      child: Text(
                                                                                        '${functions.maisVendido(staggeredViewProdutoRecord.reference, containerProdutoRecordList.toList())}° Mais Vendido',
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFFC48730),
                                                                                              fontSize: 9.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'em ${staggeredViewProdutoRecord.categoria}'.maybeHandleOverflow(
                                                                                      maxChars: 14,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFFD4C1A2),
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.navigate_next,
                                                                                        color: Color(0xFFD4C1A2),
                                                                                        size: 12.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        'R\$ ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorRealString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorRealString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorCentavosEmString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorCentavosEmString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas >=
                                                                          1)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              staggeredViewProdutoRecord.vendas.toString(),
                                                                              '0',
                                                                            )}+ vendidos',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas ==
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star_half,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '(+100)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (staggeredViewProdutoRecord
                                                                        .freteRapido)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            7.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF2EA597),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                1.0,
                                                                                0.0,
                                                                                1.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.shippingFast,
                                                                                    color: Color(0xFF2EA597),
                                                                                    size: 9.0,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    'Chega em 3 dias',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF2EA597),
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (staggeredViewProdutoRecord
                                                                        .envioNaciona)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE8FBF1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                1.0,
                                                                                4.0,
                                                                                1.0),
                                                                            child:
                                                                                Text(
                                                                              'Envio Nacional',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF4F4C4C),
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                        ],
                                                      ),
                                                    ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.7,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 27.0,
                                                            height: 19.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.5,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 26.5,
                                                            height: 17.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF0E8E2D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Ainda_no_Existem_Pedidos_(10).png',
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .contain,
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().filtroPerfilLoja == 'maisrecente')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProdutoRecord>>(
                                  stream: queryProdutoRecord(
                                    queryBuilder: (produtoRecord) =>
                                        produtoRecord
                                            .where(
                                              'lojaRef',
                                              isEqualTo: widget.lojaRef,
                                            )
                                            .orderBy('data', descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 26.0,
                                          height: 26.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 26.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProdutoRecord>
                                        staggeredViewProdutoRecordList =
                                        snapshot.data!;

                                    return MasonryGridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: valueOrDefault<int>(
                                          MediaQuery.sizeOf(context).width >=
                                                  500.0
                                              ? 5
                                              : 2,
                                          2,
                                        ),
                                      ),
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount:
                                          staggeredViewProdutoRecordList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewProdutoRecord =
                                            staggeredViewProdutoRecordList[
                                                staggeredViewIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PaginaProdutoWidget.routeName,
                                                  queryParameters: {
                                                    'produtoRef':
                                                        serializeParam(
                                                      staggeredViewProdutoRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                FFAppState().quantidadeProduto =
                                                    1;
                                                FFAppState()
                                                    .selecionarVariante1 = '';
                                                FFAppState()
                                                    .selecionarVariante2 = '';
                                                FFAppState()
                                                    .selecionarVariante1foto = '';
                                                FFAppState().verTudo = false;
                                                FFAppState().adicionarCarrinho =
                                                    false;
                                                safeSetState(() {});
                                                if ((currentUserDocument
                                                                ?.vistoRecente
                                                                .toList() ??
                                                            [])
                                                        .length ==
                                                    6) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayRemove([
                                                          (currentUserDocument
                                                                      ?.vistoRecente
                                                                      .toList() ??
                                                                  [])
                                                              .firstOrNull
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  7.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              staggeredViewProdutoRecord
                                                                          .margem ==
                                                                      'story'
                                                                  ? 250.0
                                                                  : 190.0,
                                                              190.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    staggeredViewProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull!,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                if (staggeredViewProdutoRecord
                                                                            .video !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            23.0,
                                                                        height:
                                                                            23.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x91272727),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              17.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (staggeredViewProdutoRecord
                                                                            .capsula1 !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x4E000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xBBFFFFFF),
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.4,
                                                                              0.2,
                                                                              0.4,
                                                                              0.2),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.5, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 9.5,
                                                                                  height: 9.5,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xE2FFFFFF),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 9.0,
                                                                                      height: 9.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        staggeredViewProdutoRecord.capsula1,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (staggeredViewProdutoRecord.capsula2 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula2,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsula3 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula3,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsulaExtra != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                  child: Text(
                                                                                    staggeredViewProdutoRecord.capsulaExtra,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              Container(
                                                                                width: 1.0,
                                                                                height: 0.5,
                                                                                decoration: BoxDecoration(),
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        5.0,
                                                                        9.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              29.0,
                                                                          height:
                                                                              16.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                            border: Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                            child: Text(
                                                                              functions.porcentagemPromo(staggeredViewProdutoRecord.precoAntes, staggeredViewProdutoRecord.titulo1 != '' ? staggeredViewProdutoRecord.menorPrecoRevenda : staggeredViewProdutoRecord.preco),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      staggeredViewProdutoRecord
                                                                          .nome
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF4C4D4F),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ProdutoRecord>>(
                                                                  stream:
                                                                      queryProdutoRecord(
                                                                    queryBuilder: (produtoRecord) =>
                                                                        produtoRecord
                                                                            .where(
                                                                              'categoria',
                                                                              isEqualTo: staggeredViewProdutoRecord.categoria,
                                                                            )
                                                                            .orderBy('vendas',
                                                                                descending: true),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              1.0,
                                                                          height:
                                                                              1.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x004AA756),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProdutoRecord>
                                                                        containerProdutoRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible: functions.maisVendidoBooleanFeed(
                                                                            staggeredViewProdutoRecord.reference,
                                                                            containerProdutoRecordList.toList(),
                                                                            staggeredViewProdutoRecord.vendas),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                13.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFFBF9E9),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(2.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Container(
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF5DB9D),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(9.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 5.0, 0.0),
                                                                                      child: Text(
                                                                                        '${functions.maisVendido(staggeredViewProdutoRecord.reference, containerProdutoRecordList.toList())}° Mais Vendido',
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFFC48730),
                                                                                              fontSize: 9.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'em ${staggeredViewProdutoRecord.categoria}'.maybeHandleOverflow(
                                                                                      maxChars: 14,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFFD4C1A2),
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.navigate_next,
                                                                                        color: Color(0xFFD4C1A2),
                                                                                        size: 12.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        'R\$ ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorRealString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorRealString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorCentavosEmString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorCentavosEmString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas >=
                                                                          1)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              staggeredViewProdutoRecord.vendas.toString(),
                                                                              '0',
                                                                            )}+ vendidos',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas ==
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star_half,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '(+100)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (staggeredViewProdutoRecord
                                                                        .freteRapido)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            7.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF2EA597),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                1.0,
                                                                                0.0,
                                                                                1.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.shippingFast,
                                                                                    color: Color(0xFF2EA597),
                                                                                    size: 9.0,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    'Chega em 3 dias',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF2EA597),
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (staggeredViewProdutoRecord
                                                                        .envioNaciona)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE8FBF1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                1.0,
                                                                                4.0,
                                                                                1.0),
                                                                            child:
                                                                                Text(
                                                                              'Envio Nacional',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF4F4C4C),
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                        ],
                                                      ),
                                                    ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.7,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 27.0,
                                                            height: 19.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.5,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 26.5,
                                                            height: 17.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF0E8E2D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Ainda_no_Existem_Pedidos_(10).png',
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .contain,
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().filtroPerfilLoja == 'maisvendido')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProdutoRecord>>(
                                  stream: queryProdutoRecord(
                                    queryBuilder: (produtoRecord) =>
                                        produtoRecord
                                            .where(
                                              'lojaRef',
                                              isEqualTo: widget.lojaRef,
                                            )
                                            .orderBy('vendas',
                                                descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 26.0,
                                          height: 26.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 26.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProdutoRecord>
                                        staggeredViewProdutoRecordList =
                                        snapshot.data!;

                                    return MasonryGridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: valueOrDefault<int>(
                                          MediaQuery.sizeOf(context).width >=
                                                  500.0
                                              ? 5
                                              : 2,
                                          2,
                                        ),
                                      ),
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount:
                                          staggeredViewProdutoRecordList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewProdutoRecord =
                                            staggeredViewProdutoRecordList[
                                                staggeredViewIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PaginaProdutoWidget.routeName,
                                                  queryParameters: {
                                                    'produtoRef':
                                                        serializeParam(
                                                      staggeredViewProdutoRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                FFAppState().quantidadeProduto =
                                                    1;
                                                FFAppState()
                                                    .selecionarVariante1 = '';
                                                FFAppState()
                                                    .selecionarVariante2 = '';
                                                FFAppState()
                                                    .selecionarVariante1foto = '';
                                                FFAppState().verTudo = false;
                                                FFAppState().adicionarCarrinho =
                                                    false;
                                                safeSetState(() {});
                                                if ((currentUserDocument
                                                                ?.vistoRecente
                                                                .toList() ??
                                                            [])
                                                        .length ==
                                                    6) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayRemove([
                                                          (currentUserDocument
                                                                      ?.vistoRecente
                                                                      .toList() ??
                                                                  [])
                                                              .firstOrNull
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  7.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              staggeredViewProdutoRecord
                                                                          .margem ==
                                                                      'story'
                                                                  ? 250.0
                                                                  : 190.0,
                                                              190.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    staggeredViewProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull!,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                if (staggeredViewProdutoRecord
                                                                            .video !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            23.0,
                                                                        height:
                                                                            23.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x91272727),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              17.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (staggeredViewProdutoRecord
                                                                            .capsula1 !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x4E000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xBBFFFFFF),
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.4,
                                                                              0.2,
                                                                              0.4,
                                                                              0.2),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.5, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 9.5,
                                                                                  height: 9.5,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xE2FFFFFF),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 9.0,
                                                                                      height: 9.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        staggeredViewProdutoRecord.capsula1,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (staggeredViewProdutoRecord.capsula2 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula2,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsula3 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula3,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsulaExtra != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                  child: Text(
                                                                                    staggeredViewProdutoRecord.capsulaExtra,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              Container(
                                                                                width: 1.0,
                                                                                height: 0.5,
                                                                                decoration: BoxDecoration(),
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        5.0,
                                                                        9.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              29.0,
                                                                          height:
                                                                              16.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                            border: Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                            child: Text(
                                                                              functions.porcentagemPromo(staggeredViewProdutoRecord.precoAntes, staggeredViewProdutoRecord.titulo1 != '' ? staggeredViewProdutoRecord.menorPrecoRevenda : staggeredViewProdutoRecord.preco),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      staggeredViewProdutoRecord
                                                                          .nome
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF4C4D4F),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ProdutoRecord>>(
                                                                  stream:
                                                                      queryProdutoRecord(
                                                                    queryBuilder: (produtoRecord) =>
                                                                        produtoRecord
                                                                            .where(
                                                                              'categoria',
                                                                              isEqualTo: staggeredViewProdutoRecord.categoria,
                                                                            )
                                                                            .orderBy('vendas',
                                                                                descending: true),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              1.0,
                                                                          height:
                                                                              1.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x004AA756),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProdutoRecord>
                                                                        containerProdutoRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible: functions.maisVendidoBooleanFeed(
                                                                            staggeredViewProdutoRecord.reference,
                                                                            containerProdutoRecordList.toList(),
                                                                            staggeredViewProdutoRecord.vendas),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                13.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFFBF9E9),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(2.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Container(
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF5DB9D),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(9.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 5.0, 0.0),
                                                                                      child: Text(
                                                                                        '${functions.maisVendido(staggeredViewProdutoRecord.reference, containerProdutoRecordList.toList())}° Mais Vendido',
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFFC48730),
                                                                                              fontSize: 9.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'em ${staggeredViewProdutoRecord.categoria}'.maybeHandleOverflow(
                                                                                      maxChars: 14,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFFD4C1A2),
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.navigate_next,
                                                                                        color: Color(0xFFD4C1A2),
                                                                                        size: 12.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        'R\$ ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorRealString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorRealString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorCentavosEmString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorCentavosEmString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas >=
                                                                          1)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              staggeredViewProdutoRecord.vendas.toString(),
                                                                              '0',
                                                                            )}+ vendidos',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas ==
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star_half,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '(+100)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (staggeredViewProdutoRecord
                                                                        .freteRapido)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            7.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF2EA597),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                1.0,
                                                                                0.0,
                                                                                1.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.shippingFast,
                                                                                    color: Color(0xFF2EA597),
                                                                                    size: 9.0,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    'Chega em 3 dias',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF2EA597),
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (staggeredViewProdutoRecord
                                                                        .envioNaciona)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE8FBF1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                1.0,
                                                                                4.0,
                                                                                1.0),
                                                                            child:
                                                                                Text(
                                                                              'Envio Nacional',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF4F4C4C),
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                        ],
                                                      ),
                                                    ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.7,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 27.0,
                                                            height: 19.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.5,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 26.5,
                                                            height: 17.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF0E8E2D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Ainda_no_Existem_Pedidos_(10).png',
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .contain,
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().filtroPerfilLoja == 'relevancia')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProdutoRecord>>(
                                  stream: queryProdutoRecord(
                                    queryBuilder: (produtoRecord) =>
                                        produtoRecord.where(
                                      'lojaRef',
                                      isEqualTo: widget.lojaRef,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 26.0,
                                          height: 26.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 26.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProdutoRecord>
                                        staggeredViewProdutoRecordList =
                                        snapshot.data!;

                                    return MasonryGridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: valueOrDefault<int>(
                                          MediaQuery.sizeOf(context).width >=
                                                  500.0
                                              ? 5
                                              : 2,
                                          2,
                                        ),
                                      ),
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount:
                                          staggeredViewProdutoRecordList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewProdutoRecord =
                                            staggeredViewProdutoRecordList[
                                                staggeredViewIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PaginaProdutoWidget.routeName,
                                                  queryParameters: {
                                                    'produtoRef':
                                                        serializeParam(
                                                      staggeredViewProdutoRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                FFAppState().quantidadeProduto =
                                                    1;
                                                FFAppState()
                                                    .selecionarVariante1 = '';
                                                FFAppState()
                                                    .selecionarVariante2 = '';
                                                FFAppState()
                                                    .selecionarVariante1foto = '';
                                                FFAppState().verTudo = false;
                                                FFAppState().adicionarCarrinho =
                                                    false;
                                                safeSetState(() {});
                                                if ((currentUserDocument
                                                                ?.vistoRecente
                                                                .toList() ??
                                                            [])
                                                        .length ==
                                                    6) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayRemove([
                                                          (currentUserDocument
                                                                      ?.vistoRecente
                                                                      .toList() ??
                                                                  [])
                                                              .firstOrNull
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'vistoRecente':
                                                            FieldValue
                                                                .arrayUnion([
                                                          staggeredViewProdutoRecord
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  7.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              staggeredViewProdutoRecord
                                                                          .margem ==
                                                                      'story'
                                                                  ? 250.0
                                                                  : 190.0,
                                                              190.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    staggeredViewProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull!,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                if (staggeredViewProdutoRecord
                                                                            .video !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            23.0,
                                                                        height:
                                                                            23.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x91272727),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              17.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (staggeredViewProdutoRecord
                                                                            .capsula1 !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          6.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x4E000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xBBFFFFFF),
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.4,
                                                                              0.2,
                                                                              0.4,
                                                                              0.2),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.5, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 9.5,
                                                                                  height: 9.5,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xE2FFFFFF),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 9.0,
                                                                                      height: 9.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        staggeredViewProdutoRecord.capsula1,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (staggeredViewProdutoRecord.capsula2 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula2,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsula3 != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 9.5,
                                                                                    height: 9.5,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xE2FFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 9.0,
                                                                                        height: 9.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          staggeredViewProdutoRecord.capsula3,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (staggeredViewProdutoRecord.capsulaExtra != '')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                  child: Text(
                                                                                    staggeredViewProdutoRecord.capsulaExtra,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              Container(
                                                                                width: 1.0,
                                                                                height: 0.5,
                                                                                decoration: BoxDecoration(),
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        5.0,
                                                                        9.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              29.0,
                                                                          height:
                                                                              16.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                            border: Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                            child: Text(
                                                                              functions.porcentagemPromo(staggeredViewProdutoRecord.precoAntes, staggeredViewProdutoRecord.titulo1 != '' ? staggeredViewProdutoRecord.menorPrecoRevenda : staggeredViewProdutoRecord.preco),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      staggeredViewProdutoRecord
                                                                          .nome
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF4C4D4F),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ProdutoRecord>>(
                                                                  stream:
                                                                      queryProdutoRecord(
                                                                    queryBuilder: (produtoRecord) =>
                                                                        produtoRecord
                                                                            .where(
                                                                              'categoria',
                                                                              isEqualTo: staggeredViewProdutoRecord.categoria,
                                                                            )
                                                                            .orderBy('vendas',
                                                                                descending: true),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              1.0,
                                                                          height:
                                                                              1.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x004AA756),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProdutoRecord>
                                                                        containerProdutoRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible: functions.maisVendidoBooleanFeed(
                                                                            staggeredViewProdutoRecord.reference,
                                                                            containerProdutoRecordList.toList(),
                                                                            staggeredViewProdutoRecord.vendas),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                13.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFFBF9E9),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(2.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Container(
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF5DB9D),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(9.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 5.0, 0.0),
                                                                                      child: Text(
                                                                                        '${functions.maisVendido(staggeredViewProdutoRecord.reference, containerProdutoRecordList.toList())}° Mais Vendido',
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFFC48730),
                                                                                              fontSize: 9.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'em ${staggeredViewProdutoRecord.categoria}'.maybeHandleOverflow(
                                                                                      maxChars: 14,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFFD4C1A2),
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.navigate_next,
                                                                                        color: Color(0xFFD4C1A2),
                                                                                        size: 12.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        'R\$ ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorRealString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorRealString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        staggeredViewProdutoRecord.titulo1 != ''
                                                                            ? functions.valorCentavosEmString(staggeredViewProdutoRecord.menorPrecoRevenda)
                                                                            : functions.valorCentavosEmString(staggeredViewProdutoRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas >=
                                                                          1)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              staggeredViewProdutoRecord.vendas.toString(),
                                                                              '0',
                                                                            )}+ vendidos',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (staggeredViewProdutoRecord
                                                                              .vendas ==
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star_half,
                                                                                color: Color(0xFFF9C637),
                                                                                size: 13.0,
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '(+100)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (staggeredViewProdutoRecord
                                                                        .freteRapido)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            7.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF2EA597),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                1.0,
                                                                                0.0,
                                                                                1.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.shippingFast,
                                                                                    color: Color(0xFF2EA597),
                                                                                    size: 9.0,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    'Chega em 3 dias',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF2EA597),
                                                                                          fontSize: 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (staggeredViewProdutoRecord
                                                                        .envioNaciona)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE8FBF1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                1.0,
                                                                                4.0,
                                                                                1.0),
                                                                            child:
                                                                                Text(
                                                                              'Envio Nacional',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF4F4C4C),
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                        ],
                                                      ),
                                                    ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.7,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 27.0,
                                                            height: 19.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (staggeredViewProdutoRecord
                                                        .envioNaciona)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.5,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 26.5,
                                                            height: 17.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF0E8E2D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        13.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Ainda_no_Existem_Pedidos_(10).png',
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .contain,
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  if (FFAppState().filtroPerfilLoja2 == 'avaliacao')
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 22.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          StreamBuilder<List<AvaliacaoRecord>>(
                            stream: queryAvaliacaoRecord(
                              queryBuilder: (avaliacaoRecord) => avaliacaoRecord
                                  .where(
                                    'lojaRef',
                                    isEqualTo: widget.lojaRef,
                                  )
                                  .orderBy('videoSet', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 26.0,
                                    height: 26.0,
                                    child: SpinKitCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 26.0,
                                    ),
                                  ),
                                );
                              }
                              List<AvaliacaoRecord>
                                  listViewAvaliacaoRecordList = snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewAvaliacaoRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewAvaliacaoRecord =
                                      listViewAvaliacaoRecordList[
                                          listViewIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 25.0,
                                                                height: 25.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewAvaliacaoRecord
                                                                        .fotoUser,
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(11).png?alt=media&token=e5c7f1ab-12eb-4a45-9c2b-a2830445c928',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewAvaliacaoRecord
                                                                    .nomeUser,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: listViewAvaliacaoRecord.nota >=
                                                                              1
                                                                          ? Color(
                                                                              0xFFFFCC10)
                                                                          : Color(
                                                                              0x4B5E5E58),
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: listViewAvaliacaoRecord.nota >=
                                                                              2
                                                                          ? Color(
                                                                              0xFFFFCC10)
                                                                          : Color(
                                                                              0x4B5E5E58),
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: listViewAvaliacaoRecord.nota >=
                                                                              3
                                                                          ? Color(
                                                                              0xFFFFCC10)
                                                                          : Color(
                                                                              0x4B5E5E58),
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: listViewAvaliacaoRecord.nota >=
                                                                              4
                                                                          ? Color(
                                                                              0xFFFFCC10)
                                                                          : Color(
                                                                              0x4B5E5E58),
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: listViewAvaliacaoRecord.nota >=
                                                                              5
                                                                          ? Color(
                                                                              0xFFFFCC10)
                                                                          : Color(
                                                                              0x4B5E5E58),
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (listViewAvaliacaoRecord
                                                                .like
                                                                .contains(
                                                                    currentUserReference) ==
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await listViewAvaliacaoRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'like': FieldValue
                                                                          .arrayRemove([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.thumb_up,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (listViewAvaliacaoRecord
                                                                .like
                                                                .contains(
                                                                    currentUserReference) ==
                                                            false)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await listViewAvaliacaoRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'like': FieldValue
                                                                          .arrayUnion([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .thumb_up_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        Text(
                                                          'Ùtil',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '(${valueOrDefault<String>(
                                                              listViewAvaliacaoRecord
                                                                  .like.length
                                                                  .toString(),
                                                              '0',
                                                            )})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (listViewAvaliacaoRecord
                                                        .variacao !=
                                                    '')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 11.0, 0.0,
                                                          11.0),
                                                  child: Text(
                                                    'Variação: ${listViewAvaliacaoRecord.variacao}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0x8575787A),
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            if ((FFAppState().verTudo ==
                                                    false) &&
                                                (listViewAvaliacaoRecord
                                                            .comentario !=
                                                        ''))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 0.0, 10.0,
                                                          10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState().verTudo =
                                                          true;
                                                      safeSetState(() {});
                                                    },
                                                    child: Text(
                                                      listViewAvaliacaoRecord
                                                          .comentario
                                                          .maybeHandleOverflow(
                                                        maxChars: 230,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if ((FFAppState().verTudo ==
                                                    true) &&
                                                (listViewAvaliacaoRecord
                                                            .comentario !=
                                                        ''))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 0.0, 10.0,
                                                          10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState().verTudo =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Text(
                                                      listViewAvaliacaoRecord
                                                          .comentario,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if ((listViewAvaliacaoRecord
                                                    .imageList.isNotEmpty) ==
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final listImg =
                                                              listViewAvaliacaoRecord
                                                                  .imageList
                                                                  .toList();

                                                          return GridView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                              crossAxisSpacing:
                                                                  10.0,
                                                              mainAxisSpacing:
                                                                  10.0,
                                                              childAspectRatio:
                                                                  1.0,
                                                            ),
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listImg.length,
                                                            itemBuilder: (context,
                                                                listImgIndex) {
                                                              final listImgItem =
                                                                  listImg[
                                                                      listImgIndex];
                                                              return Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          111.0,
                                                                      height:
                                                                          115.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              ImagemAvaliacaoWidget.routeName,
                                                                              queryParameters: {
                                                                                'index': serializeParam(
                                                                                  listImgIndex,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'avaliacaoref': serializeParam(
                                                                                  listViewAvaliacaoRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'produtoRef': serializeParam(
                                                                                  listViewAvaliacaoRecord.parentReference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              FlutterFlowMediaDisplay(
                                                                            path:
                                                                                listImgItem,
                                                                            imageBuilder: (path) =>
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                path,
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            videoPlayerBuilder: (path) =>
                                                                                FlutterFlowVideoPlayer(
                                                                              path: path,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              autoPlay: false,
                                                                              looping: false,
                                                                              showControls: false,
                                                                              allowFullScreen: false,
                                                                              allowPlaybackSpeedMenu: false,
                                                                              pauseOnNavigate: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if ((listViewAvaliacaoRecord
                                                                              .videoSet ==
                                                                          2) &&
                                                                      (listImgIndex ==
                                                                          0))
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            39.0,
                                                                        height:
                                                                            39.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x91272727),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              34.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ImagemAvaliacaoWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'index':
                                                                    serializeParam(
                                                                  0,
                                                                  ParamType.int,
                                                                ),
                                                                'avaliacaoref':
                                                                    serializeParam(
                                                                  listViewAvaliacaoRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'produtoRef':
                                                                    serializeParam(
                                                                  listViewAvaliacaoRecord
                                                                      .parentReference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 109.0,
                                                            height: 113.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        18.0, 4.0, 0.0, 7.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    "d/M/y",
                                                    listViewAvaliacaoRecord
                                                        .data!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0x8575787A),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 5.0, 0.0, 20.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 1.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x5ECBCDCE),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  Container(
                    width: 1.0,
                    height: 130.0,
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
