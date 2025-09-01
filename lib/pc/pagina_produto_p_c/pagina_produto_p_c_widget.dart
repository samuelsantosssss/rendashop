import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/carregando/carregando1/carregando1_widget.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/addto_card/addto_card_widget.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import '/pc/login_p_c_principal/login_p_c_principal_widget.dart';
import '/pc/rodape/rodape_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'pagina_produto_p_c_model.dart';
export 'pagina_produto_p_c_model.dart';

class PaginaProdutoPCWidget extends StatefulWidget {
  const PaginaProdutoPCWidget({
    super.key,
    required this.produtoRef,
  });

  final DocumentReference? produtoRef;

  static String routeName = 'PaginaProdutoPC';
  static String routePath = '/paginaProdutoPC';

  @override
  State<PaginaProdutoPCWidget> createState() => _PaginaProdutoPCWidgetState();
}

class _PaginaProdutoPCWidgetState extends State<PaginaProdutoPCWidget>
    with TickerProviderStateMixin {
  late PaginaProdutoPCModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaProdutoPCModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selecionarVariante1 = '';
      FFAppState().selecionarVariante2 = '';
      FFAppState().selecionarVariante1foto = '';
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.cepTextController ??= TextEditingController();
    _model.cepFocusNode ??= FocusNode();

    _model.cepMask = MaskTextInputFormatter(mask: '#####-###');
    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 7,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 7,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 7,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 7,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 7,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 7,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
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
        List<CarrinhoRecord> paginaProdutoPCCarrinhoRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF5F5F5),
            body: Stack(
              children: [
                StreamBuilder<ProdutoRecord>(
                  stream: ProdutoRecord.getDocument(widget.produtoRef!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 26.0,
                          height: 26.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 26.0,
                          ),
                        ),
                      );
                    }

                    final columnProdutoRecord = snapshot.data!;

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Container(
                              width: double.infinity,
                              height: 119.9,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Container(
                                      width: 1300.0,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 360.0,
                                              height: 16.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Venda na Renda Shop',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x88FFFFFF),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Baixe o App',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x88FFFFFF),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Siga-nos',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 20.0,
                                                  ),
                                                  Icon(
                                                    Icons.tiktok,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 20.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (loggedIn == false)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              LoginPCPrincipalWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: 130.0,
                                                  height: 16.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Cadastre',
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
                                                      Container(
                                                        width: 1.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x88FFFFFF),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Entre',
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (loggedIn == true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().statusNaopago =
                                                      true;
                                                  FFAppState()
                                                      .statusPreparando = false;
                                                  FFAppState().statusEnviado =
                                                      false;
                                                  FFAppState().statusReembolso =
                                                      false;
                                                  FFAppState()
                                                      .statusFinalizado = false;
                                                  FFAppState().statusCancelado =
                                                      false;
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                      PerfilPCWidget.routeName);
                                                },
                                                child: Container(
                                                  height: 27.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Container(
                                                          width: 27.0,
                                                          height: 27.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              currentUserPhoto,
                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(11).png?alt=media&token=e5c7f1ab-12eb-4a45-9c2b-a2830445c928',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Text(
                                                            currentUserDisplayName,
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
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 287.8,
                                          height: 75.09,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Image.network(
                                                'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/logo%20PC.jpg?alt=media&token=e8ba2377-16d0-4711-b1fb-dbbe7af71b83',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            width: 904.6,
                                            height: 37.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Row(
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
                                                    width: 685.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController1,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            FFAppState().palavraChavePesquisa = functions
                                                                .listaBuscaHistorico(
                                                                    _model
                                                                        .textController1
                                                                        .text,
                                                                    (currentUserDocument?.historicoPesquisa.toList() ??
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
                                                            FFAppState()
                                                                    .feedDocumentoAntes =
                                                                '4';
                                                            FFAppState()
                                                                .liberarMais = 30;
                                                            safeSetState(() {});

                                                            context.pushNamed(
                                                                PcCategoriaWidget
                                                                    .routeName);

                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'historicoPesquisa':
                                                                      FFAppState()
                                                                          .palavraChavePesquisa,
                                                                },
                                                              ),
                                                            });
                                                          },
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                            hintText:
                                                                'Buscar na Renda Shop',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textController1Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: Container(
                                                    width: 63.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                _model
                                                                    .textController1
                                                                    .text,
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
                                                        FFAppState()
                                                                .feedDocumentoAntes =
                                                            '4';
                                                        FFAppState()
                                                            .liberarMais = 30;
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PcCategoriaWidget
                                                                .routeName);

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'historicoPesquisa':
                                                                  FFAppState()
                                                                      .palavraChavePesquisa,
                                                            },
                                                          ),
                                                        });
                                                      },
                                                      onForcePressEnd:
                                                          (details) async {
                                                        FFAppState().palavraChavePesquisa = functions
                                                            .listaBuscaHistorico(
                                                                _model
                                                                    .textController1
                                                                    .text,
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
                                                        FFAppState()
                                                                .feedDocumentoAntes =
                                                            '4';
                                                        FFAppState()
                                                            .liberarMais = 30;
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            PcCategoriaWidget
                                                                .routeName);

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'historicoPesquisa':
                                                                  FFAppState()
                                                                      .palavraChavePesquisa,
                                                            },
                                                          ),
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.search_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (currentUserReference == null)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 10.0),
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
                                                            CarrinhoPCNaoLogadoWidget
                                                                .routeName);
                                                      },
                                                      child: Container(
                                                        width: 31.0,
                                                        height: 31.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
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
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
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
                                                              showBadge: ((FFAppState()
                                                                          .CarrinhoTemporarioNacional
                                                                          .isNotEmpty) ==
                                                                      true) ||
                                                                  ((FFAppState()
                                                                          .CarrinhoTemporarioInternacional
                                                                          .isNotEmpty) ==
                                                                      true),
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              elevation: 11.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6.0),
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
                                                                        1.0,
                                                                        -1.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .shopping_cart_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (currentUserReference != null)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 10.0),
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
                                                            CarrinhoPCWidget
                                                                .routeName);
                                                      },
                                                      child: Container(
                                                        width: 31.0,
                                                        height: 31.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x8F000000),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  currentUserReference !=
                                                                          null
                                                                      ? functions.somarQuantidadesTotal(
                                                                          paginaProdutoPCCarrinhoRecordList
                                                                              .toList())
                                                                      : FFAppState()
                                                                          .quantidadeCarrinho
                                                                          .toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .interTight(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.0,
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
                                                                          paginaProdutoPCCarrinhoRecordList
                                                                              .toList()) !=
                                                                  '0',
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              elevation: 11.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6.0),
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
                                                                        1.0,
                                                                        -1.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .shopping_cart_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 30.0,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 1300.0,
                            height: 65.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().palavraChavePesquisa =
                                                functions
                                                    .listaBuscaHistorico(
                                                        columnProdutoRecord
                                                            .lider1,
                                                        (currentUserDocument
                                                                    ?.historicoPesquisa
                                                                    .toList() ??
                                                                [])
                                                            .toList())
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            FFAppState().filtroRelevencia =
                                                true;
                                            FFAppState().FiltroDestaque = false;
                                            FFAppState().filtroRecente = false;
                                            FFAppState().filtroPreco = '';
                                            FFAppState().feedDocumentoAntes =
                                                '4';
                                            FFAppState().liberarMais = 30;
                                            safeSetState(() {});

                                            context.pushNamed(
                                                PcCategoriaWidget.routeName);

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'historicoPesquisa':
                                                      FFAppState()
                                                          .palavraChavePesquisa,
                                                },
                                              ),
                                            });
                                          },
                                          child: Text(
                                            columnProdutoRecord.lider1,
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
                                                  color: valueOrDefault<Color>(
                                                    columnProdutoRecord
                                                                    .lider2 !=
                                                                ''
                                                        ? Color(0xFF1961AA)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    Color(0xFF1961AA),
                                                  ),
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
                                        if (columnProdutoRecord.lider2 != '')
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().palavraChavePesquisa =
                                                functions
                                                    .listaBuscaHistorico(
                                                        columnProdutoRecord
                                                            .lider2,
                                                        (currentUserDocument
                                                                    ?.historicoPesquisa
                                                                    .toList() ??
                                                                [])
                                                            .toList())
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            FFAppState().filtroRelevencia =
                                                true;
                                            FFAppState().FiltroDestaque = false;
                                            FFAppState().filtroRecente = false;
                                            FFAppState().filtroPreco = '';
                                            FFAppState().feedDocumentoAntes =
                                                '4';
                                            FFAppState().liberarMais = 30;
                                            safeSetState(() {});

                                            context.pushNamed(
                                                PcCategoriaWidget.routeName);

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'historicoPesquisa':
                                                      FFAppState()
                                                          .palavraChavePesquisa,
                                                },
                                              ),
                                            });
                                          },
                                          child: Text(
                                            columnProdutoRecord.lider2,
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
                                                  color: valueOrDefault<Color>(
                                                    columnProdutoRecord
                                                                    .lider3 !=
                                                                ''
                                                        ? Color(0xFF1961AA)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    Color(0xFF1961AA),
                                                  ),
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
                                        if (columnProdutoRecord.lider3 != '')
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().palavraChavePesquisa =
                                                functions
                                                    .listaBuscaHistorico(
                                                        columnProdutoRecord
                                                            .lider3,
                                                        (currentUserDocument
                                                                    ?.historicoPesquisa
                                                                    .toList() ??
                                                                [])
                                                            .toList())
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            FFAppState().filtroRelevencia =
                                                true;
                                            FFAppState().FiltroDestaque = false;
                                            FFAppState().filtroRecente = false;
                                            FFAppState().filtroPreco = '';
                                            FFAppState().feedDocumentoAntes =
                                                '4';
                                            FFAppState().liberarMais = 30;
                                            safeSetState(() {});

                                            context.pushNamed(
                                                PcCategoriaWidget.routeName);

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'historicoPesquisa':
                                                      FFAppState()
                                                          .palavraChavePesquisa,
                                                },
                                              ),
                                            });
                                          },
                                          child: Text(
                                            columnProdutoRecord.lider3,
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
                                                  color: valueOrDefault<Color>(
                                                    columnProdutoRecord
                                                                    .lider4 !=
                                                                ''
                                                        ? Color(0xFF1961AA)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    Color(0xFF1961AA),
                                                  ),
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
                                        if (columnProdutoRecord.lider4 != '')
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().palavraChavePesquisa =
                                                functions
                                                    .listaBuscaHistorico(
                                                        columnProdutoRecord
                                                            .lider4,
                                                        (currentUserDocument
                                                                    ?.historicoPesquisa
                                                                    .toList() ??
                                                                [])
                                                            .toList())
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            FFAppState().filtroRelevencia =
                                                true;
                                            FFAppState().FiltroDestaque = false;
                                            FFAppState().filtroRecente = false;
                                            FFAppState().filtroPreco = '';
                                            FFAppState().feedDocumentoAntes =
                                                '4';
                                            FFAppState().liberarMais = 30;
                                            safeSetState(() {});

                                            context.pushNamed(
                                                PcCategoriaWidget.routeName);

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'historicoPesquisa':
                                                      FFAppState()
                                                          .palavraChavePesquisa,
                                                },
                                              ),
                                            });
                                          },
                                          child: Text(
                                            columnProdutoRecord.lider4,
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
                                                      .primaryText,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().abrirFrete = false;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: 1300.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 464.9,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 30.0),
                                          child: Container(
                                            width: 455.6,
                                            height: 599.8,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 429.1,
                                                    height: 492.85,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            final imgListtt =
                                                                columnProdutoRecord
                                                                    .imagens
                                                                    .toList();

                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 500.0,
                                                              child: PageView
                                                                  .builder(
                                                                controller: _model
                                                                        .pageViewController ??=
                                                                    PageController(
                                                                        initialPage: max(
                                                                            0,
                                                                            min(0,
                                                                                imgListtt.length - 1))),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    imgListtt
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        imgListttIndex) {
                                                                  final imgListttItem =
                                                                      imgListtt[
                                                                          imgListttIndex];
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            child:
                                                                                FlutterFlowExpandedImageView(
                                                                              image: Image.network(
                                                                                imgListttItem,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                              allowRotation: false,
                                                                              tag: imgListttItem,
                                                                              useHeroAnimation: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag:
                                                                            imgListttItem,
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            imgListttItem,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await _model
                                                                        .pageViewController
                                                                        ?.previousPage(
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xA4FFFFFF),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .chevron_left_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await _model
                                                                        .pageViewController
                                                                        ?.nextPage(
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xA4FFFFFF),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .navigate_next_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 93.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final imgList =
                                                            columnProdutoRecord
                                                                .imagens
                                                                .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              imgList.length,
                                                          itemBuilder: (context,
                                                              imgListIndex) {
                                                            final imgListItem =
                                                                imgList[
                                                                    imgListIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await _model
                                                                        .pageViewController
                                                                        ?.animateToPage(
                                                                      functions.imageProduto(
                                                                          imgListItem,
                                                                          columnProdutoRecord
                                                                              .imagens
                                                                              .toList()),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .network(
                                                                      imgListItem,
                                                                      width:
                                                                          83.0,
                                                                      height:
                                                                          84.0,
                                                                      fit: BoxFit
                                                                          .contain,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 40.0, 0.0),
                                    child: Container(
                                      width: 739.3,
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                columnProdutoRecord.nome
                                                    .maybeHandleOverflow(
                                                  maxChars: 190,
                                                  replacement: '…',
                                                ),
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
                                                          fontSize: 20.0,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Nenhuma Avaliação Ainda',
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
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        15.0,
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
                                                        ),
                                                      ),
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 41.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              9.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '4.6',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  decoration: TextDecoration.underline,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: Color(0xFFFFCC10),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: Color(0xFFFFCC10),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: Color(0xFFFFCC10),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: Color(0xFFFFCC10),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: Color(0x4B5E5E58),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 1.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x6A75787A),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    '10',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child: Text(
                                                                  'Avaliações',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (columnProdutoRecord
                                                      .promoRelampagoAgendado ==
                                                  true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.network(
                                                          '',
                                                        ).image,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'OFERTAS',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            122.0,
                                                                            1.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .flash_on,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            104.0,
                                                                            1.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'RE    LÂMPAGO',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
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
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'TERMINA EM',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          69.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 70.0,
                                                                              height: 22.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.timePromoModel,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: TimePromoWidget(),
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              Container(
                                                width: double.infinity,
                                                height: 75.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    columnProdutoRecord
                                                                .promoRelampagoAgendado ==
                                                            true
                                                        ? Color(0x134AA756)
                                                        : Color(0xFFF5F5F5),
                                                    Color(0xFFF5F5F5),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    bottomRight:
                                                        Radius.circular(8.0),
                                                    topLeft: Radius.circular(
                                                        valueOrDefault<double>(
                                                      columnProdutoRecord
                                                                  .promoRelampagoAgendado ==
                                                              true
                                                          ? 0.0
                                                          : 8.0,
                                                      8.0,
                                                    )),
                                                    topRight: Radius.circular(
                                                        valueOrDefault<double>(
                                                      columnProdutoRecord
                                                                  .promoRelampagoAgendado ==
                                                              true
                                                          ? 0.0
                                                          : 8.0,
                                                      8.0,
                                                    )),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (columnProdutoRecord
                                                                .titulo1 ==
                                                            '')
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      'R\$',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                25.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      functions.valorRealString(
                                                                          columnProdutoRecord
                                                                              .preco),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      functions.valorCentavosEmString(
                                                                          columnProdutoRecord
                                                                              .preco),
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
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      'R\$${functions.valorDoubleEmString(columnProdutoRecord.precoAntes)}',
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
                                                                                Color(0xFF8F9090),
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            decoration:
                                                                                TextDecoration.lineThrough,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          17.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              0.7,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            functions.porcentagemPromo(columnProdutoRecord.precoAntes,
                                                                                columnProdutoRecord.preco),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                    if (() {
                                                      if (((columnProdutoRecord.varianteImgList.isNotEmpty) == true) &&
                                                          (columnProdutoRecord.titulo1 !=
                                                                  '') &&
                                                          ((columnProdutoRecord
                                                                  .varianteTitulo1List
                                                                  .isNotEmpty) ==
                                                              true) &&
                                                          ((columnProdutoRecord
                                                                  .varianteTitulo2List
                                                                  .isNotEmpty) ==
                                                              false) &&
                                                          (FFAppState().selecionarVariante1foto ==
                                                                  '')) {
                                                        return true;
                                                      } else if (((columnProdutoRecord
                                                                  .varianteImgList
                                                                  .isNotEmpty) ==
                                                              false) &&
                                                          (columnProdutoRecord.titulo1 !=
                                                                  '') &&
                                                          ((columnProdutoRecord
                                                                  .varianteTitulo1List
                                                                  .isNotEmpty) ==
                                                              true) &&
                                                          ((columnProdutoRecord
                                                                  .varianteTitulo2List
                                                                  .isNotEmpty) ==
                                                              true) &&
                                                          ((FFAppState().selecionarVariante1 == '') ||
                                                              (FFAppState().selecionarVariante2 ==
                                                                      ''))) {
                                                        return true;
                                                      } else if (((columnProdutoRecord
                                                                  .varianteImgList
                                                                  .isNotEmpty) ==
                                                              false) &&
                                                          (columnProdutoRecord.titulo1 != '') &&
                                                          ((columnProdutoRecord.varianteTitulo1List.isNotEmpty) == true) &&
                                                          ((columnProdutoRecord.varianteTitulo2List.isNotEmpty) == false) &&
                                                          (FFAppState().selecionarVariante1 == '')) {
                                                        return true;
                                                      } else if (((columnProdutoRecord.varianteImgList.isNotEmpty) == true) && ((columnProdutoRecord.varianteTitulo2List.isNotEmpty) == true) && ((FFAppState().selecionarVariante1foto == '') || (FFAppState().selecionarVariante2 == ''))) {
                                                        return true;
                                                      } else {
                                                        return false;
                                                      }
                                                    }())
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      'Apartir de  ',
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
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      'R\$',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                25.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      functions.valorRealString(
                                                                          columnProdutoRecord
                                                                              .menorPrecoRevenda),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      functions.valorCentavosEmString(
                                                                          columnProdutoRecord
                                                                              .menorPrecoRevenda),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      'R\$${functions.valorDoubleEmString(columnProdutoRecord.precoAntes)}',
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
                                                                                Color(0xFF8F9090),
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            decoration:
                                                                                TextDecoration.lineThrough,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          17.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              0.7,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            functions.porcentagemPromo(columnProdutoRecord.precoAntes,
                                                                                columnProdutoRecord.menorPrecoRevenda),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                    if ((columnProdutoRecord.titulo1 != '') &&
                                                        (columnProdutoRecord
                                                                    .titulo2 ==
                                                                '') &&
                                                        ((columnProdutoRecord
                                                                .varianteImgList
                                                                .isNotEmpty) ==
                                                            true) &&
                                                        (FFAppState()
                                                                    .selecionarVariante1foto !=
                                                                ''))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  VarianteRecord>>(
                                                            stream:
                                                                queryVarianteRecord(
                                                              parent: widget
                                                                  .produtoRef,
                                                              queryBuilder:
                                                                  (varianteRecord) =>
                                                                      varianteRecord
                                                                          .where(
                                                                'foto',
                                                                isEqualTo: FFAppState().selecionarVariante1foto !=
                                                                            ''
                                                                    ? FFAppState()
                                                                        .selecionarVariante1foto
                                                                    : columnProdutoRecord
                                                                        .imagens
                                                                        .firstOrNull,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 1.0,
                                                                    height: 1.0,
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
                                                                  comVarianteOpc1fotoVarianteRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final comVarianteOpc1fotoVarianteRecord =
                                                                  comVarianteOpc1fotoVarianteRecordList
                                                                          .isNotEmpty
                                                                      ? comVarianteOpc1fotoVarianteRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Text(
                                                                        'R\$',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 25.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .valorRealString(comVarianteOpc1fotoVarianteRecord!.preco),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 32.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .valorCentavosEmString(comVarianteOpc1fotoVarianteRecord.preco),
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
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          'R\$${functions.valorDoubleEmString(columnProdutoRecord.precoAntes)}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF8F9090),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                decoration: TextDecoration.lineThrough,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              17.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: Text(
                                                                                functions.porcentagemPromo(columnProdutoRecord.precoAntes, comVarianteOpc1fotoVarianteRecord.preco),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    if ((columnProdutoRecord.titulo1 != '') &&
                                                        (columnProdutoRecord
                                                                    .titulo2 ==
                                                                '') &&
                                                        (FFAppState()
                                                                    .selecionarVariante1 !=
                                                                ''))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  VarianteRecord>>(
                                                            stream:
                                                                queryVarianteRecord(
                                                              parent: widget
                                                                  .produtoRef,
                                                              queryBuilder:
                                                                  (varianteRecord) =>
                                                                      varianteRecord
                                                                          .where(
                                                                'opcao_titulo1',
                                                                isEqualTo: FFAppState().selecionarVariante1 !=
                                                                            ''
                                                                    ? FFAppState()
                                                                        .selecionarVariante1
                                                                    : columnProdutoRecord
                                                                        .varianteTitulo1List
                                                                        .firstOrNull,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 1.0,
                                                                    height: 1.0,
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
                                                                  comVarianteOpc1VarianteRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final comVarianteOpc1VarianteRecord =
                                                                  comVarianteOpc1VarianteRecordList
                                                                          .isNotEmpty
                                                                      ? comVarianteOpc1VarianteRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
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
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          'R\$',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 25.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .valorRealString(comVarianteOpc1VarianteRecord!.preco),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 32.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .valorCentavosEmString(comVarianteOpc1VarianteRecord.preco),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          'R\$${functions.valorDoubleEmString(columnProdutoRecord.precoAntes)}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF8F9090),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                decoration: TextDecoration.lineThrough,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              17.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: Text(
                                                                                functions.porcentagemPromo(columnProdutoRecord.precoAntes, comVarianteOpc1VarianteRecord.preco),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    if (((columnProdutoRecord
                                                                .varianteImgList
                                                                .isNotEmpty) ==
                                                            false) &&
                                                        (FFAppState()
                                                                    .selecionarVariante1 !=
                                                                '') &&
                                                        (FFAppState()
                                                                    .selecionarVariante2 !=
                                                                ''))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  VarianteRecord>>(
                                                            stream:
                                                                queryVarianteRecord(
                                                              parent: widget
                                                                  .produtoRef,
                                                              queryBuilder:
                                                                  (varianteRecord) =>
                                                                      varianteRecord
                                                                          .where(
                                                                            'opcao_titulo1',
                                                                            isEqualTo: FFAppState().selecionarVariante1 != ''
                                                                                ? FFAppState().selecionarVariante1
                                                                                : columnProdutoRecord.varianteTitulo1List.firstOrNull,
                                                                          )
                                                                          .where(
                                                                            'opcao_titulo2',
                                                                            isEqualTo: FFAppState().selecionarVariante2 != ''
                                                                                ? FFAppState().selecionarVariante2
                                                                                : '',
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 1.0,
                                                                    height: 1.0,
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
                                                                  comVarianteOpc2VarianteRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final comVarianteOpc2VarianteRecord =
                                                                  comVarianteOpc2VarianteRecordList
                                                                          .isNotEmpty
                                                                      ? comVarianteOpc2VarianteRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Text(
                                                                        'R\$',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 25.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .valorRealString(comVarianteOpc2VarianteRecord!.preco),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 32.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .valorCentavosEmString(comVarianteOpc2VarianteRecord.preco),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          'R\$${functions.valorDoubleEmString(columnProdutoRecord.precoAntes)}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF8F9090),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                decoration: TextDecoration.lineThrough,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              17.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: Text(
                                                                                functions.porcentagemPromo(columnProdutoRecord.precoAntes, comVarianteOpc2VarianteRecord.preco),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    if ((columnProdutoRecord
                                                                    .titulo1 !=
                                                                '') &&
                                                        ((columnProdutoRecord
                                                                .varianteImgList
                                                                .isNotEmpty) ==
                                                            true))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  VarianteRecord>>(
                                                            stream:
                                                                queryVarianteRecord(
                                                              parent:
                                                                  columnProdutoRecord
                                                                      .reference,
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
                                                                                FFAppState().selecionarVariante1foto,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 1.0,
                                                                    height: 1.0,
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
                                                                  comVarianteFoto2VarianteRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final comVarianteFoto2VarianteRecord =
                                                                  comVarianteFoto2VarianteRecordList
                                                                          .isNotEmpty
                                                                      ? comVarianteFoto2VarianteRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
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
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          'R\$',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 25.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .valorRealString(comVarianteFoto2VarianteRecord!.preco),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 32.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .valorCentavosEmString(comVarianteFoto2VarianteRecord.preco),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          'R\$${functions.valorDoubleEmString(columnProdutoRecord.precoAntes)}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF8F9090),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                decoration: TextDecoration.lineThrough,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              17.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.7,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: Text(
                                                                                functions.porcentagemPromo(columnProdutoRecord.precoAntes, comVarianteFoto2VarianteRecord.preco),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 20.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 68.8,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      70.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Frete',
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
                                                                      15.0,
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
                                                      Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
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
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          24.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  FaIcon(
                                                                    FontAwesomeIcons
                                                                        .shippingFast,
                                                                    color: Color(
                                                                        0xFF2EA597),
                                                                    size: 14.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Frete Para',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            23.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Frete',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
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
                                                                          40.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
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
                                                                onTap:
                                                                    () async {
                                                                  if (FFAppState()
                                                                      .abrirFrete) {
                                                                    FFAppState()
                                                                            .abrirFrete =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    FFAppState()
                                                                            .abrirFrete =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') ==
                                                                                '') &&
                                                                        (FFAppState().enderecoTemporario ==
                                                                                ''))
                                                                      AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          'São Paulo, BR',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') !=
                                                                                '') &&
                                                                        (FFAppState().enderecoTemporario ==
                                                                                ''))
                                                                      AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          functions.freteSimulado(valueOrDefault(
                                                                              currentUserDocument?.enderecoCompleto,
                                                                              '')),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    if (FFAppState().enderecoTemporario !=
                                                                            '')
                                                                      Text(
                                                                        FFAppState()
                                                                            .enderecoTemporario,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    if (FFAppState()
                                                                            .abrirFrete ==
                                                                        false)
                                                                      Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    if (FFAppState()
                                                                        .abrirFrete)
                                                                      Icon(
                                                                        Icons
                                                                            .keyboard_arrow_up_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            MouseRegion(
                                                              opaque: false,
                                                              cursor: MouseCursor
                                                                      .defer ??
                                                                  MouseCursor
                                                                      .defer,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Text(
                                                                        functions.frete(
                                                                            () {
                                                                          if (FFAppState().enderecoTemporario !=
                                                                                  '') {
                                                                            return FFAppState().enderecoTemporario;
                                                                          } else if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') != '') &&
                                                                              (FFAppState().enderecoTemporario == '')) {
                                                                            return valueOrDefault(currentUserDocument?.enderecoCompleto,
                                                                                '');
                                                                          } else {
                                                                            return valueOrDefault(currentUserDocument?.enderecoCompleto,
                                                                                '');
                                                                          }
                                                                        }(),
                                                                            columnProdutoRecord.listFrete.toList(),
                                                                            columnProdutoRecord.freteSP),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              decoration: TextDecoration.lineThrough,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          functions.freteMaisDe20(functions.frete(
                                                                              () {
                                                                            if (FFAppState().enderecoTemporario != '') {
                                                                              return FFAppState().enderecoTemporario;
                                                                            } else if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') != '') && (FFAppState().enderecoTemporario == '')) {
                                                                              return valueOrDefault(currentUserDocument?.enderecoCompleto, '');
                                                                            } else {
                                                                              return valueOrDefault(currentUserDocument?.enderecoCompleto, '');
                                                                            }
                                                                          }(),
                                                                              columnProdutoRecord.listFrete.toList(),
                                                                              columnProdutoRecord.freteSP)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              onEnter:
                                                                  ((event) async {
                                                                safeSetState(() =>
                                                                    _model.mouseRegionHovered =
                                                                        true);
                                                              }),
                                                              onExit:
                                                                  ((event) async {
                                                                safeSetState(() =>
                                                                    _model.mouseRegionHovered =
                                                                        false);
                                                              }),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState()
                                                            .PCSemVarianteSetado
                                                        ? Color(0xFFF5F5F5)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  30.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (((columnProdutoRecord
                                                                        .varianteImgList
                                                                        .isNotEmpty) ==
                                                                    true) &&
                                                                (columnProdutoRecord
                                                                            .titulo2 !=
                                                                        ''))
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          VarianteRecord>>(
                                                                    stream:
                                                                        queryVarianteRecord(
                                                                      parent: widget
                                                                          .produtoRef,
                                                                      queryBuilder:
                                                                          (varianteRecord) =>
                                                                              varianteRecord.where(
                                                                        'foto',
                                                                        isEqualTo: FFAppState().selecionarVariante1foto != ''
                                                                            ? FFAppState().selecionarVariante1foto
                                                                            : columnProdutoRecord.varianteImgList.firstOrNull,
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              Carregando1Widget(),
                                                                        );
                                                                      }
                                                                      List<VarianteRecord>
                                                                          variantes2opcFotoVarianteRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final variantes2opcFotoVarianteRecord = variantes2opcFotoVarianteRecordList
                                                                              .isNotEmpty
                                                                          ? variantes2opcFotoVarianteRecordList
                                                                              .first
                                                                          : null;

                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (((columnProdutoRecord.varianteImgList.isNotEmpty) != null) && (variantes2opcFotoVarianteRecord?.titulo2 != null && variantes2opcFotoVarianteRecord?.titulo2 != ''))
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${variantes2opcFotoVarianteRecord?.titulo1}:',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 15.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              if (FFAppState().selecionarVariante1foto != '')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    variantes2opcFotoVarianteRecord!.opcaoTitulo1,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xFF303131),
                                                                                                          fontSize: 15.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            final imgList = columnProdutoRecord.varianteImgList.toList();

                                                                                            return SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: List.generate(imgList.length, (imgListIndex) {
                                                                                                  final imgListItem = imgList[imgListIndex];
                                                                                                  return Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 50.0,
                                                                                                        height: 64.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(7.0),
                                                                                                          border: Border.all(
                                                                                                            color: valueOrDefault<Color>(
                                                                                                              FFAppState().selecionarVariante1foto == imgListItem ? FlutterFlowTheme.of(context).primaryText : Color(0x8575787A),
                                                                                                              Color(0x8575787A),
                                                                                                            ),
                                                                                                            width: 1.5,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(1.7),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                FFAppState().selecionarVariante1foto = imgListItem;
                                                                                                                FFAppState().PCSemVarianteSetado = false;
                                                                                                                safeSetState(() {});
                                                                                                                await _model.pageViewController?.animateToPage(
                                                                                                                  functions.imageProduto(imgListItem, columnProdutoRecord.imagens.toList()),
                                                                                                                  duration: Duration(milliseconds: 500),
                                                                                                                  curve: Curves.ease,
                                                                                                                );
                                                                                                              },
                                                                                                              child: ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(4.5),
                                                                                                                child: Image.network(
                                                                                                                  imgListItem,
                                                                                                                  width: double.infinity,
                                                                                                                  height: double.infinity,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ).animateOnActionTrigger(
                                                                                                        animationsMap['containerOnActionTriggerAnimation1']!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${variantes2opcFotoVarianteRecord?.titulo2}:',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 15.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final opcao2List = columnProdutoRecord.varianteTitulo2List.toList();

                                                                                          return SingleChildScrollView(
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: List.generate(opcao2List.length, (opcao2ListIndex) {
                                                                                                final opcao2ListItem = opcao2List[opcao2ListIndex];
                                                                                                return Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        FFAppState().selecionarVariante2 = opcao2ListItem;
                                                                                                        FFAppState().PCSemVarianteSetado = false;
                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                          border: Border.all(
                                                                                                            color: FFAppState().selecionarVariante2 == opcao2ListItem ? FlutterFlowTheme.of(context).primaryText : Color(0x8575787A),
                                                                                                            width: 1.4,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                            child: Text(
                                                                                                              opcao2ListItem,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ).animateOnActionTrigger(
                                                                                                      animationsMap['containerOnActionTriggerAnimation2']!,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((columnProdutoRecord
                                                                            .titulo2 ==
                                                                        '') &&
                                                                ((columnProdutoRecord
                                                                        .varianteImgList
                                                                        .isNotEmpty) ==
                                                                    true))
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          VarianteRecord>>(
                                                                    stream:
                                                                        queryVarianteRecord(
                                                                      parent: widget
                                                                          .produtoRef,
                                                                      queryBuilder:
                                                                          (varianteRecord) =>
                                                                              varianteRecord.where(
                                                                        'foto',
                                                                        isEqualTo: FFAppState().selecionarVariante1foto != ''
                                                                            ? FFAppState().selecionarVariante1foto
                                                                            : columnProdutoRecord.varianteImgList.firstOrNull,
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              Carregando1Widget(),
                                                                        );
                                                                      }
                                                                      List<VarianteRecord>
                                                                          variantes1opcFotoVarianteRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final variantes1opcFotoVarianteRecord = variantes1opcFotoVarianteRecordList
                                                                              .isNotEmpty
                                                                          ? variantes1opcFotoVarianteRecordList
                                                                              .first
                                                                          : null;

                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if ((variantes1opcFotoVarianteRecord?.titulo2 == null || variantes1opcFotoVarianteRecord?.titulo2 == '') && ((columnProdutoRecord.varianteImgList.isNotEmpty) == true))
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${variantes1opcFotoVarianteRecord?.titulo1}:',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Color(0xFF75787A),
                                                                                                      fontSize: 15.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              if (FFAppState().selecionarVariante1foto != '')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    variantes1opcFotoVarianteRecord!.opcaoTitulo1,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xFF303131),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            final imgListttt = columnProdutoRecord.varianteImgList.toList();

                                                                                            return SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: List.generate(imgListttt.length, (imgListtttIndex) {
                                                                                                  final imgListtttItem = imgListttt[imgListtttIndex];
                                                                                                  return Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 50.0,
                                                                                                        height: 64.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(7.0),
                                                                                                          border: Border.all(
                                                                                                            color: valueOrDefault<Color>(
                                                                                                              FFAppState().selecionarVariante1foto == imgListtttItem ? FlutterFlowTheme.of(context).primaryText : Color(0x8575787A),
                                                                                                              Color(0x8575787A),
                                                                                                            ),
                                                                                                            width: 1.5,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(1.7),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                FFAppState().selecionarVariante1foto = imgListtttItem;
                                                                                                                FFAppState().PCSemVarianteSetado = false;
                                                                                                                safeSetState(() {});
                                                                                                                await _model.pageViewController?.animateToPage(
                                                                                                                  functions.imageProduto(imgListtttItem, columnProdutoRecord.imagens.toList()),
                                                                                                                  duration: Duration(milliseconds: 500),
                                                                                                                  curve: Curves.ease,
                                                                                                                );
                                                                                                              },
                                                                                                              child: ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(4.5),
                                                                                                                child: Image.network(
                                                                                                                  imgListtttItem,
                                                                                                                  width: double.infinity,
                                                                                                                  height: double.infinity,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ).animateOnActionTrigger(
                                                                                                        animationsMap['containerOnActionTriggerAnimation3']!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            if (((columnProdutoRecord
                                                                        .varianteImgList
                                                                        .isNotEmpty) ==
                                                                    false) &&
                                                                (columnProdutoRecord
                                                                            .titulo2 !=
                                                                        ''))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        VarianteRecord>>(
                                                                  stream:
                                                                      queryVarianteRecord(
                                                                    parent: widget
                                                                        .produtoRef,
                                                                    queryBuilder:
                                                                        (varianteRecord) =>
                                                                            varianteRecord.where(
                                                                      'opcao_titulo1',
                                                                      isEqualTo: FFAppState().selecionarVariante1 !=
                                                                                  ''
                                                                          ? FFAppState()
                                                                              .selecionarVariante1
                                                                          : columnProdutoRecord
                                                                              .varianteTitulo1List
                                                                              .firstOrNull,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Carregando1Widget(),
                                                                      );
                                                                    }
                                                                    List<VarianteRecord>
                                                                        variantes2opcVarianteRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final variantes2opcVarianteRecord = variantes2opcVarianteRecordList
                                                                            .isNotEmpty
                                                                        ? variantes2opcVarianteRecordList
                                                                            .first
                                                                        : null;

                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '${variantes2opcVarianteRecord?.titulo1}:',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 15.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 25.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final opcao1Listtt = columnProdutoRecord.varianteTitulo1List.toList();

                                                                                            return SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: List.generate(opcao1Listtt.length, (opcao1ListttIndex) {
                                                                                                  final opcao1ListttItem = opcao1Listtt[opcao1ListttIndex];
                                                                                                  return Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          FFAppState().selecionarVariante1 = opcao1ListttItem;
                                                                                                          FFAppState().PCSemVarianteSetado = false;
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                            border: Border.all(
                                                                                                              color: FFAppState().selecionarVariante1 == opcao1ListttItem ? FlutterFlowTheme.of(context).primaryText : Color(0x8575787A),
                                                                                                              width: 1.4,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                              child: Text(
                                                                                                                opcao1ListttItem,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ).animateOnActionTrigger(
                                                                                                        animationsMap['containerOnActionTriggerAnimation4']!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                18.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      '${variantes2opcVarianteRecord?.titulo2}:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final opcao2List = columnProdutoRecord.varianteTitulo2List.toList();

                                                                                        return SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(opcao2List.length, (opcao2ListIndex) {
                                                                                              final opcao2ListItem = opcao2List[opcao2ListIndex];
                                                                                              return Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      FFAppState().selecionarVariante2 = opcao2ListItem;
                                                                                                      FFAppState().PCSemVarianteSetado = false;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                        border: Border.all(
                                                                                                          color: FFAppState().selecionarVariante2 == opcao2ListItem ? FlutterFlowTheme.of(context).primaryText : Color(0x8575787A),
                                                                                                          width: 1.4,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                          child: Text(
                                                                                                            opcao2ListItem,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ).animateOnActionTrigger(
                                                                                                    animationsMap['containerOnActionTriggerAnimation5']!,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            if ((columnProdutoRecord.titulo1 != '') &&
                                                                (columnProdutoRecord
                                                                            .titulo2 ==
                                                                        '') &&
                                                                ((columnProdutoRecord
                                                                        .varianteImgList
                                                                        .isNotEmpty) ==
                                                                    false))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        VarianteRecord>>(
                                                                  stream:
                                                                      queryVarianteRecord(
                                                                    parent: widget
                                                                        .produtoRef,
                                                                    queryBuilder:
                                                                        (varianteRecord) =>
                                                                            varianteRecord.where(
                                                                      'opcao_titulo1',
                                                                      isEqualTo: FFAppState().selecionarVariante1 !=
                                                                                  ''
                                                                          ? FFAppState()
                                                                              .selecionarVariante1
                                                                          : columnProdutoRecord
                                                                              .varianteTitulo1List
                                                                              .firstOrNull,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Carregando1Widget(),
                                                                      );
                                                                    }
                                                                    List<VarianteRecord>
                                                                        variantes1opcVarianteRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final variantes1opcVarianteRecord = variantes1opcVarianteRecordList
                                                                            .isNotEmpty
                                                                        ? variantes1opcVarianteRecordList
                                                                            .first
                                                                        : null;

                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '${variantes1opcVarianteRecord?.titulo1}:',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 15.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 25.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final opcao1Listtt = columnProdutoRecord.varianteTitulo1List.toList();

                                                                                            return SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: List.generate(opcao1Listtt.length, (opcao1ListttIndex) {
                                                                                                  final opcao1ListttItem = opcao1Listtt[opcao1ListttIndex];
                                                                                                  return Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          FFAppState().selecionarVariante1 = opcao1ListttItem;
                                                                                                          FFAppState().PCSemVarianteSetado = false;
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                            border: Border.all(
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().selecionarVariante1 == opcao1ListttItem ? FlutterFlowTheme.of(context).primaryText : Color(0x8575787A),
                                                                                                                Color(0x8575787A),
                                                                                                              ),
                                                                                                              width: 1.4,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                              child: Text(
                                                                                                                opcao1ListttItem,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ).animateOnActionTrigger(
                                                                                                        animationsMap['containerOnActionTriggerAnimation6']!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  30.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            52.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Quantidade',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
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
                                                                          if (FFAppState().quantidadeProduto !=
                                                                              1) {
                                                                            FFAppState().quantidadeProduto =
                                                                                FFAppState().quantidadeProduto + -1;
                                                                            safeSetState(() {});
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              31.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF9F8F8),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(8.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0x5ECBCDCE),
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                  child: Text(
                                                                                    '-',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF787878),
                                                                                          fontSize: 20.0,
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
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          38.0,
                                                                      height:
                                                                          31.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0x5ECBCDCE),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFAppState()
                                                                              .quantidadeProduto
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState()
                                                                            .quantidadeProduto = FFAppState()
                                                                                .quantidadeProduto +
                                                                            1;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            31.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFF9F8F8),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x5ECBCDCE),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                child: Text(
                                                                                  '+',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF787878),
                                                                                        fontSize: 20.0,
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
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            if (FFAppState()
                                                                .PCSemVarianteSetado)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    'Selecione a variação do produto primeiro',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFFFD8686),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
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
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 20.0, 0.0, 30.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (valueOrDefault<
                                                            bool>(
                                                          (columnProdutoRecord
                                                                          .titulo1 ==
                                                                      '') &&
                                                              (columnProdutoRecord
                                                                          .titulo2 ==
                                                                      ''),
                                                          true,
                                                        ))
                                                          Container(
                                                            width: 206.4,
                                                            height: 56.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x0F4AA756),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.8,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                if (FFAppState()
                                                                        .adicionarCarrinho ==
                                                                    false)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .shopping_cart,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Adicionar Ao Carrinho',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      if (currentUserReference !=
                                                                          null) {
                                                                        FFAppState().adicionarCarrinho =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        _model.respostaCarrinhSemVariante1Copy =
                                                                            await queryCarrinhoRecordOnce(
                                                                          parent:
                                                                              currentUserReference,
                                                                        );
                                                                        if (functions.addCardEvitarDuplicarSemVariante(
                                                                            columnProdutoRecord.reference,
                                                                            _model.respostaCarrinhSemVariante1Copy!.toList())) {
                                                                          await CarrinhoRecord.createDoc(currentUserReference!)
                                                                              .set(createCarrinhoRecordData(
                                                                            userRef:
                                                                                currentUserReference,
                                                                            itens:
                                                                                columnProdutoRecord.reference,
                                                                            quantidade:
                                                                                FFAppState().quantidadeProduto,
                                                                            dataAdicao:
                                                                                getCurrentTimestamp,
                                                                            fotoCapa:
                                                                                columnProdutoRecord.imagens.firstOrNull,
                                                                            titulo:
                                                                                columnProdutoRecord.nome,
                                                                            selecionado:
                                                                                true,
                                                                            lojaRef:
                                                                                columnProdutoRecord.lojaRef,
                                                                            preco:
                                                                                columnProdutoRecord.preco,
                                                                            precoAntes:
                                                                                columnProdutoRecord.precoAntes,
                                                                            nacional:
                                                                                columnProdutoRecord.envioNaciona,
                                                                          ));
                                                                        } else {
                                                                          await actions
                                                                              .addCartEvitarDuplicarSemVariente(
                                                                            columnProdutoRecord.reference,
                                                                            _model.respostaCarrinhSemVariante1Copy!.toList(),
                                                                            FFAppState().quantidadeProduto,
                                                                          );
                                                                        }

                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                1500,
                                                                          ),
                                                                        );
                                                                        FFAppState().verCarrinhoLogado =
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
                                                                        FFAppState().adicionarCarrinho =
                                                                            false;
                                                                        FFAppState().verCarrinhoLogado =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        if (columnProdutoRecord.envioNaciona ==
                                                                            true) {
                                                                          FFAppState().CarrinhoTemporarioNacional = functions
                                                                              .addCarrinhoTemporario(getCurrentTimestamp, columnProdutoRecord.imagens.firstOrNull!, columnProdutoRecord.reference, columnProdutoRecord.lojaRef!, true, columnProdutoRecord.preco, columnProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, columnProdutoRecord.nome, '', FFAppState().CarrinhoTemporarioNacional.toList(), null, null, '', null)
                                                                              .toList()
                                                                              .cast<String>();
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          FFAppState().CarrinhoTemporarioInternacional = functions
                                                                              .addCarrinhoTemporario(getCurrentTimestamp, columnProdutoRecord.imagens.firstOrNull!, columnProdutoRecord.reference, columnProdutoRecord.lojaRef!, false, columnProdutoRecord.preco, columnProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, columnProdutoRecord.nome, '', FFAppState().CarrinhoTemporarioInternacional.toList(), null, null, '', null)
                                                                              .toList()
                                                                              .cast<String>();
                                                                          safeSetState(
                                                                              () {});
                                                                        }

                                                                        FFAppState().adicionarCarrinho =
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
                                                                        FFAppState().verCarrinhoLogado =
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
                                                                        FFAppState().adicionarCarrinho =
                                                                            false;
                                                                        FFAppState().verCarrinhoLogado =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text: '',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: Color(
                                                                          0x004AA756),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                        .adicionarCarrinho ==
                                                                    true)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Carregando...',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          (columnProdutoRecord
                                                                          .titulo1 !=
                                                                      '') &&
                                                              (columnProdutoRecord
                                                                          .titulo2 ==
                                                                      '') &&
                                                              ((FFAppState()
                                                                              .selecionarVariante1foto !=
                                                                          '') ||
                                                                  (FFAppState()
                                                                              .selecionarVariante1 !=
                                                                          '')),
                                                          true,
                                                        ))
                                                          FutureBuilder<
                                                              List<
                                                                  VarianteRecord>>(
                                                            future:
                                                                queryVarianteRecordOnce(
                                                              parent:
                                                                  columnProdutoRecord
                                                                      .reference,
                                                              queryBuilder: (varianteRecord) =>
                                                                  varianteRecord
                                                                      .where(
                                                                          Filter
                                                                              .or(
                                                                Filter(
                                                                  'opcao_titulo1',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .selecionarVariante1,
                                                                ),
                                                                Filter(
                                                                  'foto',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .selecionarVariante1foto,
                                                                ),
                                                              )),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 26.0,
                                                                    height:
                                                                        26.0,
                                                                    child:
                                                                        SpinKitCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          26.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<VarianteRecord>
                                                                  varianteOpc1VarianteRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final varianteOpc1VarianteRecord =
                                                                  varianteOpc1VarianteRecordList
                                                                          .isNotEmpty
                                                                      ? varianteOpc1VarianteRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                width: 206.4,
                                                                height: 56.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x0F4AA756),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 0.8,
                                                                  ),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .adicionarCarrinho ==
                                                                        false)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.shopping_cart,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 22.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Adicionar Ao Carrinho',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if ((FFAppState().selecionarVariante1 != '') ||
                                                                            (FFAppState().selecionarVariante1foto != '')) {
                                                                          if (currentUserReference !=
                                                                              null) {
                                                                            FFAppState().adicionarCarrinho =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            _model.respostaCarrinho3 =
                                                                                await queryCarrinhoRecordOnce(
                                                                              parent: currentUserReference,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (functions.addCardEvitarDuplicar(
                                                                                columnProdutoRecord.reference,
                                                                                '${varianteOpc1VarianteRecord?.opcaoTitulo1}${varianteOpc1VarianteRecord?.opcaoTitulo2 != null && varianteOpc1VarianteRecord?.opcaoTitulo2 != '' ? ', ${varianteOpc1VarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                                _model.respostaCarrinho3!.toList())) {
                                                                              await CarrinhoRecord.createDoc(currentUserReference!).set(createCarrinhoRecordData(
                                                                                userRef: currentUserReference,
                                                                                itens: columnProdutoRecord.reference,
                                                                                quantidade: FFAppState().quantidadeProduto,
                                                                                dataAdicao: getCurrentTimestamp,
                                                                                fotoCapa: varianteOpc1VarianteRecord?.foto != null && varianteOpc1VarianteRecord?.foto != '' ? varianteOpc1VarianteRecord?.foto : columnProdutoRecord.imagens.firstOrNull,
                                                                                titulo: columnProdutoRecord.nome,
                                                                                selecionado: true,
                                                                                variacao: '${varianteOpc1VarianteRecord?.opcaoTitulo1}${varianteOpc1VarianteRecord?.opcaoTitulo2 != null && varianteOpc1VarianteRecord?.opcaoTitulo2 != '' ? ', ${varianteOpc1VarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                                lojaRef: columnProdutoRecord.lojaRef,
                                                                                preco: varianteOpc1VarianteRecord?.preco,
                                                                                precoAntes: columnProdutoRecord.precoAntes,
                                                                                nacional: columnProdutoRecord.envioNaciona,
                                                                                varianteRef: varianteOpc1VarianteRecord?.reference,
                                                                              ));
                                                                            } else {
                                                                              await actions.addCartEvitarDuplicar(
                                                                                columnProdutoRecord.reference,
                                                                                '${varianteOpc1VarianteRecord?.opcaoTitulo1}${varianteOpc1VarianteRecord?.opcaoTitulo2 != null && varianteOpc1VarianteRecord?.opcaoTitulo2 != '' ? ', ${varianteOpc1VarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                                _model.respostaCarrinho3!.toList(),
                                                                                FFAppState().quantidadeProduto,
                                                                              );
                                                                            }

                                                                            await Future.delayed(
                                                                              Duration(
                                                                                milliseconds: 1500,
                                                                              ),
                                                                            );
                                                                            FFAppState().verCarrinhoLogado =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            await Future.delayed(
                                                                              Duration(
                                                                                milliseconds: 3000,
                                                                              ),
                                                                            );
                                                                            FFAppState().adicionarCarrinho =
                                                                                false;
                                                                            FFAppState().verCarrinhoLogado =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            if (columnProdutoRecord.envioNaciona ==
                                                                                true) {
                                                                              FFAppState().CarrinhoTemporarioNacional = functions.addCarrinhoTemporario(getCurrentTimestamp, varianteOpc1VarianteRecord?.foto != null && varianteOpc1VarianteRecord?.foto != '' ? varianteOpc1VarianteRecord!.foto : columnProdutoRecord.imagens.firstOrNull!, varianteOpc1VarianteRecord!.produtoRef!, columnProdutoRecord.lojaRef!, true, varianteOpc1VarianteRecord.preco, columnProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, columnProdutoRecord.nome, varianteOpc1VarianteRecord.opcaoTitulo1, FFAppState().CarrinhoTemporarioNacional.toList(), null, null, varianteOpc1VarianteRecord.opcaoTitulo2, varianteOpc1VarianteRecord.reference).toList().cast<String>();
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              FFAppState().CarrinhoTemporarioInternacional = functions.addCarrinhoTemporario(getCurrentTimestamp, varianteOpc1VarianteRecord?.foto != null && varianteOpc1VarianteRecord?.foto != '' ? varianteOpc1VarianteRecord!.foto : columnProdutoRecord.imagens.firstOrNull!, columnProdutoRecord.reference, columnProdutoRecord.lojaRef!, false, varianteOpc1VarianteRecord!.preco, columnProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, columnProdutoRecord.nome, varianteOpc1VarianteRecord.opcaoTitulo1, FFAppState().CarrinhoTemporarioInternacional.toList(), null, null, varianteOpc1VarianteRecord.opcaoTitulo2, varianteOpc1VarianteRecord.reference).toList().cast<String>();
                                                                              safeSetState(() {});
                                                                            }

                                                                            FFAppState().adicionarCarrinho =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            await Future.delayed(
                                                                              Duration(
                                                                                milliseconds: 1500,
                                                                              ),
                                                                            );
                                                                            FFAppState().verCarrinhoLogado =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            await Future.delayed(
                                                                              Duration(
                                                                                milliseconds: 3000,
                                                                              ),
                                                                            );
                                                                            FFAppState().adicionarCarrinho =
                                                                                false;
                                                                            FFAppState().verCarrinhoLogado =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          }
                                                                        } else {
                                                                          if (animationsMap['containerOnActionTriggerAnimation6'] !=
                                                                              null) {
                                                                            await animationsMap['containerOnActionTriggerAnimation6']!.controller.forward(from: 0.0);
                                                                          }
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      text: '',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0x004AA756),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          (columnProdutoRecord
                                                                          .titulo1 !=
                                                                      '') &&
                                                              (columnProdutoRecord
                                                                          .titulo2 !=
                                                                      '') &&
                                                              ((FFAppState()
                                                                              .selecionarVariante2 !=
                                                                          '') &&
                                                                  ((FFAppState().selecionarVariante1foto !=
                                                                              '') ||
                                                                      (FFAppState().selecionarVariante1 !=
                                                                              ''))),
                                                          true,
                                                        ))
                                                          Container(
                                                            width: 206.4,
                                                            height: 56.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x0F4AA756),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.8,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                if (FFAppState()
                                                                        .adicionarCarrinho ==
                                                                    false)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .shopping_cart,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Adicionar Ao Carrinho',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child: FutureBuilder<
                                                                      ProdutoRecord>(
                                                                    future: ProdutoRecord
                                                                        .getDocumentOnce(
                                                                            widget.produtoRef!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return AddtoCardWidget();
                                                                      }

                                                                      final carinhoVarianteOpc1Opc2ProdutoRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              StreamBuilder<List<VarianteRecord>>(
                                                                                stream: queryVarianteRecord(
                                                                                  parent: widget.produtoRef,
                                                                                  queryBuilder: (varianteRecord) => varianteRecord.where(
                                                                                    'opcao_titulo1',
                                                                                    isEqualTo: FFAppState().selecionarVariante1 != '' ? FFAppState().selecionarVariante1 : carinhoVarianteOpc1Opc2ProdutoRecord.varianteTitulo1List.firstOrNull,
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
                                                                                        child: CircularProgressIndicator(
                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            Color(0x004AA756),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<VarianteRecord> textarrumarVarianteRecordList = snapshot.data!;
                                                                                  // Return an empty Container when the item does not exist.
                                                                                  if (snapshot.data!.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final textarrumarVarianteRecord = textarrumarVarianteRecordList.isNotEmpty ? textarrumarVarianteRecordList.first : null;

                                                                                  return Container(
                                                                                    width: double.infinity,
                                                                                    height: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: StreamBuilder<List<VarianteRecord>>(
                                                                                        stream: queryVarianteRecord(
                                                                                          parent: widget.produtoRef,
                                                                                          queryBuilder: (varianteRecord) => varianteRecord
                                                                                              .where(
                                                                                                'opcao_titulo2',
                                                                                                isEqualTo: FFAppState().selecionarVariante2,
                                                                                              )
                                                                                              .where(
                                                                                                'foto',
                                                                                                isEqualTo: textarrumarVarianteRecord?.foto,
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
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 26.0,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          List<VarianteRecord> containerVarianteRecordList = snapshot.data!;
                                                                                          // Return an empty Container when the item does not exist.
                                                                                          if (snapshot.data!.isEmpty) {
                                                                                            return Container();
                                                                                          }
                                                                                          final containerVarianteRecord = containerVarianteRecordList.isNotEmpty ? containerVarianteRecordList.first : null;

                                                                                          return InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (currentUserReference != null) {
                                                                                                FFAppState().adicionarCarrinho = true;
                                                                                                safeSetState(() {});
                                                                                                _model.respostaCarrinho2 = await queryCarrinhoRecordOnce(
                                                                                                  parent: currentUserReference,
                                                                                                );
                                                                                                if (functions.addCardEvitarDuplicar(carinhoVarianteOpc1Opc2ProdutoRecord.reference, '${containerVarianteRecord?.opcaoTitulo1}${containerVarianteRecord?.opcaoTitulo2 != null && containerVarianteRecord?.opcaoTitulo2 != '' ? ', ${containerVarianteRecord?.opcaoTitulo2}' : ' '}', _model.respostaCarrinho2!.toList())) {
                                                                                                  await CarrinhoRecord.createDoc(currentUserReference!).set(createCarrinhoRecordData(
                                                                                                    userRef: currentUserReference,
                                                                                                    itens: carinhoVarianteOpc1Opc2ProdutoRecord.reference,
                                                                                                    quantidade: FFAppState().quantidadeProduto,
                                                                                                    dataAdicao: getCurrentTimestamp,
                                                                                                    fotoCapa: textarrumarVarianteRecord?.foto != null && textarrumarVarianteRecord?.foto != '' ? containerVarianteRecord?.foto : carinhoVarianteOpc1Opc2ProdutoRecord.imagens.firstOrNull,
                                                                                                    titulo: carinhoVarianteOpc1Opc2ProdutoRecord.nome,
                                                                                                    selecionado: true,
                                                                                                    variacao: '${containerVarianteRecord?.opcaoTitulo1}${containerVarianteRecord?.opcaoTitulo2 != null && containerVarianteRecord?.opcaoTitulo2 != '' ? ', ${containerVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                                                    lojaRef: carinhoVarianteOpc1Opc2ProdutoRecord.lojaRef,
                                                                                                    preco: containerVarianteRecord?.preco,
                                                                                                    precoAntes: carinhoVarianteOpc1Opc2ProdutoRecord.precoAntes,
                                                                                                    nacional: carinhoVarianteOpc1Opc2ProdutoRecord.envioNaciona,
                                                                                                    varianteRef: containerVarianteRecord?.reference,
                                                                                                  ));
                                                                                                } else {
                                                                                                  await actions.addCartEvitarDuplicar(
                                                                                                    carinhoVarianteOpc1Opc2ProdutoRecord.reference,
                                                                                                    '${containerVarianteRecord?.opcaoTitulo1}${containerVarianteRecord?.opcaoTitulo2 != null && containerVarianteRecord?.opcaoTitulo2 != '' ? ', ${containerVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                                                    _model.respostaCarrinho2!.toList(),
                                                                                                    FFAppState().quantidadeProduto,
                                                                                                  );
                                                                                                }

                                                                                                await Future.delayed(
                                                                                                  Duration(
                                                                                                    milliseconds: 1500,
                                                                                                  ),
                                                                                                );
                                                                                                FFAppState().verCarrinhoLogado = true;
                                                                                                safeSetState(() {});
                                                                                                await Future.delayed(
                                                                                                  Duration(
                                                                                                    milliseconds: 3000,
                                                                                                  ),
                                                                                                );
                                                                                                FFAppState().adicionarCarrinho = false;
                                                                                                FFAppState().verCarrinhoLogado = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                if (carinhoVarianteOpc1Opc2ProdutoRecord.envioNaciona == true) {
                                                                                                  FFAppState().CarrinhoTemporarioNacional = functions.addCarrinhoTemporario(getCurrentTimestamp, containerVarianteRecord?.foto != null && containerVarianteRecord?.foto != '' ? containerVarianteRecord!.foto : carinhoVarianteOpc1Opc2ProdutoRecord.imagens.firstOrNull!, containerVarianteRecord!.produtoRef!, carinhoVarianteOpc1Opc2ProdutoRecord.lojaRef!, true, containerVarianteRecord.preco, carinhoVarianteOpc1Opc2ProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, carinhoVarianteOpc1Opc2ProdutoRecord.nome, containerVarianteRecord.opcaoTitulo1, FFAppState().CarrinhoTemporarioNacional.toList(), null, null, containerVarianteRecord.opcaoTitulo2, containerVarianteRecord.reference).toList().cast<String>();
                                                                                                  safeSetState(() {});
                                                                                                } else {
                                                                                                  FFAppState().CarrinhoTemporarioInternacional = functions.addCarrinhoTemporario(getCurrentTimestamp, containerVarianteRecord?.foto != null && containerVarianteRecord?.foto != '' ? containerVarianteRecord!.foto : carinhoVarianteOpc1Opc2ProdutoRecord.imagens.firstOrNull!, containerVarianteRecord!.produtoRef!, carinhoVarianteOpc1Opc2ProdutoRecord.lojaRef!, false, containerVarianteRecord.preco, carinhoVarianteOpc1Opc2ProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, carinhoVarianteOpc1Opc2ProdutoRecord.nome, containerVarianteRecord.opcaoTitulo1, FFAppState().CarrinhoTemporarioInternacional.toList(), null, null, containerVarianteRecord.opcaoTitulo2, containerVarianteRecord.reference).toList().cast<String>();
                                                                                                  safeSetState(() {});
                                                                                                }

                                                                                                FFAppState().adicionarCarrinho = true;
                                                                                                safeSetState(() {});
                                                                                                await Future.delayed(
                                                                                                  Duration(
                                                                                                    milliseconds: 1500,
                                                                                                  ),
                                                                                                );
                                                                                                FFAppState().verCarrinhoLogado = true;
                                                                                                safeSetState(() {});
                                                                                                await Future.delayed(
                                                                                                  Duration(
                                                                                                    milliseconds: 3000,
                                                                                                  ),
                                                                                                );
                                                                                                FFAppState().adicionarCarrinho = false;
                                                                                                FFAppState().verCarrinhoLogado = false;
                                                                                                safeSetState(() {});
                                                                                              }

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ).animateOnActionTrigger(
                                                                                    animationsMap['containerOnActionTriggerAnimation7']!,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              StreamBuilder<List<VarianteRecord>>(
                                                                                stream: queryVarianteRecord(
                                                                                  parent: carinhoVarianteOpc1Opc2ProdutoRecord.reference,
                                                                                  queryBuilder: (varianteRecord) => varianteRecord
                                                                                      .where(
                                                                                        'opcao_titulo2',
                                                                                        isEqualTo: FFAppState().selecionarVariante2,
                                                                                      )
                                                                                      .where(
                                                                                        'foto',
                                                                                        isEqualTo: FFAppState().selecionarVariante1foto,
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
                                                                                        child: CircularProgressIndicator(
                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            Color(0x004AA756),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<VarianteRecord> text4444fotoVarianteRecordList = snapshot.data!;
                                                                                  // Return an empty Container when the item does not exist.
                                                                                  if (snapshot.data!.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final text4444fotoVarianteRecord = text4444fotoVarianteRecordList.isNotEmpty ? text4444fotoVarianteRecordList.first : null;

                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (currentUserReference != null) {
                                                                                        FFAppState().adicionarCarrinho = true;
                                                                                        safeSetState(() {});
                                                                                        _model.respostaCarrinho = await queryCarrinhoRecordOnce(
                                                                                          parent: currentUserReference,
                                                                                        );
                                                                                        if (functions.addCardEvitarDuplicar(carinhoVarianteOpc1Opc2ProdutoRecord.reference, '${text4444fotoVarianteRecord?.opcaoTitulo1}${text4444fotoVarianteRecord?.opcaoTitulo2 != null && text4444fotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${text4444fotoVarianteRecord?.opcaoTitulo2}' : ' '}', _model.respostaCarrinho!.toList())) {
                                                                                          await CarrinhoRecord.createDoc(currentUserReference!).set(createCarrinhoRecordData(
                                                                                            userRef: currentUserReference,
                                                                                            itens: carinhoVarianteOpc1Opc2ProdutoRecord.reference,
                                                                                            quantidade: FFAppState().quantidadeProduto,
                                                                                            dataAdicao: getCurrentTimestamp,
                                                                                            fotoCapa: text4444fotoVarianteRecord?.foto != null && text4444fotoVarianteRecord?.foto != '' ? text4444fotoVarianteRecord?.foto : carinhoVarianteOpc1Opc2ProdutoRecord.imagens.firstOrNull,
                                                                                            titulo: carinhoVarianteOpc1Opc2ProdutoRecord.nome,
                                                                                            selecionado: true,
                                                                                            variacao: '${text4444fotoVarianteRecord?.opcaoTitulo1}${text4444fotoVarianteRecord?.opcaoTitulo2 != null && text4444fotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${text4444fotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                                            lojaRef: carinhoVarianteOpc1Opc2ProdutoRecord.lojaRef,
                                                                                            preco: text4444fotoVarianteRecord?.preco,
                                                                                            precoAntes: carinhoVarianteOpc1Opc2ProdutoRecord.precoAntes,
                                                                                            nacional: carinhoVarianteOpc1Opc2ProdutoRecord.envioNaciona,
                                                                                            varianteRef: text4444fotoVarianteRecord?.reference,
                                                                                          ));
                                                                                        } else {
                                                                                          await actions.addCartEvitarDuplicar(
                                                                                            carinhoVarianteOpc1Opc2ProdutoRecord.reference,
                                                                                            '${text4444fotoVarianteRecord?.opcaoTitulo1}${text4444fotoVarianteRecord?.opcaoTitulo2 != null && text4444fotoVarianteRecord?.opcaoTitulo2 != '' ? ', ${text4444fotoVarianteRecord?.opcaoTitulo2}' : ' '}',
                                                                                            _model.respostaCarrinho!.toList(),
                                                                                            FFAppState().quantidadeProduto,
                                                                                          );
                                                                                        }

                                                                                        await Future.delayed(
                                                                                          Duration(
                                                                                            milliseconds: 1500,
                                                                                          ),
                                                                                        );
                                                                                        FFAppState().verCarrinhoLogado = true;
                                                                                        safeSetState(() {});
                                                                                        await Future.delayed(
                                                                                          Duration(
                                                                                            milliseconds: 3000,
                                                                                          ),
                                                                                        );
                                                                                        FFAppState().adicionarCarrinho = false;
                                                                                        FFAppState().verCarrinhoLogado = false;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        if (animationsMap['containerOnActionTriggerAnimation8'] != null) {
                                                                                          animationsMap['containerOnActionTriggerAnimation8']!.controller.forward(from: 0.0);
                                                                                        }
                                                                                        if (carinhoVarianteOpc1Opc2ProdutoRecord.envioNaciona == true) {
                                                                                          FFAppState().CarrinhoTemporarioNacional = functions.addCarrinhoTemporario(getCurrentTimestamp, text4444fotoVarianteRecord?.foto != null && text4444fotoVarianteRecord?.foto != '' ? text4444fotoVarianteRecord!.foto : carinhoVarianteOpc1Opc2ProdutoRecord.imagens.firstOrNull!, text4444fotoVarianteRecord!.produtoRef!, carinhoVarianteOpc1Opc2ProdutoRecord.lojaRef!, true, text4444fotoVarianteRecord.preco, carinhoVarianteOpc1Opc2ProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, carinhoVarianteOpc1Opc2ProdutoRecord.nome, text4444fotoVarianteRecord.opcaoTitulo1, FFAppState().CarrinhoTemporarioNacional.toList(), null, null, text4444fotoVarianteRecord.opcaoTitulo2, text4444fotoVarianteRecord.reference).toList().cast<String>();
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          FFAppState().CarrinhoTemporarioInternacional = functions.addCarrinhoTemporario(getCurrentTimestamp, text4444fotoVarianteRecord?.foto != null && text4444fotoVarianteRecord?.foto != '' ? text4444fotoVarianteRecord!.foto : carinhoVarianteOpc1Opc2ProdutoRecord.imagens.firstOrNull!, text4444fotoVarianteRecord!.produtoRef!, carinhoVarianteOpc1Opc2ProdutoRecord.lojaRef!, false, text4444fotoVarianteRecord.preco, carinhoVarianteOpc1Opc2ProdutoRecord.precoAntes, FFAppState().quantidadeProduto, true, carinhoVarianteOpc1Opc2ProdutoRecord.nome, text4444fotoVarianteRecord.opcaoTitulo1, FFAppState().CarrinhoTemporarioInternacional.toList(), null, null, text4444fotoVarianteRecord.opcaoTitulo2, text4444fotoVarianteRecord.reference).toList().cast<String>();
                                                                                          safeSetState(() {});
                                                                                        }

                                                                                        FFAppState().adicionarCarrinho = true;
                                                                                        safeSetState(() {});
                                                                                        await Future.delayed(
                                                                                          Duration(
                                                                                            milliseconds: 1500,
                                                                                          ),
                                                                                        );
                                                                                        FFAppState().verCarrinhoLogado = true;
                                                                                        safeSetState(() {});
                                                                                        await Future.delayed(
                                                                                          Duration(
                                                                                            milliseconds: 3000,
                                                                                          ),
                                                                                        );
                                                                                        FFAppState().adicionarCarrinho = false;
                                                                                        FFAppState().verCarrinhoLogado = false;
                                                                                        safeSetState(() {});
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                    ),
                                                                                  ).animateOnActionTrigger(
                                                                                    animationsMap['containerOnActionTriggerAnimation8']!,
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
                                                                if (FFAppState()
                                                                        .adicionarCarrinho ==
                                                                    true)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Carregando...',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (() {
                                                          if (((columnProdutoRecord.varianteImgList.isNotEmpty) == true) &&
                                                              (columnProdutoRecord.titulo1 !=
                                                                      '') &&
                                                              ((columnProdutoRecord
                                                                      .varianteTitulo1List
                                                                      .isNotEmpty) ==
                                                                  true) &&
                                                              ((columnProdutoRecord
                                                                      .varianteTitulo2List
                                                                      .isNotEmpty) ==
                                                                  false) &&
                                                              (FFAppState().selecionarVariante1foto ==
                                                                      '')) {
                                                            return true;
                                                          } else if (((columnProdutoRecord
                                                                      .varianteImgList
                                                                      .isNotEmpty) ==
                                                                  false) &&
                                                              (columnProdutoRecord.titulo1 !=
                                                                      '') &&
                                                              ((columnProdutoRecord
                                                                      .varianteTitulo1List
                                                                      .isNotEmpty) ==
                                                                  true) &&
                                                              ((columnProdutoRecord
                                                                      .varianteTitulo2List
                                                                      .isNotEmpty) ==
                                                                  true) &&
                                                              ((FFAppState().selecionarVariante1 == '') ||
                                                                  (FFAppState().selecionarVariante2 ==
                                                                          ''))) {
                                                            return true;
                                                          } else if (((columnProdutoRecord
                                                                      .varianteImgList
                                                                      .isNotEmpty) ==
                                                                  false) &&
                                                              (columnProdutoRecord.titulo1 != '') &&
                                                              ((columnProdutoRecord.varianteTitulo1List.isNotEmpty) == true) &&
                                                              ((columnProdutoRecord.varianteTitulo2List.isNotEmpty) == false) &&
                                                              (FFAppState().selecionarVariante1 == '')) {
                                                            return true;
                                                          } else if (((columnProdutoRecord.varianteImgList.isNotEmpty) == true) && ((columnProdutoRecord.varianteTitulo2List.isNotEmpty) == true) && ((FFAppState().selecionarVariante1foto == '') || (FFAppState().selecionarVariante2 == ''))) {
                                                            return true;
                                                          } else {
                                                            return false;
                                                          }
                                                        }())
                                                          Container(
                                                            width: 206.4,
                                                            height: 56.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x0F4AA756),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.8,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                if (FFAppState()
                                                                        .adicionarCarrinho ==
                                                                    false)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .shopping_cart,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Adicionar Ao Carrinho',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    FFAppState()
                                                                            .PCSemVarianteSetado =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: '',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0x004AA756),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.interTight(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 183.9,
                                                        height: 56.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Comprar Agora',
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
                                                                  fontSize:
                                                                      15.0,
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
                                            ],
                                          ),
                                          if (FFAppState().abrirFrete)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        100.0,
                                                        valueOrDefault<double>(
                                                          columnProdutoRecord
                                                                      .promoRelampagoAgendado ==
                                                                  true
                                                              ? 260.0
                                                              : 230.0,
                                                          230.0,
                                                        ),
                                                        0.0,
                                                        0.0),
                                                child: Container(
                                                  width: 290.41,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7.0),
                                                    border: Border.all(
                                                      color: Color(0xFFF5F5F5),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 39.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.cepTextController,
                                                                          focusNode:
                                                                              _model.cepFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.cepTextController',
                                                                            Duration(milliseconds: 300),
                                                                            () async {
                                                                              var _shouldSetState = false;
                                                                              _model.apiResult1rf = await PuxarCEPCall.call(
                                                                                cepVariavel: functions.apenasNumeros(_model.cepTextController.text),
                                                                              );

                                                                              _shouldSetState = true;
                                                                              if ((_model.apiResult1rf?.succeeded ?? true)) {
                                                                                if (PuxarCEPCall.erro(
                                                                                      (_model.apiResult1rf?.jsonBody ?? ''),
                                                                                    ) ==
                                                                                    'true') {
                                                                                  FFAppState().rua = '';
                                                                                  FFAppState().estado = '';
                                                                                  FFAppState().cidade = '';
                                                                                  FFAppState().bairro = '';
                                                                                  FFAppState().errofrete = true;
                                                                                  FFAppState().freteAchado = false;
                                                                                  safeSetState(() {});
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                } else {
                                                                                  FFAppState().rua = PuxarCEPCall.rua(
                                                                                    (_model.apiResult1rf?.jsonBody ?? ''),
                                                                                  )!;
                                                                                  FFAppState().estado = PuxarCEPCall.estado(
                                                                                    (_model.apiResult1rf?.jsonBody ?? ''),
                                                                                  )!;
                                                                                  FFAppState().cidade = PuxarCEPCall.cidade(
                                                                                    (_model.apiResult1rf?.jsonBody ?? ''),
                                                                                  )!;
                                                                                  FFAppState().bairro = PuxarCEPCall.bairro(
                                                                                    (_model.apiResult1rf?.jsonBody ?? ''),
                                                                                  )!;
                                                                                  FFAppState().enderecoTemporario = '${PuxarCEPCall.estado(
                                                                                    (_model.apiResult1rf?.jsonBody ?? ''),
                                                                                  )}, ${PuxarCEPCall.cidade(
                                                                                    (_model.apiResult1rf?.jsonBody ?? ''),
                                                                                  )}';
                                                                                  FFAppState().errofrete = false;
                                                                                  FFAppState().freteAchado = true;
                                                                                  safeSetState(() {});
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                FFAppState().rua = '';
                                                                                FFAppState().estado = '';
                                                                                FFAppState().cidade = '';
                                                                                FFAppState().bairro = '';
                                                                                FFAppState().errofrete = true;
                                                                                FFAppState().freteAchado = false;
                                                                                safeSetState(() {});
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            alignLabelWithHint:
                                                                                false,
                                                                            hintText:
                                                                                'Digite um CEP (ex: 01000-000)',
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0x852D2929),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Color(0xFFF6F6F6),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF494A4B),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .cepTextControllerValidator
                                                                              .asValidator(context),
                                                                          inputFormatters: [
                                                                            _model.cepMask
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (FFAppState()
                                                                      .errofrete ==
                                                                  true)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Nenhum resultado encontrado',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFFF85C3F),
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await launchURL(
                                                                          'https://buscacepinter.correios.com.br/app/endereco/index.php');
                                                                    },
                                                                    child: Text(
                                                                      'Não sei meu CEP',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF4EA3D6),
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (FFAppState()
                                                                      .freteAchado ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          14.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .abrirFrete =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 2.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFFAFAFA),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.location_pin,
                                                                                      color: Color(0xFF373838),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      _model.cepTextController.text != ''
                                                                                          ? valueOrDefault<String>(
                                                                                              '${FFAppState().cidade != '' ? FFAppState().cidade : 'Cidade'} - ${FFAppState().bairro != '' ? FFAppState().estado : 'Estado'}',
                                                                                              'Estado - Cidade',
                                                                                            )
                                                                                          : 'Procurando...',
                                                                                      'Procurando...',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF373838),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFFAFAFA),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              Container(
                                                                width: 100.0,
                                                                height: 8.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (_model.mouseRegionHovered ?? true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          columnProdutoRecord
                                                                      .promoRelampagoAgendado ==
                                                                  true
                                                              ? 300.0
                                                              : 270.0,
                                                          230.0,
                                                        ),
                                                        0.0,
                                                        0.0),
                                                child: Container(
                                                  width: 574.5,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7.0),
                                                    border: Border.all(
                                                      color: Color(0xFFF5F5F5),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Entrega Padrão',
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
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          functions.frete(
                                                                              () {
                                                                            if (FFAppState().enderecoTemporario != '') {
                                                                              return FFAppState().enderecoTemporario;
                                                                            } else if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') != '') && (FFAppState().enderecoTemporario == '')) {
                                                                              return valueOrDefault(currentUserDocument?.enderecoCompleto, '');
                                                                            } else {
                                                                              return valueOrDefault(currentUserDocument?.enderecoCompleto, '');
                                                                            }
                                                                          }(),
                                                                              columnProdutoRecord.listFrete.toList(),
                                                                              columnProdutoRecord.freteSP),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFFB6B7B8),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                decoration: TextDecoration.lineThrough,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            functions.freteMaisDe20(functions.frete(
                                                                                () {
                                                                              if (FFAppState().enderecoTemporario != '') {
                                                                                return FFAppState().enderecoTemporario;
                                                                              } else if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') != '') && (FFAppState().enderecoTemporario == '')) {
                                                                                return valueOrDefault(currentUserDocument?.enderecoCompleto, '');
                                                                              } else {
                                                                                return valueOrDefault(currentUserDocument?.enderecoCompleto, '');
                                                                              }
                                                                            }(),
                                                                                columnProdutoRecord.listFrete.toList(),
                                                                                columnProdutoRecord.freteSP)),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              columnProdutoRecord
                                                                          .envioNaciona ==
                                                                      true
                                                                  ? functions
                                                                      .estimativaEntrega()
                                                                  : functions
                                                                      .estimativaEntregaInternacional(),
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (functions.freteMaisde20Boolean(functions.frete(
                                                                      () {
                                                                    if (FFAppState().enderecoTemporario !=
                                                                            '') {
                                                                      return FFAppState()
                                                                          .enderecoTemporario;
                                                                    } else if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') !=
                                                                                '') &&
                                                                        (FFAppState().enderecoTemporario ==
                                                                                '')) {
                                                                      return valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.enderecoCompleto,
                                                                          '');
                                                                    } else {
                                                                      return valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.enderecoCompleto,
                                                                          '');
                                                                    }
                                                                  }(),
                                                                      columnProdutoRecord
                                                                          .listFrete
                                                                          .toList(),
                                                                      columnProdutoRecord
                                                                          .freteSP)) ==
                                                                  false)
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              'Frete grátis',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF39D2C0),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' com cupom',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )
                                                                      ],
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
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (functions.freteMaisde20Boolean(functions.frete(
                                                                      () {
                                                                    if (FFAppState().enderecoTemporario !=
                                                                            '') {
                                                                      return FFAppState()
                                                                          .enderecoTemporario;
                                                                    } else if ((valueOrDefault(currentUserDocument?.enderecoCompleto, '') !=
                                                                                '') &&
                                                                        (FFAppState().enderecoTemporario ==
                                                                                '')) {
                                                                      return valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.enderecoCompleto,
                                                                          '');
                                                                    } else {
                                                                      return valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.enderecoCompleto,
                                                                          '');
                                                                    }
                                                                  }(),
                                                                      columnProdutoRecord
                                                                          .listFrete
                                                                          .toList(),
                                                                      columnProdutoRecord
                                                                          .freteSP)) ==
                                                                  true)
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              'Até ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              'R\$20,00 de desconto ',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              'no frete usando cupom',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )
                                                                      ],
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
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: StreamBuilder<LojasRecord>(
                              stream: LojasRecord.getDocument(
                                  columnProdutoRecord.lojaRef!),
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

                                final containerLojasRecord = snapshot.data!;

                                return Container(
                                  width: 1300.0,
                                  height: 95.05,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 445.1,
                                          height: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 374.15,
                                                height: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 65.0,
                                                        height: 65.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFECEDEE),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerLojasRecord
                                                                    .fotoperfil,
                                                                'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(37).png?alt=media&token=97e66ecd-ec6f-4415-b1b0-23bb6aa9ac20',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          7.0),
                                                              child: Text(
                                                                containerLojasRecord
                                                                    .nome,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          15.0,
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
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 100.0,
                                                                  height: 31.1,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFFECEDEE),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Seguir',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        31.1,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFECEDEE),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Ver Loja',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 30.0, 0.0),
                                                child: Container(
                                                  width: 0.5,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFCECDCD),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            width: 797.65,
                                            height: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Seguidores',
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
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          functions.formatNumber(
                                                              containerLojasRecord
                                                                  .seguidores
                                                                  .length),
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
                                                                fontSize: 15.0,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 30.0, 0.0),
                                                  child: Container(
                                                    width: 1.0,
                                                    height: 15.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFCECDCD),
                                                    ),
                                                  ),
                                                ),
                                                StreamBuilder<
                                                    List<PedidosTotalRecord>>(
                                                  stream:
                                                      queryPedidosTotalRecord(
                                                    queryBuilder:
                                                        (pedidosTotalRecord) =>
                                                            pedidosTotalRecord
                                                                .where(
                                                      'lojaRef',
                                                      isEqualTo:
                                                          containerLojasRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 1.0,
                                                          height: 1.0,
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
                                                    List<PedidosTotalRecord>
                                                        containerPedidosTotalRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Vendidos',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    functions.formatNumber(
                                                                        containerPedidosTotalRecordList
                                                                            .length),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        0.0,
                                                                        30.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 1.0,
                                                              height: 15.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFCECDCD),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Produtos',
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
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          functions.formatNumber(
                                                              containerLojasRecord
                                                                  .produtosTotal),
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
                                                                fontSize: 15.0,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 30.0, 0.0),
                                                  child: Container(
                                                    width: 1.0,
                                                    height: 15.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFCECDCD),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Loja Ativa Desde',
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
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          functions.peridoCriacaoLoja(
                                                              containerLojasRecord
                                                                  .dataCriacao!),
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
                                                                fontSize: 15.0,
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
                                              ],
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Container(
                              width: 1300.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                'DESCRIÇÃO DO PRODUTO',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF97999A),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Container(
                              width: 1300.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 0.0, 40.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      columnProdutoRecord.descricao,
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
                                            fontSize: 15.0,
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
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Container(
                              width: 1300.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                'VOCÊ TAMBÉM PODE GOSTAR',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF97999A),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: StreamBuilder<List<ProdutoRecord>>(
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
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 1300.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final produtoRef = functions
                                                            .recomendarProdutosSimilares(
                                                                feed2ProdutoRecordList
                                                                    .toList(),
                                                                columnProdutoRecord
                                                                    .reference,
                                                                FFAppState()
                                                                    .limiteVistualizacaoProdutoHomePage
                                                                    .toString())
                                                            .toList();

                                                        return MasonryGridView
                                                            .builder(
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          gridDelegate:
                                                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 5,
                                                          ),
                                                          crossAxisSpacing: 1.0,
                                                          mainAxisSpacing: 10.0,
                                                          itemCount:
                                                              produtoRef.length,
                                                          shrinkWrap: true,
                                                          itemBuilder: (context,
                                                              produtoRefIndex) {
                                                            final produtoRefItem =
                                                                produtoRef[
                                                                    produtoRefIndex];
                                                            return StreamBuilder<
                                                                ProdutoRecord>(
                                                              stream: ProdutoRecord
                                                                  .getDocument(
                                                                      produtoRefItem
                                                                          .reference),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Carregando19Widget();
                                                                }

                                                                final containerProdutoRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
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
                                                                          context
                                                                              .pushNamed(
                                                                            PaginaProdutoPCWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'produtoRef': serializeParam(
                                                                                containerProdutoRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          FFAppState().quantidadeProduto =
                                                                              1;
                                                                          FFAppState().selecionarVariante1 =
                                                                              '';
                                                                          FFAppState().selecionarVariante2 =
                                                                              '';
                                                                          FFAppState().selecionarVariante1foto =
                                                                              '';
                                                                          FFAppState().verTudo =
                                                                              false;
                                                                          FFAppState().adicionarCarrinho =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                          if ((currentUserDocument?.vistoRecente.toList() ?? []).length ==
                                                                              6) {
                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'vistoRecente': FieldValue.arrayRemove([
                                                                                    (currentUserDocument?.vistoRecente.toList() ?? []).firstOrNull
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });

                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'vistoRecente': FieldValue.arrayUnion([
                                                                                    containerProdutoRecord.reference.id
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                          } else {
                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'vistoRecente': FieldValue.arrayUnion([
                                                                                    containerProdutoRecord.reference.id
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(5.0),
                                                                              bottomRight: Radius.circular(5.0),
                                                                              topLeft: Radius.circular(20.0),
                                                                              topRight: Radius.circular(20.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      height: valueOrDefault<double>(
                                                                                        containerProdutoRecord.margem == 'story' ? 300.0 : 300.0,
                                                                                        300.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(5.0),
                                                                                              topRight: Radius.circular(5.0),
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              containerProdutoRecord.imagens.firstOrNull!,
                                                                                              width: double.infinity,
                                                                                              height: double.infinity,
                                                                                              fit: BoxFit.cover,
                                                                                              alignment: Alignment(0.0, -1.0),
                                                                                            ),
                                                                                          ),
                                                                                          if (containerProdutoRecord.video != '')
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                              child: Padding(
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
                                                                                          if (containerProdutoRecord.capsula1 != '')
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, 1.0),
                                                                                              child: Padding(
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 5.0, 9.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
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
                                                                                                  maxChars: 25,
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
                                                                                          StreamBuilder<List<ProdutoRecord>>(
                                                                                            stream: queryProdutoRecord(
                                                                                              queryBuilder: (produtoRecord) => produtoRecord
                                                                                                  .where(
                                                                                                    'categoria',
                                                                                                    isEqualTo: containerProdutoRecord.categoria,
                                                                                                  )
                                                                                                  .orderBy('vendas', descending: true),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
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
                                                                                              List<ProdutoRecord> containerProdutoRecordList = snapshot.data!;

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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                                                                                if ((containerProdutoRecord.envioNaciona == true) && (containerProdutoRecord.vendas != 0))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0xFFE8FBF1),
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
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
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
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
                                                                                              if ((containerProdutoRecord.envioNaciona == true) && (containerProdutoRecord.vendas == 0))
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
                                                                              if (containerProdutoRecord.envioNaciona)
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.7, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 27.0,
                                                                                      height: 19.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(13.0),
                                                                                          bottomRight: Radius.circular(0.0),
                                                                                          topLeft: Radius.circular(13.0),
                                                                                          topRight: Radius.circular(0.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (containerProdutoRecord.envioNaciona)
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.5, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 26.5,
                                                                                      height: 17.5,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF0E8E2D),
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(13.0),
                                                                                          bottomRight: Radius.circular(0.0),
                                                                                          topLeft: Radius.circular(13.0),
                                                                                          topRight: Radius.circular(0.0),
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(2.0),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.asset(
                                                                                            'assets/images/Ainda_no_Existem_Pedidos_(10).png',
                                                                                            width: 200.0,
                                                                                            height: 200.0,
                                                                                            fit: BoxFit.contain,
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
                                                        FFAppState()
                                                            .FeedDepois) ||
                                                    (FFAppState()
                                                                .FeedAntes ==
                                                            ''))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                15.0,
                                                                10.0,
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
                                                        FFAppState().FeedAntes = functions
                                                            .recomendarProdutosPersonalizados(
                                                                feed2ProdutoRecordList
                                                                    .toList(),
                                                                (currentUserDocument
                                                                            ?.favorito
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
                                                        FFAppState()
                                                                .limiteVistualizacaoProdutoHomePage =
                                                            FFAppState()
                                                                    .limiteVistualizacaoProdutoHomePage +
                                                                5;
                                                        safeSetState(() {});
                                                        FFAppState().FeedDepois = functions
                                                            .recomendarProdutosPersonalizados(
                                                                feed2ProdutoRecordList
                                                                    .toList(),
                                                                (currentUserDocument
                                                                            ?.favorito
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
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 43.3,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Ver mais',
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
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 1.0,
                            height: 90.0,
                            decoration: BoxDecoration(),
                          ),
                          wrapWithModel(
                            model: _model.rodapeModel,
                            updateCallback: () => safeSetState(() {}),
                            child: RodapeWidget(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                if ((FFAppState().verCarrinhoLogado == true) &&
                    (loggedIn == true))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 310.68,
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
                                                  CarrinhoPCWidget.routeName);
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
                    (loggedIn == false))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 310.7,
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
                                                  CarrinhoPCNaoLogadoWidget
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
              ],
            ),
          ),
        );
      },
    );
  }
}
