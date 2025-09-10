import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/carregando/carregando20/carregando20_widget.dart';
import '/carregando/carregando21/carregando21_widget.dart';
import '/components/limite_inicial_scroll_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/home/feed_produto1/feed_produto1_widget.dart';
import '/loja/limpar_cache_img/limpar_cache_img_widget.dart';
import '/nav_bar/nav_bar_home/nav_bar_home_widget.dart';
import '/perfil/baixar_app/baixar_app_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (isWeb == true) {
        return;
      }

      if (FFAppState().LoginPrimeiraVez) {
        return;
      }

      FFAppState().LoginPrimeiraVez = true;
      safeSetState(() {});
      _model.apiResultp48 = await ObterIPCall.call();

      _model.query357 = await queryBaixarAppRecordOnce();
      _model.retorno1 = await actions.mapeamentoBaixarHomePaginaProduto(
        context,
        ObterIPCall.ip(
          (_model.apiResultp48?.jsonBody ?? ''),
        ),
        _model.query357!.toList(),
      );
      if (_model.retorno1 != null) {
        _model.query4 = await queryBaixarAppRecordOnce(
          queryBuilder: (baixarAppRecord) => baixarAppRecord.where(
            'baixarRef',
            isEqualTo: _model.retorno1,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.query4?.status == 'paginaProdutoAfiliado') {
          await _model.query4!.reference.update(createBaixarAppRecordData(
            acessouMobile: true,
          ));
          FFAppState().CarrinhoTemporarioNacional =
              _model.query4!.carrinhoNacional.toList().cast<String>();
          FFAppState().CarrinhoTemporarioInternacional =
              _model.query4!.carrinhoInternacional.toList().cast<String>();
          safeSetState(() {});

          context.pushNamed(
            PaginaProdutoAfiliadoWidget.routeName,
            queryParameters: {
              'produtoRef2': serializeParam(
                _model.query4?.produtoAfiliadoRef,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );

          return;
        } else {
          if (_model.query4?.status == 'carrinhoOff') {
            await _model.query4!.reference.update(createBaixarAppRecordData(
              acessouMobile: true,
            ));
            FFAppState().CarrinhoTemporarioNacional =
                _model.query4!.carrinhoNacional.toList().cast<String>();
            FFAppState().CarrinhoTemporarioInternacional =
                _model.query4!.carrinhoInternacional.toList().cast<String>();
            safeSetState(() {});

            context.pushNamed(CarrinhoNaoLogadoVendaWidget.routeName);

            return;
          } else {
            if (_model.query4?.status == 'carrinho') {
              await _model.query4!.reference.update(createBaixarAppRecordData(
                acessouMobile: true,
              ));
              FFAppState().CarrinhoTemporarioNacional =
                  _model.query4!.carrinhoNacional.toList().cast<String>();
              FFAppState().CarrinhoTemporarioInternacional =
                  _model.query4!.carrinhoInternacional.toList().cast<String>();
              safeSetState(() {});

              context.pushNamed(CarrinhoWidget.routeName);

              return;
            } else {
              return;
            }
          }
        }
      } else {
        return;
      }
    });

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
            wrapWithModel(
              model: _model.limiteInicialScrollFeedModel,
              updateCallback: () => safeSetState(() {}),
              child: LimiteInicialScrollFeedWidget(),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: StreamBuilder<List<ProdutoRecord>>(
                      stream: queryProdutoRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 26.0,
                              height: 26.0,
                              child: SpinKitCircle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                            ),
                          );
                        }
                        List<ProdutoRecord>
                            endOfScrollTriggerProdutoRecordList =
                            snapshot.data!;

                        return Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: custom_widgets.EndOfScrollTrigger(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            thresholdPx: 200.0,
                            debounceMs: 500,
                            onReachEnd: () async {
                              FFAppState().FeedAntes = functions
                                  .recomendarProdutosPersonalizados(
                                      endOfScrollTriggerProdutoRecordList
                                          .toList(),
                                      (currentUserDocument?.favorito
                                                  .toList() ??
                                              [])
                                          .toList(),
                                      (currentUserDocument
                                                  ?.historicoPesquisa
                                                  .toList() ??
                                              [])
                                          .toList(),
                                      (currentUserDocument
                                                  ?.vistoRecente
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
                              FFAppState().limiteVistualizacaoProdutoHomePage =
                                  FFAppState()
                                          .limiteVistualizacaoProdutoHomePage +
                                      12;
                              safeSetState(() {});
                              FFAppState().FeedDepois = functions
                                  .recomendarProdutosPersonalizados(
                                      endOfScrollTriggerProdutoRecordList
                                          .toList(),
                                      (currentUserDocument?.favorito
                                                  .toList() ??
                                              [])
                                          .toList(),
                                      (currentUserDocument
                                                  ?.historicoPesquisa
                                                  .toList() ??
                                              [])
                                          .toList(),
                                      (currentUserDocument
                                                  ?.vistoRecente
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
                              FFAppState().hasMore = (FFAppState().FeedAntes !=
                                      FFAppState().FeedDepois) ||
                                  (FFAppState().FeedAntes == '');
                              safeSetState(() {});
                            },
                            child: () => FeedProduto1Widget(),
                          ),
                        );
                      },
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
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: BaixarAppWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
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
            wrapWithModel(
              model: _model.limparCacheImgModel,
              updateCallback: () => safeSetState(() {}),
              child: LimparCacheImgWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
