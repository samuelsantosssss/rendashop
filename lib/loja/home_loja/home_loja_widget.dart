import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/carregando/carregando20/carregando20_widget.dart';
import '/carregando/carregando21/carregando21_widget.dart';
import '/carregando/carregando25/carregando25_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo_home/time_promo_home_widget.dart';
import '/loja/promocao_relampago/updata_promo_home/updata_promo_home_widget.dart';
import '/nav_bar/nav_bar_home/nav_bar_home_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_loja_model.dart';
export 'home_loja_model.dart';

class HomeLojaWidget extends StatefulWidget {
  const HomeLojaWidget({super.key});

  static String routeName = 'Home-loja';
  static String routePath = '/homeLoja';

  @override
  State<HomeLojaWidget> createState() => _HomeLojaWidgetState();
}

class _HomeLojaWidgetState extends State<HomeLojaWidget> {
  late HomeLojaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeLojaModel());

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        appBar: isWeb == false
            ? PreferredSize(
                preferredSize: Size.fromHeight(0.01),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
              )
            : null,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ((FFAppState().bennerBaixarAPP == false) && isWeb)
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            Color(0xFFF5F5F5)
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 59.95,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          StreamBuilder<List<BannerRecord>>(
                            stream: queryBannerRecord(
                              queryBuilder: (bannerRecord) =>
                                  bannerRecord.where(
                                'local',
                                isEqualTo: 'home',
                              ),
                              singleRecord: true,
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
                              List<BannerRecord> containerBannerRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerBannerRecord =
                                  containerBannerRecordList.isNotEmpty
                                      ? containerBannerRecordList.first
                                      : null;

                              return Container(
                                width: double.infinity,
                                height: valueOrDefault<double>(
                                  (MediaQuery.sizeOf(context).width >= 500.0
                                          ? 372
                                          : 147)
                                      .toDouble(),
                                  147.0,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      Color(0xFFF5F5F5)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final banner = containerBannerRecord
                                            ?.listaBanner
                                            .toList() ??
                                        [];

                                    return Container(
                                      width: double.infinity,
                                      height: 132.0,
                                      child: CarouselSlider.builder(
                                        itemCount: banner.length,
                                        itemBuilder: (context, bannerIndex, _) {
                                          final bannerItem =
                                              banner[bannerIndex];
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            child: Image.network(
                                              bannerItem,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                        carouselController:
                                            _model.carouselController ??=
                                                CarouselSliderController(),
                                        options: CarouselOptions(
                                          initialPage:
                                              max(0, min(2, banner.length - 1)),
                                          viewportFraction: 0.9,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.2,
                                          enableInfiniteScroll: true,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: false,
                                          onPageChanged: (index, _) => _model
                                              .carouselCurrentIndex = index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: valueOrDefault<double>(
                                (MediaQuery.sizeOf(context).width >= 500.0
                                        ? 200
                                        : 313)
                                    .toDouble(),
                                313.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 0.0, 0.0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Roupas Femininas',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 55.0,
                                                                  height: 55.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      image: Image
                                                                          .network(
                                                                        'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lzs3ljipzlat96.webp?alt=media&token=889485f0-6161-46b0-824e-21d119add0f4',
                                                                      ).image,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              22.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              21.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              22.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              21.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            'Roupas Femininas',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Roupas Masculinas',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fb446b25092b8ee419b039dee78e374c2ggg.jpg?alt=media&token=81b059bb-50dc-4037-b003-3073b0cb0b83',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Roupas Masculinas',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Beleza',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lksyhor9h9pv87.webp?alt=media&token=4b745e1b-4a0f-4ee4-ab7a-6bd1595434dd',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Beleza',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Acessórios de Moda',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98r-llyexmibmdrr11.webp?alt=media&token=acc456ee-5b37-4bcb-bb7f-8173726e443a',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Acessórios de Moda',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Casa e Decoração',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lorva0315kmq1d.webp?alt=media&token=18b67a5f-cc01-414d-80a1-d230808035ec',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Casa e Decoração',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Sapatos Femininos',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lwef9r9zob5ia8.webp?alt=media&token=e21c055a-231b-416f-b04f-e68871c0b5d5',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Sapatos Femininos',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Sapatos Masculinos',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lwyp82bzcewmf5.webp?alt=media&token=3ae1da75-2bee-41d6-aaeb-6b8af06fdbb3',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Sapatos Masculinos',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Moda Infantil',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lz80fzm09tw528.webp?alt=media&token=1ae2523b-09a4-4e98-9e8e-3a95f0d8e544',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Text(
                                                              'Moda Infantil',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Relógios',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2F36c33433930b5d8595f41905093ffa18.webp?alt=media&token=dc9e5006-954a-4e08-8249-814bcefb9403',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Relógios',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        12.0,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Celulares e Dispositivos',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fcn-11134207-7r98o-lzvv02vv3k4i1f.webp?alt=media&token=38894e79-7536-43f7-ac9c-4622a02094f4',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Celulares e Dispositivos',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Esporte e Lazer',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fsg-11134201-7qvd2-ljyk7qt70x9n6c.webp?alt=media&token=71210e07-a432-4c51-9365-e243ba7aa9c3',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Esporte e Lazer',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Eletrodomésticos',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98q-llmij8jid08q65.webp?alt=media&token=f09a89ba-7505-4c8a-8d7c-bb74995bca8d',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Eletrodomésticos',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Automóveis',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7qukw-ljqptw9ul8qy5a.webp?alt=media&token=75f65a3f-276e-4ded-91c2-b7922edfc3a1',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Automóveis',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Brinquedos e Hobbies',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fsg-11134201-7rdwu-m038z76i54hs7b.webp?alt=media&token=54729ca0-6e75-41d9-b398-75a920697b31',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Brinquedos e Hobbies',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Saúde',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lkr21clgu6qg6b.webp?alt=media&token=a87f2f6b-2592-446b-835a-3e279b4f48cc',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Saúde',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Áudio',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fsg-11134201-7rd63-lwfx69det8tu83.webp?alt=media&token=447638ae-52e0-4c14-bd47-cbe7bd355993',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Áudio',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Mãe e Bebê',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lu7yjg0i6yjked.webp?alt=media&token=639859a5-e169-477b-a5f9-e32bb7e94a30',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Mãe e Bebê',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Bolsas Femininas',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-ln6mlhiuvcjn09.webp?alt=media&token=bfe32ea6-d35f-4c02-9be1-4a5f19d516d4',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Bolsas Femininas',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Bolsas Masculinas',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-ln6mlhiuvcjn09.webp?alt=media&token=bfe32ea6-d35f-4c02-9be1-4a5f19d516d4',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Bolsas Masculinas',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Animais Domésticos',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-m0uw6nhpkbkw52.webp?alt=media&token=3c32ce94-9d2b-445a-aa77-678ae402c01c',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Animais Domésticos',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Papelaria',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lpb7ri5jxp6aad%20(1).webp?alt=media&token=90ef09e0-59e3-424f-90fa-2ef83ad5c054',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Papelaria',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Computadores e Acessórios',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-m1zl4lvd9dqp74.webp?alt=media&token=79b81e5e-21e6-4d12-b21f-b416b73c22c2',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Computadores e Acessórios',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        10.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Alimentos e Bebidas',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lz13ankrfvb527.webp?alt=media&token=7bfbb90b-4489-4062-ae76-dda097072209',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Alimentos e Bebidas',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Jogos e Consoles',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98q-lmj3enfpuj3f62.webp?alt=media&token=2331ec94-b3e9-4c9f-8c09-71396483c3c5',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Jogos e Consoles',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Câmeras e Drones',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-lqdf0t3uiuwzd2.webp?alt=media&token=115ca0e3-db19-4257-a6c5-ac916280eae6',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Câmeras e Drones',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Viagens e Bagagens',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-m2i5px3env12ce.webp?alt=media&token=c7291021-e1dd-48c7-92e6-5c723bcf48fa',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Viagens e Bagagens',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        11.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 73.0,
                                              height: 158.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
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
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                'Livros e Revistas',
                                                                (currentUserDocument
                                                                            ?.historicoPesquisa
                                                                            .toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .filtroRelevencia =
                                                            true;
                                                        FFAppState()
                                                                .FiltroDestaque =
                                                            false;
                                                        FFAppState()
                                                                .filtroRecente =
                                                            false;
                                                        FFAppState()
                                                            .filtroPreco = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PesquisaGaleriaWidget
                                                                .routeName);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  image: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Categorias%2Fbr-11134207-7r98o-m1yn0k0905wk3a.webp?alt=media&token=0f3b43bc-0c5e-4afb-b163-b306402e3b28',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          22.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          21.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Livros e Revistas',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    StreamBuilder<List<BannerRecord>>(
                                      stream: queryBannerRecord(
                                        queryBuilder: (bannerRecord) =>
                                            bannerRecord.where(
                                          'local',
                                          isEqualTo: 'ofertaHome',
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Carregando25Widget();
                                        }
                                        List<BannerRecord>
                                            containerBannerRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerBannerRecord =
                                            containerBannerRecordList.isNotEmpty
                                                ? containerBannerRecordList
                                                    .first
                                                : null;

                                        return Container(
                                          width: double.infinity,
                                          height: 113.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Image.network(
                                                containerBannerRecord!
                                                    .listaBanner.firstOrNull!,
                                              ).image,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder<List<ProdutoRecord>>(
                    stream: queryProdutoRecord(
                      queryBuilder: (produtoRecord) => produtoRecord.where(
                        'promoRelampagoAgendado',
                        isEqualTo: true,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 0.01,
                            height: 0.01,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0x00FFFFFF),
                              ),
                            ),
                          ),
                        );
                      }
                      List<ProdutoRecord> relampago1ProdutoRecordList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Visibility(
                          visible:
                              (relampago1ProdutoRecordList.isNotEmpty) == true,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 11.0, 10.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 257.6,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          HomePromoRelampagoWidget.routeName);

                                      FFAppState().horaPromo =
                                          functions.promoRelampagoHora(
                                              relampago1ProdutoRecordList
                                                  .toList());
                                      FFAppState().promoRelampago9hVisto =
                                          functions.promoRelampago9hTrue();
                                      FFAppState().promoRelampago0hVisto =
                                          functions.promoRelampago0hTrue();
                                      FFAppState().promoRelampago12hVisto =
                                          functions.promoRelampago12hTrue();
                                      FFAppState().promoRelampago18hVisto =
                                          functions.promoRelampago18hTrue();
                                      FFAppState().promoRelampago21hVisto =
                                          functions.promoRelampago21hTrue();
                                      FFAppState().promoRelampagoVistoAmanha =
                                          functions.promoRelampagoAmanhaTrue();
                                      safeSetState(() {});
                                      FFAppState().promoCor =
                                          functions.promoRelampagoCor(
                                              FFAppState().horaPromo);
                                      safeSetState(() {});
                                      await actions.promoRelampagoUpdate(
                                        relampago1ProdutoRecordList.toList(),
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  9.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'OFERTAS',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  94.0,
                                                                  1.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.flash_on,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  78.0,
                                                                  1.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'RE    LÂMPAGO',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 61.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 11.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 56.0,
                                                      height: 17.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  13.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .timePromoHomeModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            TimePromoHomeWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.timer_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 11.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Ver Mais',
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
                                                    Icon(
                                                      Icons.navigate_next,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 22.0,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 3.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 220.75,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(6.0),
                                          bottomRight: Radius.circular(6.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 7.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final produtoList = functions
                                                      .promoRelampagomaisRecente(
                                                          relampago1ProdutoRecordList
                                                              .toList())
                                                      .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        produtoList.length,
                                                    itemBuilder: (context,
                                                        produtoListIndex) {
                                                      final produtoListItem =
                                                          produtoList[
                                                              produtoListIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
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
                                                              context.pushNamed(
                                                                PaginaProdutoWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'produtoRef':
                                                                      serializeParam(
                                                                    produtoListItem
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              FFAppState()
                                                                  .quantidadeProduto = 1;
                                                              FFAppState()
                                                                  .selecionarVariante1 = '';
                                                              FFAppState()
                                                                  .selecionarVariante2 = '';
                                                              FFAppState()
                                                                  .selecionarVariante1foto = '';
                                                              FFAppState()
                                                                      .verTudo =
                                                                  false;
                                                              FFAppState()
                                                                      .adicionarCarrinho =
                                                                  false;
                                                              safeSetState(
                                                                  () {});

                                                              await currentUserReference!
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'vistoRecente':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      produtoListItem
                                                                          .reference
                                                                          .id
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          149.97,
                                                                      height:
                                                                          164.1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(3.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: Image.network(
                                                                                    produtoListItem.imagens.firstOrNull!,
                                                                                  ).image,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 3.0, 0.0),
                                                                              child: Container(
                                                                                width: 33.8,
                                                                                height: 17.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFFFE20C),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                    child: Text(
                                                                                      functions.porcentagemPromo(produtoListItem.precoAntes, produtoListItem.titulo1 != '' ? produtoListItem.promoRelampagoMenorValor : produtoListItem.preco),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 11.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 25.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.flash_on,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 21.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'R\$',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            functions.valorDoubleEmString(produtoListItem.titulo1 != ''
                                                                                ? produtoListItem.menorPrecoRevenda
                                                                                : produtoListItem.preco),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        LinearPercentIndicator(
                                                                      percent:
                                                                          0.8,
                                                                      width:
                                                                          120.0,
                                                                      lineHeight:
                                                                          13.0,
                                                                      animation:
                                                                          true,
                                                                      animateFromLastPercent:
                                                                          true,
                                                                      progressColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x564AA756),
                                                                      center:
                                                                          Text(
                                                                        'Popular',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                              lineHeight: 1.0,
                                                                            ),
                                                                      ),
                                                                      barRadius:
                                                                          Radius.circular(
                                                                              11.0),
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 50.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      HomePromoRelampagoWidget
                                                          .routeName);

                                                  FFAppState().horaPromo =
                                                      functions.promoRelampagoHora(
                                                          relampago1ProdutoRecordList
                                                              .toList());
                                                  FFAppState()
                                                          .promoRelampago9hVisto =
                                                      functions
                                                          .promoRelampago9hTrue();
                                                  FFAppState()
                                                          .promoRelampago0hVisto =
                                                      functions
                                                          .promoRelampago0hTrue();
                                                  FFAppState()
                                                          .promoRelampago12hVisto =
                                                      functions
                                                          .promoRelampago12hTrue();
                                                  FFAppState()
                                                          .promoRelampago18hVisto =
                                                      functions
                                                          .promoRelampago18hTrue();
                                                  FFAppState()
                                                          .promoRelampago21hVisto =
                                                      functions
                                                          .promoRelampago21hTrue();
                                                  FFAppState()
                                                          .promoRelampagoVistoAmanha =
                                                      functions
                                                          .promoRelampagoAmanhaTrue();
                                                  safeSetState(() {});
                                                  FFAppState().promoCor =
                                                      functions
                                                          .promoRelampagoCor(
                                                              FFAppState()
                                                                  .horaPromo);
                                                  safeSetState(() {});
                                                  await actions
                                                      .promoRelampagoUpdate(
                                                    relampago1ProdutoRecordList
                                                        .toList(),
                                                  );
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.navigate_next,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 25.0,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.circle_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      55.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Ver tudo',
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
                                                                      .primary,
                                                                  fontSize:
                                                                      11.0,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.updataPromoHomeModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: UpdataPromoHomeWidget(
                                      docList: relampago1ProdutoRecordList,
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
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.retorno5 = await actions.firebaseDiagnostic();
                          FFAppState().apagar = _model.retorno5!;
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 10.0, 0.0, 10.0),
                              child: Text(
                                'DESCOBERTAS DO DIA',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Visibility(
                          visible:
                              _model.retorno5 != null && _model.retorno5 != '',
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 10.0, 0.0, 10.0),
                              child: Text(
                                FFAppState().apagar,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  StreamBuilder<List<ProdutoRecord>>(
                    stream: queryProdutoRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Carregando18Widget();
                      }
                      List<ProdutoRecord> feed2ProdutoRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Builder(
                                    builder: (context) {
                                      final produtoRef = functions
                                          .recomendarProdutosPersonalizados(
                                              feed2ProdutoRecordList.toList(),
                                              (currentUserDocument?.favorito
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument?.historicoPesquisa
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument?.vistoRecente
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument
                                                          ?.comprasHistoricoProdutos
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              FFAppState()
                                                  .limiteVistualizacaoProdutoHomePage,
                                              80)
                                          .toList();

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
                                        itemCount: produtoRef.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (context, produtoRefIndex) {
                                          final produtoRefItem =
                                              produtoRef[produtoRefIndex];
                                          return StreamBuilder<ProdutoRecord>(
                                            stream: ProdutoRecord.getDocument(
                                                produtoRefItem.reference),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Carregando19Widget();
                                              }

                                              final containerProdutoRecord =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
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
                                                        context.pushNamed(
                                                          PaginaProdutoWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'produtoRef':
                                                                serializeParam(
                                                              containerProdutoRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        FFAppState()
                                                            .quantidadeProduto = 1;
                                                        FFAppState()
                                                            .selecionarVariante1 = '';
                                                        FFAppState()
                                                            .selecionarVariante2 = '';
                                                        FFAppState()
                                                            .selecionarVariante1foto = '';
                                                        FFAppState().verTudo =
                                                            false;
                                                        FFAppState()
                                                                .adicionarCarrinho =
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
                                                                  containerProdutoRecord
                                                                      .reference
                                                                      .id
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
                                                                  containerProdutoRecord
                                                                      .reference
                                                                      .id
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
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
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    height: valueOrDefault<
                                                                        double>(
                                                                      containerProdutoRecord.margem ==
                                                                              'story'
                                                                          ? 250.0
                                                                          : 190.0,
                                                                      190.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(5.0),
                                                                            topRight:
                                                                                Radius.circular(5.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            containerProdutoRecord.imagens.firstOrNull!,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                Alignment(0.0, -1.0),
                                                                          ),
                                                                        ),
                                                                        if (containerProdutoRecord.video !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 6.0),
                                                                              child: Container(
                                                                                width: 23.0,
                                                                                height: 23.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x91272727),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.play_arrow_rounded,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  size: 17.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (containerProdutoRecord.capsula1 !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 6.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x4E000000),
                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xBBFFFFFF),
                                                                                    width: 0.4,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.4, 0.2, 0.4, 0.2),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
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
                                                                                                containerProdutoRecord.capsula1,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      if (containerProdutoRecord.capsula2 != '')
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
                                                                                                  containerProdutoRecord.capsula2,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (containerProdutoRecord.capsula3 != '')
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
                                                                                                  containerProdutoRecord.capsula3,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (containerProdutoRecord.capsulaExtra != '')
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                          child: Text(
                                                                                            containerProdutoRecord.capsulaExtra,
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            5.0,
                                                                            9.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                child: Container(
                                                                                  width: 29.0,
                                                                                  height: 16.0,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 0.7,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      functions.porcentagemPromo(containerProdutoRecord.precoAntes, containerProdutoRecord.titulo1 != '' ? containerProdutoRecord.menorPrecoRevenda : containerProdutoRecord.preco),
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
                                                                                child: Text(
                                                                              containerProdutoRecord.nome.maybeHandleOverflow(
                                                                                maxChars: 20,
                                                                                replacement: '…',
                                                                              ),
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF4C4D4F),
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                        StreamBuilder<
                                                                            List<ProdutoRecord>>(
                                                                          stream:
                                                                              queryProdutoRecord(
                                                                            queryBuilder: (produtoRecord) => produtoRecord
                                                                                .where(
                                                                                  'categoria',
                                                                                  isEqualTo: containerProdutoRecord.categoria,
                                                                                )
                                                                                .orderBy('vendas', descending: true),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 1.0,
                                                                                  height: 1.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      Color(0x004AA756),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<ProdutoRecord>
                                                                                containerProdutoRecordList =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: functions.maisVendidoBooleanFeed(containerProdutoRecord.reference, containerProdutoRecordList.toList(), containerProdutoRecord.vendas),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 13.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFFBF9E9),
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(2.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(2.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
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
                                                                                                '${functions.maisVendido(containerProdutoRecord.reference, containerProdutoRecordList.toList())}° Mais Vendido',
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
                                                                                            'em ${containerProdutoRecord.categoria}'.maybeHandleOverflow(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                'R\$ ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                containerProdutoRecord.titulo1 != '' ? functions.valorRealString(containerProdutoRecord.menorPrecoRevenda) : functions.valorRealString(containerProdutoRecord.preco),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                containerProdutoRecord.titulo1 != '' ? functions.valorCentavosEmString(containerProdutoRecord.menorPrecoRevenda) : functions.valorCentavosEmString(containerProdutoRecord.preco),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                              if (containerProdutoRecord.vendas >= 1)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      containerProdutoRecord.vendas.toString(),
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
                                                                              if (containerProdutoRecord.vendas == 0)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
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
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (containerProdutoRecord.freteRapido)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 7.0, 0.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFF2EA597),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 1.0),
                                                                                    child: Row(
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
                                                                            if (containerProdutoRecord.envioNaciona)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFE8FBF1),
                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 1.0, 4.0, 1.0),
                                                                                    child: Text(
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
                                                            if (containerProdutoRecord
                                                                .envioNaciona)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.7,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 27.0,
                                                                    height:
                                                                        19.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(13.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(13.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (containerProdutoRecord
                                                                .envioNaciona)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.5,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 26.5,
                                                                    height:
                                                                        17.5,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF0E8E2D),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(13.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(13.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Ainda_no_Existem_Pedidos_(10).png',
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              200.0,
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
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if ((FFAppState().FeedAntes !=
                                      FFAppState().FeedDepois) ||
                                  (FFAppState().FeedAntes == ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 15.0, 10.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().FeedAntes = functions
                                          .recomendarProdutosPersonalizados(
                                              feed2ProdutoRecordList.toList(),
                                              (currentUserDocument?.favorito
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument?.historicoPesquisa
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument?.vistoRecente
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument
                                                          ?.comprasHistoricoProdutos
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              FFAppState()
                                                  .limiteVistualizacaoProdutoHomePage,
                                              10)
                                          .length
                                          .toString();
                                      safeSetState(() {});
                                      FFAppState()
                                              .limiteVistualizacaoProdutoHomePage =
                                          FFAppState()
                                                  .limiteVistualizacaoProdutoHomePage +
                                              40;
                                      safeSetState(() {});
                                      FFAppState().FeedDepois = functions
                                          .recomendarProdutosPersonalizados(
                                              feed2ProdutoRecordList.toList(),
                                              (currentUserDocument?.favorito
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument?.historicoPesquisa
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument?.vistoRecente
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument
                                                          ?.comprasHistoricoProdutos
                                                          .toList() ??
                                                      [])
                                                  .toList(),
                                              FFAppState()
                                                  .limiteVistualizacaoProdutoHomePage,
                                              10)
                                          .length
                                          .toString();
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 43.3,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Ver mais',
                                            style: FlutterFlowTheme.of(context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  if ((FFAppState().FeedAntes == FFAppState().FeedDepois) &&
                      (FFAppState().FeedAntes != ''))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Text(
                        'Não foram encontrados mais produtos',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
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
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                    ),
                  ),
                ],
              ),
            ),
            wrapWithModel(
              model: _model.navBarHomeModel,
              updateCallback: () => safeSetState(() {}),
              child: NavBarHomeWidget(),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((FFAppState().bennerBaixarAPP == false) && isWeb)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.retorno = await actions.detectarAndroidOuIOS();
                      if (_model.retorno!) {
                        _model.respostaAndroid2 = await queryLinkRecordOnce(
                          queryBuilder: (linkRecord) => linkRecord.where(
                            'tipo',
                            isEqualTo: 'baixarAndroid',
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        await launchURL(_model.respostaAndroid2!.link);
                      } else {
                        _model.respostaIos2 = await queryLinkRecordOnce(
                          queryBuilder: (linkRecord) => linkRecord.where(
                            'tipo',
                            isEqualTo: 'baixarIos',
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        await launchURL(_model.respostaIos2!.link);
                      }

                      safeSetState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().bennerBaixarAPP = true;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Icon(
                                        Icons.close_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/Ainda_no_Existem_Pedidos_(13).png',
                                      width: 46.0,
                                      height: 45.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ganhe Cupom de Frete Grátis',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        'Compre online no aplicativo',
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
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: 70.0,
                                        height: 23.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF0487FC),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Baixe Agora',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 10.0,
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
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x5ECBCDCE),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            Color(0xFFF5F5F5)
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 56.2,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  35.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child:
                                            StreamBuilder<List<ProdutoRecord>>(
                                          stream: queryProdutoRecord(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Carregando20Widget();
                                            }
                                            List<ProdutoRecord>
                                                pesquisaProdutoRecordList =
                                                snapshot.data!;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                        .pesquisaMostrarMais =
                                                    false;
                                                FFAppState()
                                                        .pesquisaApagarHistorico =
                                                    false;
                                                FFAppState()
                                                    .palavraChavePesquisa = [];
                                                safeSetState(() {});

                                                context.pushNamed(
                                                  PesquisaWidget.routeName,
                                                  queryParameters: {
                                                    'documentList':
                                                        serializeParam(
                                                      pesquisaProdutoRecordList,
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'documentList':
                                                        pesquisaProdutoRecordList,
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.search,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 22.0,
                                                            ),
                                                            Text(
                                                              'Buscar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.filter_list,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 19.0,
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
                                  ),
                                  if (loggedIn == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child:
                                          StreamBuilder<List<CarrinhoRecord>>(
                                        stream: queryCarrinhoRecord(
                                          parent: currentUserReference,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Carregando21Widget();
                                          }
                                          List<CarrinhoRecord>
                                              containerCarrinhoRecordList =
                                              snapshot.data!;

                                          return Container(
                                            width: 64.0,
                                            height: 43.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  20.0,
                                                                  0.0),
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
                                                          context.pushNamed(
                                                              CarrinhoWidget
                                                                  .routeName);
                                                        },
                                                        child: badges.Badge(
                                                          badgeContent: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              currentUserReference !=
                                                                      null
                                                                  ? functions.somarQuantidadesTotal(
                                                                      containerCarrinhoRecordList
                                                                          .toList())
                                                                  : FFAppState()
                                                                      .quantidadeCarrinho
                                                                      .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          showBadge: functions
                                                                  .somarQuantidadesTotal(
                                                                      containerCarrinhoRecordList
                                                                          .toList()) !=
                                                              '0',
                                                          shape: badges
                                                              .BadgeShape
                                                              .circle,
                                                          badgeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          elevation: 7.0,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          position: badges
                                                                  .BadgePosition
                                                              .topEnd(),
                                                          animationType: badges
                                                              .BadgeAnimationType
                                                              .scale,
                                                          toAnimate: true,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Icon(
                                                              Icons
                                                                  .shopping_cart_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 22.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  if (currentUserReference == null)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            23.0, 5.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                CarrinhoNaoLogadoVendaWidget
                                                    .routeName);
                                          },
                                          child: Container(
                                            width: 31.0,
                                            height: 31.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 4.0, 0.0),
                                                child: badges.Badge(
                                                  badgeContent: Text(
                                                    functions
                                                        .somarQuantidadesCarrinhoSemLogin(
                                                            FFAppState()
                                                                .CarrinhoTemporarioNacional
                                                                .toList(),
                                                            FFAppState()
                                                                .CarrinhoTemporarioInternacional
                                                                .toList())
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  showBadge: ((FFAppState()
                                                              .CarrinhoTemporarioNacional
                                                              .isNotEmpty) ==
                                                          true) ||
                                                      ((FFAppState()
                                                              .CarrinhoTemporarioInternacional
                                                              .isNotEmpty) ==
                                                          true),
                                                  shape:
                                                      badges.BadgeShape.circle,
                                                  badgeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  elevation: 7.0,
                                                  padding: EdgeInsets.all(6.0),
                                                  position: badges.BadgePosition
                                                      .topEnd(),
                                                  animationType: badges
                                                      .BadgeAnimationType.scale,
                                                  toAnimate: true,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 22.0,
                                                    ),
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
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
