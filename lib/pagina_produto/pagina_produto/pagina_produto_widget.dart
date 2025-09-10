import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/caregando2/caregando2_widget.dart';
import '/components/limite_inicial_scroll_feed_widget.dart';
import '/components/limpa_cache2_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/addto_card/addto_card_widget.dart';
import '/loja/variante/variante_widget.dart';
import '/pagina_produto/pagina_produto_scroll/pagina_produto_scroll_widget.dart';
import '/perfil/baixar_app/baixar_app_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'package:badges/badges.dart' as badges;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_produto_model.dart';
export 'pagina_produto_model.dart';

class PaginaProdutoWidget extends StatefulWidget {
  const PaginaProdutoWidget({
    super.key,
    required this.produtoRef,
  });

  final DocumentReference? produtoRef;

  static String routeName = 'Pagina_produto';
  static String routePath = '/paginaProduto';

  @override
  State<PaginaProdutoWidget> createState() => _PaginaProdutoWidgetState();
}

class _PaginaProdutoWidgetState extends State<PaginaProdutoWidget>
    with TickerProviderStateMixin {
  late PaginaProdutoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaProdutoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selecionarVariante1 = '';
      FFAppState().selecionarVariante2 = '';
      FFAppState().selecionarVariante1foto = '';
      safeSetState(() {});
    });

    animationsMap.addAll({
      'transformOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-28.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(-1.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1350.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1450.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transformOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-28.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(-1.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1350.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1450.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transformOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-28.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(-1.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1350.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1450.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<List<CarrinhoRecord>>(
      stream: queryCarrinhoRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: double.infinity,
              child: Caregando2Widget(),
            ),
          );
        }
        List<CarrinhoRecord> paginaProdutoCarrinhoRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                wrapWithModel(
                  model: _model.limiteInicialScrollFeedModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LimiteInicialScrollFeedWidget(),
                ),
                wrapWithModel(
                  model: _model.limpaCache2Model,
                  updateCallback: () => safeSetState(() {}),
                  child: LimpaCache2Widget(),
                ),
                StreamBuilder<List<ProdutoRecord>>(
                  stream: queryProdutoRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Caregando2Widget();
                    }
                    List<ProdutoRecord> endOfScrollTriggerProdutoRecordList =
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
                                  endOfScrollTriggerProdutoRecordList.toList(),
                                  (currentUserDocument?.favorito.toList() ??
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
                                  (currentUserDocument?.comprasHistoricoProdutos
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
                              FFAppState().limiteVistualizacaoProdutoHomePage +
                                  6;
                          safeSetState(() {});
                          FFAppState().FeedDepois = functions
                              .recomendarProdutosPersonalizados(
                                  endOfScrollTriggerProdutoRecordList.toList(),
                                  (currentUserDocument?.favorito.toList() ??
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
                                  (currentUserDocument?.comprasHistoricoProdutos
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
                        child: () => PaginaProdutoScrollWidget(
                          produtoRef: widget.produtoRef!,
                        ),
                      ),
                    );
                  },
                ),
                if ((FFAppState().bennerBaixarAPP == false) && isWeb)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().status = 'paginaProduto';
                      safeSetState(() {});
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
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: FutureBuilder<ProdutoRecord>(
                    future: ProdutoRecord.getDocumentOnce(widget.produtoRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 0.01,
                            height: 0.01,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0x004AA756),
                              ),
                            ),
                          ),
                        );
                      }

                      final containerProdutoRecord = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: 64.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 17.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (containerProdutoRecord.titulo1 == '')
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (loggedIn) {
                                          context.pushNamed(
                                            CompartilharLucrarWidget.routeName,
                                            queryParameters: {
                                              'produtoRef': serializeParam(
                                                widget.produtoRef,
                                                ParamType.DocumentReference,
                                              ),
                                              'maiorValorAfiliado':
                                                  serializeParam(
                                                functions.dinheiroStringemDouble(
                                                    functions.comissaoPerfilProduto(
                                                        containerProdutoRecord
                                                                    .preco !=
                                                                null
                                                            ? containerProdutoRecord
                                                                .preco
                                                            : containerProdutoRecord
                                                                .menorPrecoRevenda,
                                                        containerProdutoRecord
                                                            .comissaoAfiliado
                                                            .toDouble())),
                                                ParamType.double,
                                              ),
                                              'menorValorAfiliado':
                                                  serializeParam(
                                                containerProdutoRecord
                                                    .comissaoAfiliado
                                                    .toDouble(),
                                                ParamType.double,
                                              ),
                                              'variante': serializeParam(
                                                containerProdutoRecord
                                                            .titulo1 !=
                                                        '',
                                                ParamType.bool,
                                              ),
                                              'ultimaAtualizacao':
                                                  serializeParam(
                                                containerProdutoRecord
                                                    .ultimaAtualizacao,
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );

                                          FFAppState().comisaoAfiliado2 =
                                              containerProdutoRecord
                                                  .comissaoAfiliado
                                                  .toDouble();
                                          FFAppState().valorProduto =
                                              containerProdutoRecord.preco;
                                          safeSetState(() {});
                                        } else {
                                          context.pushNamed(
                                              LoginPrincipalWidget.routeName);
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        height: 39.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Icon(
                                                Icons.share,
                                                color: Color(0xFF303131),
                                                size: 17.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Compartilhar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                      ),
                                    ),
                                  ),
                                ),
                              if (containerProdutoRecord.titulo1 != '')
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: StreamBuilder<List<VarianteRecord>>(
                                      stream: queryVarianteRecord(
                                        parent: widget.produtoRef,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 26.0,
                                              height: 26.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 26.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<VarianteRecord>
                                            comVartianteVarianteRecordList =
                                            snapshot.data!;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (loggedIn) {
                                              context.pushNamed(
                                                CompartilharLucrarWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'produtoRef': serializeParam(
                                                    widget.produtoRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'maiorValorAfiliado':
                                                      serializeParam(
                                                    functions.dinheiroStringemDouble(
                                                        functions.comissaoPerfilProdutoVariante(
                                                            functions.afiliadoValianteValores(
                                                                comVartianteVarianteRecordList
                                                                    .toList()),
                                                            containerProdutoRecord
                                                                .comissaoAfiliado
                                                                .toDouble())),
                                                    ParamType.double,
                                                  ),
                                                  'menorValorAfiliado':
                                                      serializeParam(
                                                    containerProdutoRecord
                                                        .comissaoAfiliado
                                                        .toDouble(),
                                                    ParamType.double,
                                                  ),
                                                  'variante': serializeParam(
                                                    containerProdutoRecord
                                                                .titulo1 !=
                                                            '',
                                                    ParamType.bool,
                                                  ),
                                                  'ultimaAtualizacao':
                                                      serializeParam(
                                                    containerProdutoRecord
                                                        .ultimaAtualizacao,
                                                    ParamType.DateTime,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              FFAppState().comisaoAfiliado2 =
                                                  containerProdutoRecord
                                                      .comissaoAfiliado
                                                      .toDouble();
                                              FFAppState().varianteMediaValor =
                                                  functions.afiliadoValianteValores(
                                                      comVartianteVarianteRecordList
                                                          .toList());
                                              safeSetState(() {});
                                            } else {
                                              context.pushNamed(
                                                  LoginPrincipalWidget
                                                      .routeName);
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 39.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Icon(
                                                    Icons.share,
                                                    color: Color(0xFF303131),
                                                    size: 17.0,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Compartilhar',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (() {
                                if (valueOrDefault<bool>(
                                  (containerProdutoRecord.titulo1 !=
                                              '') &&
                                      valueOrDefault<bool>(
                                        (FFAppState()
                                                        .selecionarVariante2 ==
                                                    '') &&
                                            ((FFAppState()
                                                            .selecionarVariante1foto ==
                                                        '') &&
                                                (FFAppState()
                                                            .selecionarVariante1 ==
                                                        '')),
                                        true,
                                      ),
                                  true,
                                )) {
                                  return true;
                                } else if (valueOrDefault<bool>(
                                  (containerProdutoRecord.titulo1 !=
                                              '') &&
                                      (containerProdutoRecord.titulo2 !=
                                              '') &&
                                      valueOrDefault<bool>(
                                        (FFAppState()
                                                        .selecionarVariante2 ==
                                                    '') &&
                                            ((FFAppState()
                                                            .selecionarVariante1foto ==
                                                        '') ||
                                                (FFAppState()
                                                            .selecionarVariante1 ==
                                                        '')),
                                        true,
                                      ),
                                  true,
                                )) {
                                  return true;
                                } else {
                                  return false;
                                }
                              }())
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
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
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: VarianteWidget(
                                                  produtoRef:
                                                      widget.produtoRef!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        FFAppState().selecionarVariante1 = '';
                                        FFAppState().selecionarVariante2 = '';
                                        FFAppState().selecionarOpcao1 = false;
                                        FFAppState().selecionarOpcao2 = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        height: 39.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Adicionar ao carrinho',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                (containerProdutoRecord.titulo1 != '') &&
                                    (containerProdutoRecord.titulo2 != '') &&
                                    ((FFAppState().selecionarVariante2 !=
                                                '') &&
                                        ((FFAppState()
                                                        .selecionarVariante1foto !=
                                                    '') ||
                                            (FFAppState()
                                                        .selecionarVariante1 !=
                                                    ''))),
                                true,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: FutureBuilder<ProdutoRecord>(
                                      future: ProdutoRecord.getDocumentOnce(
                                          widget.produtoRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return AddtoCardWidget();
                                        }

                                        final carinhoVarianteOpc1Opc2ProdutoRecord =
                                            snapshot.data!;

                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: 39.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Transform.rotate(
                                                          angle: 94.0 *
                                                              (math.pi / 180),
                                                          child:
                                                              Transform.rotate(
                                                            angle: 266.0 *
                                                                (math.pi / 180),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.04,
                                                                          -0.76),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .box,
                                                                    color: Color(
                                                                        0xFFF0F0F0),
                                                                    size: 16.0,
                                                                  ).animateOnActionTrigger(
                                                                    animationsMap[
                                                                        'iconOnActionTriggerAnimation1']!,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'transformOnActionTriggerAnimation1']!,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 27.0,
                                                            height: 26.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation1']!,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.04, -0.76),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.box,
                                                          color:
                                                              Color(0xFFF0F0F0),
                                                          size: 16.0,
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'iconOnActionTriggerAnimation2']!,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.05, 0.36),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .shoppingCart,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 20.0,
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'iconOnActionTriggerAnimation3']!,
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
                                                                      2.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Container(
                                                            width: 115.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation2']!,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Adicionado🎉',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'textOnActionTriggerAnimation1']!,
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
                                                                      2.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Container(
                                                            width: 150.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation3']!,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  FFAppState()
                                                          .adicionarCarrinho ==
                                                      false,
                                                  true,
                                                ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Adicionar ao carrinho',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                StreamBuilder<
                                                    List<VarianteRecord>>(
                                                  stream: queryVarianteRecord(
                                                    parent: widget.produtoRef,
                                                    queryBuilder:
                                                        (varianteRecord) =>
                                                            varianteRecord
                                                                .where(
                                                      'opcao_titulo1',
                                                      isEqualTo: FFAppState()
                                                                      .selecionarVariante1 !=
                                                                  ''
                                                          ? FFAppState()
                                                              .selecionarVariante1
                                                          : carinhoVarianteOpc1Opc2ProdutoRecord
                                                              .varianteTitulo1List
                                                              .firstOrNull,
                                                    ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 0.01,
                                                          height: 0.01,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0x004AA756),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<VarianteRecord>
                                                        textarrumarVarianteRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final textarrumarVarianteRecord =
                                                        textarrumarVarianteRecordList
                                                                .isNotEmpty
                                                            ? textarrumarVarianteRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: StreamBuilder<
                                                          List<VarianteRecord>>(
                                                        stream:
                                                            queryVarianteRecord(
                                                          parent: widget
                                                              .produtoRef,
                                                          queryBuilder:
                                                              (varianteRecord) =>
                                                                  varianteRecord
                                                                      .where(
                                                                        'opcao_titulo2',
                                                                        isEqualTo:
                                                                            FFAppState().selecionarVariante2,
                                                                      )
                                                                      .where(
                                                                        'foto',
                                                                        isEqualTo:
                                                                            textarrumarVarianteRecord?.foto,
                                                                      ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 26.0,
                                                                height: 26.0,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 26.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<VarianteRecord>
                                                              containerVarianteRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final containerVarianteRecord =
                                                              containerVarianteRecordList
                                                                      .isNotEmpty
                                                                  ? containerVarianteRecordList
                                                                      .first
                                                                  : null;

                                                          return InkWell(
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
                                                              if (currentUserReference !=
                                                                  null) {
                                                                if (animationsMap[
                                                                        'transformOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'transformOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation2'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation3'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation3']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation2'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'textOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'textOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation3'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation3']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation4'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation4']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                FFAppState()
                                                                        .adicionarCarrinho =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                _model.respostaCarrinho2 =
                                                                    await queryCarrinhoRecordOnce(
                                                                  parent:
                                                                      currentUserReference,
                                                                );
                                                                if (functions.addCardEvitarDuplicar(
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .reference,
                                                                    '${containerVarianteRecord?.opcaoTitulo1}${containerVarianteRecord?.opcaoTitulo2 != null && containerVarianteRecord?.opcaoTitulo2 != '' ? ', ${containerVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                    _model
                                                                        .respostaCarrinho2!
                                                                        .toList())) {
                                                                  await CarrinhoRecord
                                                                          .createDoc(
                                                                              currentUserReference!)
                                                                      .set(
                                                                          createCarrinhoRecordData(
                                                                    userRef:
                                                                        currentUserReference,
                                                                    itens: carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .reference,
                                                                    quantidade:
                                                                        FFAppState()
                                                                            .quantidadeProduto,
                                                                    dataAdicao:
                                                                        getCurrentTimestamp,
                                                                    fotoCapa: textarrumarVarianteRecord?.foto !=
                                                                                null &&
                                                                            textarrumarVarianteRecord?.foto !=
                                                                                ''
                                                                        ? containerVarianteRecord
                                                                            ?.foto
                                                                        : carinhoVarianteOpc1Opc2ProdutoRecord
                                                                            .imagens
                                                                            .firstOrNull,
                                                                    titulo:
                                                                        carinhoVarianteOpc1Opc2ProdutoRecord
                                                                            .nome,
                                                                    selecionado:
                                                                        true,
                                                                    variacao:
                                                                        '${containerVarianteRecord?.opcaoTitulo1}${containerVarianteRecord?.opcaoTitulo2 != null && containerVarianteRecord?.opcaoTitulo2 != '' ? ', ${containerVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                    lojaRef:
                                                                        carinhoVarianteOpc1Opc2ProdutoRecord
                                                                            .lojaRef,
                                                                    preco: containerVarianteRecord
                                                                        ?.preco,
                                                                    precoAntes:
                                                                        carinhoVarianteOpc1Opc2ProdutoRecord
                                                                            .precoAntes,
                                                                    nacional:
                                                                        carinhoVarianteOpc1Opc2ProdutoRecord
                                                                            .envioNaciona,
                                                                    varianteRef:
                                                                        containerVarianteRecord
                                                                            ?.reference,
                                                                  ));
                                                                } else {
                                                                  await actions
                                                                      .addCartEvitarDuplicar(
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .reference,
                                                                    '${containerVarianteRecord?.opcaoTitulo1}${containerVarianteRecord?.opcaoTitulo2 != null && containerVarianteRecord?.opcaoTitulo2 != '' ? ', ${containerVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                    _model
                                                                        .respostaCarrinho2!
                                                                        .toList(),
                                                                    FFAppState()
                                                                        .quantidadeProduto,
                                                                  );
                                                                }

                                                                await Future
                                                                    .delayed(
                                                                  Duration(
                                                                    milliseconds:
                                                                        1500,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .verCarrinhoLogado =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                await Future
                                                                    .delayed(
                                                                  Duration(
                                                                    milliseconds:
                                                                        3000,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .adicionarCarrinho =
                                                                    false;
                                                                FFAppState()
                                                                        .verCarrinhoLogado =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                if (animationsMap[
                                                                        'transformOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'transformOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation2'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation3'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation3']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation2'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'textOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'textOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation3'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation3']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation4'] !=
                                                                    null) {
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation4']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                if (carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .envioNaciona ==
                                                                    true) {
                                                                  FFAppState().CarrinhoTemporarioNacional = functions
                                                                      .addCarrinhoTemporario(
                                                                          getCurrentTimestamp,
                                                                          containerVarianteRecord?.foto != null && containerVarianteRecord?.foto != ''
                                                                              ? containerVarianteRecord!
                                                                                  .foto
                                                                              : carinhoVarianteOpc1Opc2ProdutoRecord
                                                                                  .imagens.firstOrNull!,
                                                                          containerVarianteRecord!
                                                                              .produtoRef!,
                                                                          carinhoVarianteOpc1Opc2ProdutoRecord
                                                                              .lojaRef!,
                                                                          true,
                                                                          containerVarianteRecord
                                                                              .preco,
                                                                          carinhoVarianteOpc1Opc2ProdutoRecord
                                                                              .precoAntes,
                                                                          FFAppState()
                                                                              .quantidadeProduto,
                                                                          true,
                                                                          carinhoVarianteOpc1Opc2ProdutoRecord
                                                                              .nome,
                                                                          containerVarianteRecord
                                                                              .opcaoTitulo1,
                                                                          FFAppState()
                                                                              .CarrinhoTemporarioNacional
                                                                              .toList(),
                                                                          null,
                                                                          null,
                                                                          containerVarianteRecord
                                                                              .opcaoTitulo2,
                                                                          containerVarianteRecord
                                                                              .reference)
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  FFAppState().CarrinhoTemporarioInternacional = functions
                                                                      .addCarrinhoTemporario(
                                                                          getCurrentTimestamp,
                                                                          containerVarianteRecord?.foto != null && containerVarianteRecord?.foto != ''
                                                                              ? containerVarianteRecord!
                                                                                  .foto
                                                                              : carinhoVarianteOpc1Opc2ProdutoRecord
                                                                                  .imagens.firstOrNull!,
                                                                          containerVarianteRecord!
                                                                              .produtoRef!,
                                                                          carinhoVarianteOpc1Opc2ProdutoRecord
                                                                              .lojaRef!,
                                                                          false,
                                                                          containerVarianteRecord
                                                                              .preco,
                                                                          carinhoVarianteOpc1Opc2ProdutoRecord
                                                                              .precoAntes,
                                                                          FFAppState()
                                                                              .quantidadeProduto,
                                                                          true,
                                                                          carinhoVarianteOpc1Opc2ProdutoRecord
                                                                              .nome,
                                                                          containerVarianteRecord
                                                                              .opcaoTitulo1,
                                                                          FFAppState()
                                                                              .CarrinhoTemporarioInternacional
                                                                              .toList(),
                                                                          null,
                                                                          null,
                                                                          containerVarianteRecord
                                                                              .opcaoTitulo2,
                                                                          containerVarianteRecord
                                                                              .reference)
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                FFAppState()
                                                                        .adicionarCarrinho =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                await Future
                                                                    .delayed(
                                                                  Duration(
                                                                    milliseconds:
                                                                        1500,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .verCarrinhoLogado =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                await Future
                                                                    .delayed(
                                                                  Duration(
                                                                    milliseconds:
                                                                        3000,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .adicionarCarrinho =
                                                                    false;
                                                                FFAppState()
                                                                        .verCarrinhoLogado =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation4']!,
                                                    );
                                                  },
                                                ),
                                                StreamBuilder<
                                                    List<VarianteRecord>>(
                                                  stream: queryVarianteRecord(
                                                    parent:
                                                        carinhoVarianteOpc1Opc2ProdutoRecord
                                                            .reference,
                                                    queryBuilder:
                                                        (varianteRecord) =>
                                                            varianteRecord
                                                                .where(
                                                                  'opcao_titulo2',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .selecionarVariante2,
                                                                )
                                                                .where(
                                                                  'foto',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .selecionarVariante1foto,
                                                                ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 0.01,
                                                          height: 0.01,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0x004AA756),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<VarianteRecord>
                                                        text4444fotoVarianteRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final text4444fotoVarianteRecord =
                                                        text4444fotoVarianteRecordList
                                                                .isNotEmpty
                                                            ? text4444fotoVarianteRecordList
                                                                .first
                                                            : null;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (currentUserReference !=
                                                            null) {
                                                          if (animationsMap[
                                                                  'transformOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'transformOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'iconOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'iconOnActionTriggerAnimation2'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'iconOnActionTriggerAnimation3'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconOnActionTriggerAnimation3']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation2'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'textOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'textOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation3'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation3']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation5'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation5']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          FFAppState()
                                                                  .adicionarCarrinho =
                                                              true;
                                                          safeSetState(() {});
                                                          _model.respostaCarrinho =
                                                              await queryCarrinhoRecordOnce(
                                                            parent:
                                                                currentUserReference,
                                                          );
                                                          if (functions.addCardEvitarDuplicar(
                                                              carinhoVarianteOpc1Opc2ProdutoRecord
                                                                  .reference,
                                                              '${text4444fotoVarianteRecord?.opcaoTitulo1}${text4444fotoVarianteRecord?.opcaoTitulo2 != null && text4444fotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${text4444fotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                              _model
                                                                  .respostaCarrinho!
                                                                  .toList())) {
                                                            await CarrinhoRecord
                                                                    .createDoc(
                                                                        currentUserReference!)
                                                                .set(
                                                                    createCarrinhoRecordData(
                                                              userRef:
                                                                  currentUserReference,
                                                              itens:
                                                                  carinhoVarianteOpc1Opc2ProdutoRecord
                                                                      .reference,
                                                              quantidade:
                                                                  FFAppState()
                                                                      .quantidadeProduto,
                                                              dataAdicao:
                                                                  getCurrentTimestamp,
                                                              fotoCapa: text4444fotoVarianteRecord
                                                                              ?.foto !=
                                                                          null &&
                                                                      text4444fotoVarianteRecord
                                                                              ?.foto !=
                                                                          ''
                                                                  ? text4444fotoVarianteRecord
                                                                      ?.foto
                                                                  : carinhoVarianteOpc1Opc2ProdutoRecord
                                                                      .imagens
                                                                      .firstOrNull,
                                                              titulo:
                                                                  carinhoVarianteOpc1Opc2ProdutoRecord
                                                                      .nome,
                                                              selecionado: true,
                                                              variacao:
                                                                  '${text4444fotoVarianteRecord?.opcaoTitulo1}${text4444fotoVarianteRecord?.opcaoTitulo2 != null && text4444fotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${text4444fotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                              lojaRef:
                                                                  carinhoVarianteOpc1Opc2ProdutoRecord
                                                                      .lojaRef,
                                                              preco:
                                                                  text4444fotoVarianteRecord
                                                                      ?.preco,
                                                              precoAntes:
                                                                  carinhoVarianteOpc1Opc2ProdutoRecord
                                                                      .precoAntes,
                                                              nacional:
                                                                  carinhoVarianteOpc1Opc2ProdutoRecord
                                                                      .envioNaciona,
                                                              varianteRef:
                                                                  text4444fotoVarianteRecord
                                                                      ?.reference,
                                                            ));
                                                          } else {
                                                            await actions
                                                                .addCartEvitarDuplicar(
                                                              carinhoVarianteOpc1Opc2ProdutoRecord
                                                                  .reference,
                                                              '${text4444fotoVarianteRecord?.opcaoTitulo1}${text4444fotoVarianteRecord?.opcaoTitulo2 != null && text4444fotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${text4444fotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                              _model
                                                                  .respostaCarrinho!
                                                                  .toList(),
                                                              FFAppState()
                                                                  .quantidadeProduto,
                                                            );
                                                          }

                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds:
                                                                  1500,
                                                            ),
                                                          );
                                                          FFAppState()
                                                                  .verCarrinhoLogado =
                                                              true;
                                                          safeSetState(() {});
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds:
                                                                  3000,
                                                            ),
                                                          );
                                                          FFAppState()
                                                                  .adicionarCarrinho =
                                                              false;
                                                          FFAppState()
                                                                  .verCarrinhoLogado =
                                                              false;
                                                          safeSetState(() {});
                                                        } else {
                                                          if (animationsMap[
                                                                  'transformOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'transformOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'iconOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'iconOnActionTriggerAnimation2'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'iconOnActionTriggerAnimation3'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconOnActionTriggerAnimation3']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation2'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'textOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'textOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation3'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation3']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation5'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation5']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (carinhoVarianteOpc1Opc2ProdutoRecord
                                                                  .envioNaciona ==
                                                              true) {
                                                            FFAppState().CarrinhoTemporarioNacional = functions
                                                                .addCarrinhoTemporario(
                                                                    getCurrentTimestamp,
                                                                    text4444fotoVarianteRecord?.foto !=
                                                                                null &&
                                                                            text4444fotoVarianteRecord?.foto !=
                                                                                ''
                                                                        ? text4444fotoVarianteRecord!
                                                                            .foto
                                                                        : carinhoVarianteOpc1Opc2ProdutoRecord
                                                                            .imagens
                                                                            .firstOrNull!,
                                                                    text4444fotoVarianteRecord!
                                                                        .produtoRef!,
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .lojaRef!,
                                                                    true,
                                                                    text4444fotoVarianteRecord
                                                                        .preco,
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .precoAntes,
                                                                    FFAppState()
                                                                        .quantidadeProduto,
                                                                    true,
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .nome,
                                                                    text4444fotoVarianteRecord
                                                                        .opcaoTitulo1,
                                                                    FFAppState()
                                                                        .CarrinhoTemporarioNacional
                                                                        .toList(),
                                                                    null,
                                                                    null,
                                                                    text4444fotoVarianteRecord
                                                                        .opcaoTitulo2,
                                                                    text4444fotoVarianteRecord
                                                                        .reference)
                                                                .toList()
                                                                .cast<String>();
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState().CarrinhoTemporarioInternacional = functions
                                                                .addCarrinhoTemporario(
                                                                    getCurrentTimestamp,
                                                                    text4444fotoVarianteRecord?.foto !=
                                                                                null &&
                                                                            text4444fotoVarianteRecord?.foto !=
                                                                                ''
                                                                        ? text4444fotoVarianteRecord!
                                                                            .foto
                                                                        : carinhoVarianteOpc1Opc2ProdutoRecord
                                                                            .imagens
                                                                            .firstOrNull!,
                                                                    text4444fotoVarianteRecord!
                                                                        .produtoRef!,
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .lojaRef!,
                                                                    false,
                                                                    text4444fotoVarianteRecord
                                                                        .preco,
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .precoAntes,
                                                                    FFAppState()
                                                                        .quantidadeProduto,
                                                                    true,
                                                                    carinhoVarianteOpc1Opc2ProdutoRecord
                                                                        .nome,
                                                                    text4444fotoVarianteRecord
                                                                        .opcaoTitulo1,
                                                                    FFAppState()
                                                                        .CarrinhoTemporarioInternacional
                                                                        .toList(),
                                                                    null,
                                                                    null,
                                                                    text4444fotoVarianteRecord
                                                                        .opcaoTitulo2,
                                                                    text4444fotoVarianteRecord
                                                                        .reference)
                                                                .toList()
                                                                .cast<String>();
                                                            safeSetState(() {});
                                                          }

                                                          FFAppState()
                                                                  .adicionarCarrinho =
                                                              true;
                                                          safeSetState(() {});
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds:
                                                                  1500,
                                                            ),
                                                          );
                                                          FFAppState()
                                                                  .verCarrinhoLogado =
                                                              true;
                                                          safeSetState(() {});
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds:
                                                                  3000,
                                                            ),
                                                          );
                                                          FFAppState()
                                                                  .adicionarCarrinho =
                                                              false;
                                                          FFAppState()
                                                                  .verCarrinhoLogado =
                                                              false;
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Adicionar ao carrinho',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation5']!,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                (containerProdutoRecord.titulo1 != '') &&
                                    (containerProdutoRecord.titulo2 == '') &&
                                    ((FFAppState()
                                                    .selecionarVariante1foto !=
                                                '') ||
                                        (FFAppState().selecionarVariante1 !=
                                                '')),
                                true,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: FutureBuilder<ProdutoRecord>(
                                      future: ProdutoRecord.getDocumentOnce(
                                          widget.produtoRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return AddtoCardWidget();
                                        }

                                        final carinhoVarianteOpc1ProdutoRecord =
                                            snapshot.data!;

                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: 39.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Transform.rotate(
                                                          angle: 94.0 *
                                                              (math.pi / 180),
                                                          child:
                                                              Transform.rotate(
                                                            angle: 266.0 *
                                                                (math.pi / 180),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.04,
                                                                          -0.76),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .box,
                                                                    color: Color(
                                                                        0xFFF0F0F0),
                                                                    size: 16.0,
                                                                  ).animateOnActionTrigger(
                                                                    animationsMap[
                                                                        'iconOnActionTriggerAnimation4']!,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'transformOnActionTriggerAnimation2']!,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 27.0,
                                                            height: 26.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation6']!,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.04, -0.76),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.box,
                                                          color:
                                                              Color(0xFFF0F0F0),
                                                          size: 16.0,
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'iconOnActionTriggerAnimation5']!,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.05, 0.36),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .shoppingCart,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 20.0,
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'iconOnActionTriggerAnimation6']!,
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
                                                                      2.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Container(
                                                            width: 115.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation7']!,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Adicionado🎉',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'textOnActionTriggerAnimation2']!,
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
                                                                      2.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Container(
                                                            width: 150.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation8']!,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (FFAppState()
                                                        .adicionarCarrinho ==
                                                    false)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Adicionar ao carrinho',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                            .selecionarVariante1foto !=
                                                        '')
                                                  FutureBuilder<
                                                      List<VarianteRecord>>(
                                                    future:
                                                        queryVarianteRecordOnce(
                                                      parent:
                                                          carinhoVarianteOpc1ProdutoRecord
                                                              .reference,
                                                      queryBuilder:
                                                          (varianteRecord) =>
                                                              varianteRecord
                                                                  .where(
                                                        'foto',
                                                        isEqualTo: FFAppState()
                                                            .selecionarVariante1foto,
                                                      ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 0.01,
                                                            height: 0.01,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color(
                                                                    0x004AA756),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<VarianteRecord>
                                                          textFotoVarianteRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final textFotoVarianteRecord =
                                                          textFotoVarianteRecordList
                                                                  .isNotEmpty
                                                              ? textFotoVarianteRecordList
                                                                  .first
                                                              : null;

                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (currentUserReference !=
                                                              null) {
                                                            if (animationsMap[
                                                                    'transformOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'transformOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation4'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation4']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation5'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation5']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation7'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation7']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'textOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'textOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation8'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation8']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation9'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation9']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.respostaCarrinho3 =
                                                                await queryCarrinhoRecordOnce(
                                                              parent:
                                                                  currentUserReference,
                                                            );
                                                            if (functions.addCardEvitarDuplicar(
                                                                carinhoVarianteOpc1ProdutoRecord
                                                                    .reference,
                                                                '${textFotoVarianteRecord?.opcaoTitulo1}${textFotoVarianteRecord?.opcaoTitulo2 != null && textFotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${textFotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                _model
                                                                    .respostaCarrinho3!
                                                                    .toList())) {
                                                              await CarrinhoRecord
                                                                      .createDoc(
                                                                          currentUserReference!)
                                                                  .set(
                                                                      createCarrinhoRecordData(
                                                                userRef:
                                                                    currentUserReference,
                                                                itens: carinhoVarianteOpc1ProdutoRecord
                                                                    .reference,
                                                                quantidade:
                                                                    FFAppState()
                                                                        .quantidadeProduto,
                                                                dataAdicao:
                                                                    getCurrentTimestamp,
                                                                fotoCapa: textFotoVarianteRecord?.foto !=
                                                                            null &&
                                                                        textFotoVarianteRecord?.foto !=
                                                                            ''
                                                                    ? textFotoVarianteRecord
                                                                        ?.foto
                                                                    : carinhoVarianteOpc1ProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull,
                                                                titulo:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .nome,
                                                                selecionado:
                                                                    true,
                                                                variacao:
                                                                    '${textFotoVarianteRecord?.opcaoTitulo1}${textFotoVarianteRecord?.opcaoTitulo2 != null && textFotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${textFotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                lojaRef:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .lojaRef,
                                                                preco:
                                                                    textFotoVarianteRecord
                                                                        ?.preco,
                                                                precoAntes:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .precoAntes,
                                                                nacional:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .envioNaciona,
                                                                varianteRef:
                                                                    textFotoVarianteRecord
                                                                        ?.reference,
                                                              ));
                                                            } else {
                                                              await actions
                                                                  .addCartEvitarDuplicar(
                                                                textFotoVarianteRecord!
                                                                    .produtoRef!,
                                                                '${textFotoVarianteRecord.opcaoTitulo1}${textFotoVarianteRecord.opcaoTitulo2 != '' ? ', ${textFotoVarianteRecord.opcaoTitulo2}' : ' '}',
                                                                _model
                                                                    .respostaCarrinho3!
                                                                    .toList(),
                                                                FFAppState()
                                                                    .quantidadeProduto,
                                                              );
                                                            }

                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    1500,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                true;
                                                            safeSetState(() {});
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    3000,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                false;
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            if (animationsMap[
                                                                    'transformOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'transformOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation4'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation4']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation5'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation5']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation7'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation7']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'textOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'textOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation8'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation8']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation9'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation9']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (carinhoVarianteOpc1ProdutoRecord
                                                                    .envioNaciona ==
                                                                true) {
                                                              FFAppState().CarrinhoTemporarioNacional = functions
                                                                  .addCarrinhoTemporario(
                                                                      getCurrentTimestamp,
                                                                      textFotoVarianteRecord?.foto != null &&
                                                                              textFotoVarianteRecord?.foto !=
                                                                                  ''
                                                                          ? textFotoVarianteRecord!
                                                                              .foto
                                                                          : carinhoVarianteOpc1ProdutoRecord
                                                                              .imagens
                                                                              .firstOrNull!,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .reference,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .lojaRef!,
                                                                      true,
                                                                      textFotoVarianteRecord!
                                                                          .preco,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .precoAntes,
                                                                      FFAppState()
                                                                          .quantidadeProduto,
                                                                      true,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .nome,
                                                                      textFotoVarianteRecord
                                                                          .opcaoTitulo1,
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioNacional
                                                                          .toList(),
                                                                      null,
                                                                      null,
                                                                      textFotoVarianteRecord
                                                                          .opcaoTitulo2,
                                                                      textFotoVarianteRecord
                                                                          .reference)
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              FFAppState().CarrinhoTemporarioInternacional = functions
                                                                  .addCarrinhoTemporario(
                                                                      getCurrentTimestamp,
                                                                      textFotoVarianteRecord?.foto != null &&
                                                                              textFotoVarianteRecord?.foto !=
                                                                                  ''
                                                                          ? textFotoVarianteRecord!
                                                                              .foto
                                                                          : carinhoVarianteOpc1ProdutoRecord
                                                                              .imagens
                                                                              .firstOrNull!,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .reference,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .lojaRef!,
                                                                      false,
                                                                      textFotoVarianteRecord!
                                                                          .preco,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .precoAntes,
                                                                      FFAppState()
                                                                          .quantidadeProduto,
                                                                      true,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .nome,
                                                                      textFotoVarianteRecord
                                                                          .opcaoTitulo1,
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioInternacional
                                                                          .toList(),
                                                                      null,
                                                                      null,
                                                                      textFotoVarianteRecord
                                                                          .opcaoTitulo2,
                                                                      textFotoVarianteRecord
                                                                          .reference)
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                true;
                                                            safeSetState(() {});
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    1500,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                true;
                                                            safeSetState(() {});
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    3000,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                false;
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                false;
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'Adicionar ao carrinho',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation9']!,
                                                      );
                                                    },
                                                  ),
                                                if (FFAppState()
                                                            .selecionarVariante1 !=
                                                        '')
                                                  FutureBuilder<
                                                      List<VarianteRecord>>(
                                                    future:
                                                        queryVarianteRecordOnce(
                                                      parent:
                                                          carinhoVarianteOpc1ProdutoRecord
                                                              .reference,
                                                      queryBuilder:
                                                          (varianteRecord) =>
                                                              varianteRecord
                                                                  .where(
                                                        'opcao_titulo1',
                                                        isEqualTo: FFAppState()
                                                            .selecionarVariante1,
                                                      ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 0.01,
                                                            height: 0.01,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color(
                                                                    0x004AA756),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<VarianteRecord>
                                                          textSemFotoVarianteRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final textSemFotoVarianteRecord =
                                                          textSemFotoVarianteRecordList
                                                                  .isNotEmpty
                                                              ? textSemFotoVarianteRecordList
                                                                  .first
                                                              : null;

                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (currentUserReference !=
                                                              null) {
                                                            if (animationsMap[
                                                                    'transformOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'transformOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation4'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation4']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation5'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation5']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation7'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation7']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'textOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'textOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation8'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation8']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation10'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation10']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.respostaCarrinho5 =
                                                                await queryCarrinhoRecordOnce(
                                                              parent:
                                                                  currentUserReference,
                                                            );
                                                            if (functions.addCardEvitarDuplicar(
                                                                carinhoVarianteOpc1ProdutoRecord
                                                                    .reference,
                                                                '${textSemFotoVarianteRecord?.opcaoTitulo1}${textSemFotoVarianteRecord?.opcaoTitulo2 != null && textSemFotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${textSemFotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                _model
                                                                    .respostaCarrinho5!
                                                                    .toList())) {
                                                              await CarrinhoRecord
                                                                      .createDoc(
                                                                          currentUserReference!)
                                                                  .set(
                                                                      createCarrinhoRecordData(
                                                                userRef:
                                                                    currentUserReference,
                                                                itens: carinhoVarianteOpc1ProdutoRecord
                                                                    .reference,
                                                                quantidade:
                                                                    FFAppState()
                                                                        .quantidadeProduto,
                                                                dataAdicao:
                                                                    getCurrentTimestamp,
                                                                fotoCapa: textSemFotoVarianteRecord?.foto !=
                                                                            null &&
                                                                        textSemFotoVarianteRecord?.foto !=
                                                                            ''
                                                                    ? textSemFotoVarianteRecord
                                                                        ?.foto
                                                                    : carinhoVarianteOpc1ProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull,
                                                                titulo:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .nome,
                                                                selecionado:
                                                                    true,
                                                                variacao:
                                                                    '${textSemFotoVarianteRecord?.opcaoTitulo1}${textSemFotoVarianteRecord?.opcaoTitulo2 != null && textSemFotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${textSemFotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                lojaRef:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .lojaRef,
                                                                preco:
                                                                    textSemFotoVarianteRecord
                                                                        ?.preco,
                                                                precoAntes:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .precoAntes,
                                                                nacional:
                                                                    carinhoVarianteOpc1ProdutoRecord
                                                                        .envioNaciona,
                                                                varianteRef:
                                                                    textSemFotoVarianteRecord
                                                                        ?.reference,
                                                              ));
                                                            } else {
                                                              await actions
                                                                  .addCartEvitarDuplicar(
                                                                textSemFotoVarianteRecord!
                                                                    .produtoRef!,
                                                                '${textSemFotoVarianteRecord.opcaoTitulo1}${textSemFotoVarianteRecord.opcaoTitulo2 != '' ? ', ${textSemFotoVarianteRecord.opcaoTitulo2}' : ' '}',
                                                                _model
                                                                    .respostaCarrinho5!
                                                                    .toList(),
                                                                FFAppState()
                                                                    .quantidadeProduto,
                                                              );
                                                            }

                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    1500,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                true;
                                                            safeSetState(() {});
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    3000,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                false;
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            if (animationsMap[
                                                                    'transformOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'transformOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation4'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation4']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation5'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation5']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation6']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation7'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation7']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'textOnActionTriggerAnimation2'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'textOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation8'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation8']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation10'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'containerOnActionTriggerAnimation10']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (carinhoVarianteOpc1ProdutoRecord
                                                                    .envioNaciona ==
                                                                true) {
                                                              FFAppState().CarrinhoTemporarioNacional = functions
                                                                  .addCarrinhoTemporario(
                                                                      getCurrentTimestamp,
                                                                      textSemFotoVarianteRecord?.foto != null &&
                                                                              textSemFotoVarianteRecord?.foto !=
                                                                                  ''
                                                                          ? textSemFotoVarianteRecord!
                                                                              .foto
                                                                          : carinhoVarianteOpc1ProdutoRecord
                                                                              .imagens
                                                                              .firstOrNull!,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .reference,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .lojaRef!,
                                                                      true,
                                                                      textSemFotoVarianteRecord!
                                                                          .preco,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .precoAntes,
                                                                      FFAppState()
                                                                          .quantidadeProduto,
                                                                      true,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .nome,
                                                                      textSemFotoVarianteRecord
                                                                          .opcaoTitulo1,
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioNacional
                                                                          .toList(),
                                                                      null,
                                                                      null,
                                                                      textSemFotoVarianteRecord
                                                                          .opcaoTitulo2,
                                                                      textSemFotoVarianteRecord
                                                                          .reference)
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              FFAppState().CarrinhoTemporarioInternacional = functions
                                                                  .addCarrinhoTemporario(
                                                                      getCurrentTimestamp,
                                                                      textSemFotoVarianteRecord?.foto != null &&
                                                                              textSemFotoVarianteRecord?.foto !=
                                                                                  ''
                                                                          ? textSemFotoVarianteRecord!
                                                                              .foto
                                                                          : carinhoVarianteOpc1ProdutoRecord
                                                                              .imagens
                                                                              .firstOrNull!,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .reference,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .lojaRef!,
                                                                      false,
                                                                      textSemFotoVarianteRecord!
                                                                          .preco,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .precoAntes,
                                                                      FFAppState()
                                                                          .quantidadeProduto,
                                                                      true,
                                                                      carinhoVarianteOpc1ProdutoRecord
                                                                          .nome,
                                                                      textSemFotoVarianteRecord
                                                                          .opcaoTitulo1,
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioInternacional
                                                                          .toList(),
                                                                      null,
                                                                      null,
                                                                      textSemFotoVarianteRecord
                                                                          .opcaoTitulo2,
                                                                      textSemFotoVarianteRecord
                                                                          .reference)
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                true;
                                                            safeSetState(() {});
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    1500,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                true;
                                                            safeSetState(() {});
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    3000,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .adicionarCarrinho =
                                                                false;
                                                            FFAppState()
                                                                    .verCarrinhoLogado =
                                                                false;
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'Adicionar ao carrinho',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation10']!,
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                (containerProdutoRecord.titulo1 == '') &&
                                    (containerProdutoRecord.titulo2 == ''),
                                true,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: StreamBuilder<ProdutoRecord>(
                                      stream: ProdutoRecord.getDocument(
                                          widget.produtoRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return AddtoCardWidget();
                                        }

                                        final carinhoSemVarianteProdutoRecord =
                                            snapshot.data!;

                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: 39.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Transform.rotate(
                                                        angle: 94.0 *
                                                            (math.pi / 180),
                                                        child: Transform.rotate(
                                                          angle: 266.0 *
                                                              (math.pi / 180),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.04,
                                                                        -0.76),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .box,
                                                                  color: Color(
                                                                      0xFFF0F0F0),
                                                                  size: 16.0,
                                                                ).animateOnActionTrigger(
                                                                  animationsMap[
                                                                      'iconOnActionTriggerAnimation7']!,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'transformOnActionTriggerAnimation3']!,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 27.0,
                                                          height: 26.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation11']!,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.04, -0.76),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.box,
                                                        color:
                                                            Color(0xFFF0F0F0),
                                                        size: 16.0,
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'iconOnActionTriggerAnimation8']!,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.05, 0.36),
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .shoppingCart,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'iconOnActionTriggerAnimation9']!,
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
                                                                    2.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Container(
                                                          width: 115.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation12']!,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Adicionado🎉',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'textOnActionTriggerAnimation3']!,
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
                                                                    2.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Container(
                                                          width: 150.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation13']!,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (FFAppState()
                                                      .adicionarCarrinho ==
                                                  false)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Adicionar ao carrinho',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (currentUserReference !=
                                                      null) {
                                                    if (animationsMap[
                                                            'transformOnActionTriggerAnimation3'] !=
                                                        null) {
                                                      animationsMap[
                                                              'transformOnActionTriggerAnimation3']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'iconOnActionTriggerAnimation7'] !=
                                                        null) {
                                                      animationsMap[
                                                              'iconOnActionTriggerAnimation7']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation11'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation11']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'iconOnActionTriggerAnimation8'] !=
                                                        null) {
                                                      animationsMap[
                                                              'iconOnActionTriggerAnimation8']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'iconOnActionTriggerAnimation9'] !=
                                                        null) {
                                                      animationsMap[
                                                              'iconOnActionTriggerAnimation9']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation12'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation12']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'textOnActionTriggerAnimation3'] !=
                                                        null) {
                                                      animationsMap[
                                                              'textOnActionTriggerAnimation3']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation13'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation13']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation14'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation14']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    FFAppState()
                                                            .adicionarCarrinho =
                                                        true;
                                                    safeSetState(() {});
                                                    _model.respostaCarrinhSemVariante1 =
                                                        await queryCarrinhoRecordOnce(
                                                      parent:
                                                          currentUserReference,
                                                    );
                                                    if (functions
                                                        .addCardEvitarDuplicarSemVariante(
                                                            carinhoSemVarianteProdutoRecord
                                                                .reference,
                                                            _model
                                                                .respostaCarrinhSemVariante1!
                                                                .toList())) {
                                                      await CarrinhoRecord
                                                              .createDoc(
                                                                  currentUserReference!)
                                                          .set(
                                                              createCarrinhoRecordData(
                                                        userRef:
                                                            currentUserReference,
                                                        itens:
                                                            carinhoSemVarianteProdutoRecord
                                                                .reference,
                                                        quantidade: FFAppState()
                                                            .quantidadeProduto,
                                                        dataAdicao:
                                                            getCurrentTimestamp,
                                                        fotoCapa:
                                                            containerProdutoRecord
                                                                .imagens
                                                                .firstOrNull,
                                                        titulo:
                                                            carinhoSemVarianteProdutoRecord
                                                                .nome,
                                                        selecionado: true,
                                                        lojaRef:
                                                            carinhoSemVarianteProdutoRecord
                                                                .lojaRef,
                                                        preco:
                                                            carinhoSemVarianteProdutoRecord
                                                                .preco,
                                                        precoAntes:
                                                            carinhoSemVarianteProdutoRecord
                                                                .precoAntes,
                                                        nacional:
                                                            carinhoSemVarianteProdutoRecord
                                                                .envioNaciona,
                                                      ));
                                                    } else {
                                                      await actions
                                                          .addCartEvitarDuplicarSemVariente(
                                                        carinhoSemVarianteProdutoRecord
                                                            .reference,
                                                        _model
                                                            .respostaCarrinhSemVariante1!
                                                            .toList(),
                                                        FFAppState()
                                                            .quantidadeProduto,
                                                      );
                                                    }

                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 1500,
                                                      ),
                                                    );
                                                    FFAppState()
                                                            .verCarrinhoLogado =
                                                        true;
                                                    safeSetState(() {});
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 3000,
                                                      ),
                                                    );
                                                    FFAppState()
                                                            .adicionarCarrinho =
                                                        false;
                                                    FFAppState()
                                                            .verCarrinhoLogado =
                                                        false;
                                                    safeSetState(() {});
                                                  } else {
                                                    if (animationsMap[
                                                            'transformOnActionTriggerAnimation3'] !=
                                                        null) {
                                                      animationsMap[
                                                              'transformOnActionTriggerAnimation3']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'iconOnActionTriggerAnimation7'] !=
                                                        null) {
                                                      animationsMap[
                                                              'iconOnActionTriggerAnimation7']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation11'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation11']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'iconOnActionTriggerAnimation8'] !=
                                                        null) {
                                                      animationsMap[
                                                              'iconOnActionTriggerAnimation8']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'iconOnActionTriggerAnimation9'] !=
                                                        null) {
                                                      animationsMap[
                                                              'iconOnActionTriggerAnimation9']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation12'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation12']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'textOnActionTriggerAnimation3'] !=
                                                        null) {
                                                      animationsMap[
                                                              'textOnActionTriggerAnimation3']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation13'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation13']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation14'] !=
                                                        null) {
                                                      animationsMap[
                                                              'containerOnActionTriggerAnimation14']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    if (carinhoSemVarianteProdutoRecord
                                                            .envioNaciona ==
                                                        true) {
                                                      FFAppState().CarrinhoTemporarioNacional = functions
                                                          .addCarrinhoTemporario(
                                                              getCurrentTimestamp,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .imagens
                                                                  .firstOrNull!,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .reference,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .lojaRef!,
                                                              true,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .preco,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .precoAntes,
                                                              FFAppState()
                                                                  .quantidadeProduto,
                                                              true,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .nome,
                                                              '',
                                                              FFAppState()
                                                                  .CarrinhoTemporarioNacional
                                                                  .toList(),
                                                              null,
                                                              null,
                                                              '',
                                                              null)
                                                          .toList()
                                                          .cast<String>();
                                                      safeSetState(() {});
                                                    } else {
                                                      FFAppState().CarrinhoTemporarioInternacional = functions
                                                          .addCarrinhoTemporario(
                                                              getCurrentTimestamp,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .imagens
                                                                  .firstOrNull!,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .reference,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .lojaRef!,
                                                              false,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .preco,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .precoAntes,
                                                              FFAppState()
                                                                  .quantidadeProduto,
                                                              true,
                                                              carinhoSemVarianteProdutoRecord
                                                                  .nome,
                                                              '',
                                                              FFAppState()
                                                                  .CarrinhoTemporarioInternacional
                                                                  .toList(),
                                                              null,
                                                              null,
                                                              '',
                                                              null)
                                                          .toList()
                                                          .cast<String>();
                                                      safeSetState(() {});
                                                    }

                                                    FFAppState()
                                                            .adicionarCarrinho =
                                                        true;
                                                    safeSetState(() {});
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 1500,
                                                      ),
                                                    );
                                                    FFAppState()
                                                            .verCarrinhoLogado =
                                                        true;
                                                    safeSetState(() {});
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 3000,
                                                      ),
                                                    );
                                                    FFAppState()
                                                            .adicionarCarrinho =
                                                        false;
                                                    FFAppState()
                                                            .verCarrinhoLogado =
                                                        false;
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Adicionar ao carrinho',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'containerOnActionTriggerAnimation14']!,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (isWeb == true)
                        Container(
                          width: double.infinity,
                          height: 21.0,
                          decoration: BoxDecoration(),
                        ),
                      if ((FFAppState().bennerBaixarAPP == false) && isWeb)
                        Container(
                          width: 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(),
                        ),
                      if (isWeb == false)
                        Container(
                          width: double.infinity,
                          height: 49.0,
                          decoration: BoxDecoration(),
                        ),
                      if (currentUserReference != null)
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(CarrinhoWidget.routeName);
                              },
                              child: Container(
                                width: 31.0,
                                height: 31.0,
                                decoration: BoxDecoration(
                                  color: Color(0x8F000000),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 6.0, 4.0, 0.0),
                                    child: badges.Badge(
                                      badgeContent: Text(
                                        valueOrDefault<String>(
                                          currentUserReference != null
                                              ? functions.somarQuantidadesTotal(
                                                  paginaProdutoCarrinhoRecordList
                                                      .toList())
                                              : FFAppState()
                                                  .quantidadeCarrinho
                                                  .toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 8.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      showBadge: functions.somarQuantidadesTotal(
                                              paginaProdutoCarrinhoRecordList
                                                  .toList()) !=
                                          '0',
                                      shape: badges.BadgeShape.circle,
                                      badgeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      elevation: 7.0,
                                      padding: EdgeInsets.all(6.0),
                                      position: badges.BadgePosition.topEnd(),
                                      animationType:
                                          badges.BadgeAnimationType.scale,
                                      toAnimate: true,
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: FlutterFlowTheme.of(context)
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
                      if (currentUserReference == null)
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                    CarrinhoNaoLogadoVendaWidget.routeName);
                              },
                              child: Container(
                                width: 31.0,
                                height: 31.0,
                                decoration: BoxDecoration(
                                  color: Color(0x8F000000),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 8.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                      shape: badges.BadgeShape.circle,
                                      badgeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      elevation: 7.0,
                                      padding: EdgeInsets.all(6.0),
                                      position: badges.BadgePosition.topEnd(),
                                      animationType:
                                          badges.BadgeAnimationType.scale,
                                      toAnimate: true,
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: FlutterFlowTheme.of(context)
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
                if ((FFAppState().verCarrinhoLogado == true) &&
                    (loggedIn == false))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 225.6,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.9,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height: 225.6,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 225.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 9.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 21.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Adicionado ao carrinho',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 15.0,
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
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 7.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 5.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 2.0, 0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .hourglassEnd,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 13.0,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Apressa-se, alguns itens do \ncarrinho estão ',
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
                                                                      .secondaryBackground,
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
                                                          TextSpan(
                                                            text:
                                                                'quase esgotado!',
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
                                                          )
                                                        ],
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 7.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 5.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Elegivel para Frete Grátis',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 73.6,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final lisjaCarrinho = functions
                                                      .juntarListaCarrinhoAfiliado(
                                                          FFAppState()
                                                              .CarrinhoTemporarioNacional
                                                              .toList(),
                                                          FFAppState()
                                                              .CarrinhoTemporarioInternacional
                                                              .toList())
                                                      .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        lisjaCarrinho.length,
                                                    itemBuilder: (context,
                                                        lisjaCarrinhoIndex) {
                                                      final lisjaCarrinhoItem =
                                                          lisjaCarrinho[
                                                              lisjaCarrinhoIndex];
                                                      return Visibility(
                                                        visible:
                                                            lisjaCarrinhoIndex <=
                                                                2,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 65.0,
                                                              height: 65.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .network(
                                                                    functions
                                                                        .carrinhoTemporarioImg(
                                                                            lisjaCarrinhoItem),
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  if (functions.carrinhoAfiliadoIndex(
                                                                          lisjaCarrinhoItem,
                                                                          functions
                                                                              .juntarListaCarrinhoAfiliado(FFAppState().CarrinhoTemporarioNacional.toList(), FFAppState().CarrinhoTemporarioInternacional.toList())
                                                                              .toList()) ==
                                                                      true)
                                                                    Opacity(
                                                                      opacity:
                                                                          0.8,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              0.0,
                                                                              7.0,
                                                                              4.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                22.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                width: 0.4,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (functions.carrinhoAfiliadoIndex(
                                                                          lisjaCarrinhoItem,
                                                                          functions
                                                                              .juntarListaCarrinhoAfiliado(FFAppState().CarrinhoTemporarioNacional.toList(), FFAppState().CarrinhoTemporarioInternacional.toList())
                                                                              .toList()) ==
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.5),
                                                                        child:
                                                                            Text(
                                                                          'Quase\nesgotado',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                    ),
                                                                  if (functions.carrinhoAfiliadoIndex(
                                                                          lisjaCarrinhoItem,
                                                                          functions
                                                                              .juntarListaCarrinhoAfiliado(FFAppState().CarrinhoTemporarioNacional.toList(), FFAppState().CarrinhoTemporarioInternacional.toList())
                                                                              .toList()) ==
                                                                      false)
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (functions.carrinhoAfiliadoIndex(
                                                                          lisjaCarrinhoItem,
                                                                          functions
                                                                              .juntarListaCarrinhoAfiliado(FFAppState().CarrinhoTemporarioNacional.toList(), FFAppState().CarrinhoTemporarioInternacional.toList())
                                                                              .toList()) ==
                                                                      false)
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '+${functions.calcularTotalProdutosMenosTres(FFAppState().CarrinhoTemporarioNacional.toList(), FFAppState().CarrinhoTemporarioInternacional.toList()).toString()}',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
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
                                              width: 104.8,
                                              height: 29.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 0.7,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Ir para o carrinho',
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 10.0,
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
                if ((FFAppState().verCarrinhoLogado == true) &&
                    (loggedIn == true))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 225.6,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.9,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height: 225.6,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 225.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 9.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 21.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Adicionado ao carrinho',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 15.0,
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
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 7.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 5.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 2.0, 0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .hourglassEnd,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 13.0,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Apressa-se, alguns itens do \ncarrinho estão ',
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
                                                                      .secondaryBackground,
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
                                                          TextSpan(
                                                            text:
                                                                'quase esgotado!',
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
                                                          )
                                                        ],
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 7.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 5.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Elegivel para Frete Grátis',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: StreamBuilder<
                                              List<CarrinhoRecord>>(
                                            stream: queryCarrinhoRecord(
                                              parent: currentUserReference,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 26.0,
                                                    height: 26.0,
                                                    child: SpinKitCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 26.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CarrinhoRecord>
                                                  containerCarrinhoRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                width: double.infinity,
                                                height: 73.6,
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<CarrinhoRecord>>(
                                                    stream: queryCarrinhoRecord(
                                                      parent:
                                                          currentUserReference,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 26.0,
                                                            height: 26.0,
                                                            child:
                                                                SpinKitCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 26.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CarrinhoRecord>
                                                          listViewCarrinhoRecordList =
                                                          snapshot.data!;

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            listViewCarrinhoRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewCarrinhoRecord =
                                                              listViewCarrinhoRecordList[
                                                                  listViewIndex];
                                                          return Visibility(
                                                            visible: functions.indexAddCardLogado(
                                                                containerCarrinhoRecordList
                                                                    .toList(),
                                                                listViewCarrinhoRecord
                                                                    .reference),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 65.0,
                                                                  height: 65.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .network(
                                                                        listViewCarrinhoRecord
                                                                            .fotoCapa,
                                                                      ).image,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      if (functions.indexAddCardLogado2(
                                                                          containerCarrinhoRecordList
                                                                              .toList(),
                                                                          listViewCarrinhoRecord
                                                                              .reference))
                                                                        Opacity(
                                                                          opacity:
                                                                              0.8,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 4.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 22.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 0.4,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions.indexAddCardLogado2(
                                                                          containerCarrinhoRecordList
                                                                              .toList(),
                                                                          listViewCarrinhoRecord
                                                                              .reference))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.5),
                                                                            child:
                                                                                Text(
                                                                              'Quase\nesgotado',
                                                                              textAlign: TextAlign.center,
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
                                                                        ),
                                                                      if (functions.indexAddCardLogado3(
                                                                          containerCarrinhoRecordList
                                                                              .toList(),
                                                                          listViewCarrinhoRecord
                                                                              .reference))
                                                                        Opacity(
                                                                          opacity:
                                                                              0.5,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions.indexAddCardLogado3(
                                                                          containerCarrinhoRecordList
                                                                              .toList(),
                                                                          listViewCarrinhoRecord
                                                                              .reference))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '+${functions.indexAddCardLogado4(containerCarrinhoRecordList.toList()).toString()}',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                  CarrinhoWidget.routeName);
                                            },
                                            child: Container(
                                              width: 104.8,
                                              height: 29.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 0.7,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Ir para o carrinho',
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 10.0,
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
          ),
        );
      },
    );
  }
}
