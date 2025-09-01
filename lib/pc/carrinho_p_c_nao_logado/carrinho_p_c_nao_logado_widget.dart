import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pc/login_p_c_compra/login_p_c_compra_widget.dart';
import '/pc/login_p_c_principal/login_p_c_principal_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carrinho_p_c_nao_logado_model.dart';
export 'carrinho_p_c_nao_logado_model.dart';

class CarrinhoPCNaoLogadoWidget extends StatefulWidget {
  const CarrinhoPCNaoLogadoWidget({super.key});

  static String routeName = 'CarrinhoPCNaoLogado';
  static String routePath = '/carrinhoPCNaoLogado';

  @override
  State<CarrinhoPCNaoLogadoWidget> createState() =>
      _CarrinhoPCNaoLogadoWidgetState();
}

class _CarrinhoPCNaoLogadoWidgetState extends State<CarrinhoPCNaoLogadoWidget> {
  late CarrinhoPCNaoLogadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarrinhoPCNaoLogadoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: Color(0xFFEEEEEE),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                                alignment: AlignmentDirectional(0.0, 0.0),
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
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Venda na Renda Shop',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.instagram,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 20.0,
                                          ),
                                          Icon(
                                            Icons.tiktok,
                                            color: FlutterFlowTheme.of(context)
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
                                                  child:
                                                      LoginPCPrincipalWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 130.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Cadastre',
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
                                                          fontSize: 13.0,
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
                                              Container(
                                                width: 1.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x88FFFFFF),
                                                ),
                                              ),
                                              Text(
                                                'Entre',
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
                                                          fontSize: 13.0,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (loggedIn == true)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().statusNaopago = true;
                                          FFAppState().statusPreparando = false;
                                          FFAppState().statusEnviado = false;
                                          FFAppState().statusReembolso = false;
                                          FFAppState().statusFinalizado = false;
                                          FFAppState().statusCancelado = false;
                                          safeSetState(() {});

                                          context.pushNamed(
                                              PerfilPCWidget.routeName);
                                        },
                                        child: Container(
                                          height: 27.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Container(
                                                  width: 27.0,
                                                  height: 27.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(11).png?alt=media&token=e5c7f1ab-12eb-4a45-9c2b-a2830445c928',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    currentUserDisplayName,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 287.8,
                                        height: 75.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/logo%20PC.jpg?alt=media&token=e8ba2377-16d0-4711-b1fb-dbbe7af71b83',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 1.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Carrinho De Compras',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 21.0,
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Container(
                                    width: 604.6,
                                    height: 37.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
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
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 485.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onFieldSubmitted: (_) async {
                                                    FFAppState().palavraChavePesquisa = functions
                                                        .listaBuscaHistorico(
                                                            _model
                                                                .textController
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
                                                        .FiltroDestaque = false;
                                                    FFAppState().filtroRecente =
                                                        false;
                                                    FFAppState().filtroPreco =
                                                        '';
                                                    FFAppState()
                                                            .feedDocumentoAntes =
                                                        '4';
                                                    FFAppState().liberarMais =
                                                        30;
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
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                    hintText:
                                                        'Buscar na Renda Shop',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
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
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: GestureDetector(
                                              onTap: () async {
                                                FFAppState()
                                                        .palavraChavePesquisa =
                                                    functions
                                                        .listaBuscaHistorico(
                                                            _model
                                                                .textController
                                                                .text,
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
                                                FFAppState().FiltroDestaque =
                                                    false;
                                                FFAppState().filtroRecente =
                                                    false;
                                                FFAppState().filtroPreco = '';
                                                FFAppState()
                                                    .feedDocumentoAntes = '4';
                                                FFAppState().liberarMais = 30;
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
                                              onForcePressEnd: (details) async {
                                                FFAppState()
                                                        .palavraChavePesquisa =
                                                    functions
                                                        .listaBuscaHistorico(
                                                            _model
                                                                .textController
                                                                .text,
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
                                                FFAppState().FiltroDestaque =
                                                    false;
                                                FFAppState().filtroRecente =
                                                    false;
                                                FFAppState().filtroPreco = '';
                                                FFAppState()
                                                    .feedDocumentoAntes = '4';
                                                FFAppState().liberarMais = 30;
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                4.0, 0.0),
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
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                      shape: badges
                                                          .BadgeShape.circle,
                                                      badgeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      elevation: 11.0,
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      position:
                                                          badges.BadgePosition
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
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((functions
                                    .juntarListaCarrinhoAfiliado(
                                        FFAppState()
                                            .CarrinhoTemporarioNacional
                                            .toList(),
                                        FFAppState()
                                            .CarrinhoTemporarioInternacional
                                            .toList())
                                    .isNotEmpty) ==
                                false)
                              Container(
                                width: 800.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20-%202025-08-08T235911.101.png?alt=media&token=d5858734-4b7f-43e1-a245-3892ecf3084b',
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Seu carrinho está vazio',
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
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            Container(
                              width: 800.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final listaString = FFAppState()
                                            .CarrinhoTemporarioNacional
                                            .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listaString.length,
                                          itemBuilder:
                                              (context, listaStringIndex) {
                                            final listaStringItem =
                                                listaString[listaStringIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (functions.carrinhoLoja22(
                                                    FFAppState()
                                                        .CarrinhoTemporarioNacional
                                                        .toList(),
                                                    listaStringItem))
                                                  Container(
                                                    width: double.infinity,
                                                    height: 4.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .CarrinhoTemporarioNacional
                                                        .firstOrNull ==
                                                    listaStringItem)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 32.3,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.asset(
                                                            'assets/images/ChatGPT_Image_12_de_abr._de_2025,_02_49_38.png',
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
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
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
                                                              FFAppState().CarrinhoTemporarioNacional = functions
                                                                  .carrinhoAfiliadTodosLista(
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioNacional
                                                                          .toList())
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 35.1,
                                                              height: 26.5,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 18.0,
                                                                  height: 18.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        if (functions.carrinhoAfiliadTodosListaBoolean(FFAppState().CarrinhoTemporarioNacional.toList()) ==
                                                                            false)
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        if (functions.carrinhoAfiliadTodosListaBoolean(FFAppState().CarrinhoTemporarioNacional.toList()) ==
                                                                            true)
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Envio Nacional',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .roboto(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF3E3D3D),
                                                                        fontSize:
                                                                            17.0,
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
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                functions.carrinhoIndexUltimo22(
                                                                            listaStringIndex,
                                                                            FFAppState().CarrinhoTemporarioNacional.toList()) ==
                                                                        true
                                                                    ? 8.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                functions.carrinhoIndexUltimo22(
                                                                            listaStringIndex,
                                                                            FFAppState().CarrinhoTemporarioNacional.toList()) ==
                                                                        true
                                                                    ? 8.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (functions.carrinhoLoja22(
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioNacional
                                                                          .toList(),
                                                                      listaStringItem) ==
                                                                  false)
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 7.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              if (functions.verificarPrimeiroDaLoja(
                                                                  FFAppState()
                                                                      .CarrinhoTemporarioNacional
                                                                      .toList(),
                                                                  listaStringItem))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          9.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      LojasRecord>(
                                                                    stream: LojasRecord.getDocument(
                                                                        functions
                                                                            .carrinhoTemporarioLojaRef(listaStringItem)),
                                                                    builder:
                                                                        (context,
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
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                Color(0x004AA756),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final rowLojasRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
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
                                                                              FFAppState().CarrinhoTemporarioNacional = functions.carrinhoAfiliadoLoja(FFAppState().CarrinhoTemporarioNacional.toList(), listaStringItem).toList().cast<String>();
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 35.1,
                                                                              height: 26.5,
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 18.0,
                                                                                  height: 18.0,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Stack(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      children: [
                                                                                        if (functions.carrinhoAfiliadoLojaBoolean(FFAppState().CarrinhoTemporarioNacional.toList(), listaStringItem) == false)
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: double.infinity,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        if (functions.carrinhoAfiliadoLojaBoolean(FFAppState().CarrinhoTemporarioNacional.toList(), listaStringItem) == true)
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: double.infinity,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                                HomeLojaVendedor2Widget.routeName,
                                                                                queryParameters: {
                                                                                  'lojaRef': serializeParam(
                                                                                    functions.carrinhoTemporarioLojaRef(listaStringItem),
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              FFAppState().filtroPerfilLoja = 'relevancia';
                                                                              FFAppState().filtroPerfilLoja2 = 'itens';
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.storefront_outlined,
                                                                                  color: Color(0xFF3E3D3D),
                                                                                  size: 19.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    rowLojasRecord.nome,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.roboto(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF3E3D3D),
                                                                                          fontSize: 17.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.navigate_next_sharp,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 16.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
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
                                                                          FFAppState().CarrinhoTemporarioNacional = functions
                                                                              .carrinhoAfiliadoSelecionado(FFAppState().CarrinhoTemporarioNacional.toList(), listaStringItem)
                                                                              .toList()
                                                                              .cast<String>();
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              35.1,
                                                                          height:
                                                                              67.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 18.0,
                                                                              height: 18.0,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Stack(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  children: [
                                                                                    if (functions.carrinhoAfiliadoSelecionadoBoolen(listaStringItem) == false)
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    if (functions.carrinhoAfiliadoSelecionadoBoolen(listaStringItem) == true)
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                9.0,
                                                                                0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              child: Image.network(
                                                                                functions.carrinhoTemporarioImg(listaStringItem),
                                                                                width: 125.0,
                                                                                height: 124.6,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              functions.carrinhoTemporarioTitulo(listaStringItem).maybeHandleOverflow(
                                                                                    maxChars: 57,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF303131),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (functions
                                                                              .carrinhoTemporarioVarianteExiste(listaStringItem))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  height: 22.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF9F8F8),
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                        child: Text(
                                                                                          functions.carrinhoTemporarioVariante(listaStringItem).maybeHandleOverflow(
                                                                                                maxChars: 22,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      height: 24.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                child: Text(
                                                                                                  'R\$',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.valorRealString(functions.carrinhoTemporarioValor(listaStringItem)),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 19.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                child: Text(
                                                                                                  functions.valorCentavosEmString(functions.carrinhoTemporarioValor(listaStringItem)),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 5.0),
                                                                                                child: Text(
                                                                                                  'R\$${functions.valorDoubleEmString(functions.carrinhoTemporarioValorAntes(listaStringItem))}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        decoration: TextDecoration.lineThrough,
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 10.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 25.0,
                                                                                          height: 26.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFF9F8F8),
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(8.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(8.0),
                                                                                              topRight: Radius.circular(0.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: Color(0x5ECBCDCE),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      FFAppState().updateCarrinhoTemporarioNacionalAtIndex(
                                                                                                        listaStringIndex,
                                                                                                        (_) => functions.carrinhoTemporarioQuantidadeUpdateMenos(listaStringItem),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
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
                                                                                              ),
                                                                                              if (functions.carrinhoTemporarioQuantidadeMinima(listaStringItem))
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      FFAppState().removeFromCarrinhoTemporarioNacional(listaStringItem);
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.delete_rounded,
                                                                                                      color: Color(0xFF787878),
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 31.0,
                                                                                        height: 26.0,
                                                                                        decoration: BoxDecoration(
                                                                                          border: Border.all(
                                                                                            color: Color(0x5ECBCDCE),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                child: Text(
                                                                                                  functions.carrinhoTemporarioQuantidade(listaStringItem).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
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
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().updateCarrinhoTemporarioNacionalAtIndex(
                                                                                            listaStringIndex,
                                                                                            (_) => functions.carrinhoTemporarioQuantidadeUpdateMais(listaStringItem),
                                                                                          );
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 25.0,
                                                                                          height: 26.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFF9F8F8),
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(8.0),
                                                                                              topLeft: Radius.circular(0.0),
                                                                                              topRight: Radius.circular(8.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: Color(0x5ECBCDCE),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Stack(
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
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 800.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final listaString = FFAppState()
                                            .CarrinhoTemporarioInternacional
                                            .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listaString.length,
                                          itemBuilder:
                                              (context, listaStringIndex) {
                                            final listaStringItem =
                                                listaString[listaStringIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (functions.carrinhoLoja22(
                                                    FFAppState()
                                                        .CarrinhoTemporarioInternacional
                                                        .toList(),
                                                    listaStringItem))
                                                  Container(
                                                    width: double.infinity,
                                                    height: 4.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .CarrinhoTemporarioInternacional
                                                        .firstOrNull ==
                                                    listaStringItem)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 32.3,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.asset(
                                                            'assets/images/ChatGPT_Image_12_de_abr._de_2025,_02_49_38.png',
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
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
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
                                                              FFAppState().CarrinhoTemporarioInternacional = functions
                                                                  .carrinhoAfiliadTodosLista(
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioInternacional
                                                                          .toList())
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 35.1,
                                                              height: 26.5,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 18.0,
                                                                  height: 18.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        if (functions.carrinhoAfiliadTodosListaBoolean(FFAppState().CarrinhoTemporarioInternacional.toList()) ==
                                                                            false)
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        if (functions.carrinhoAfiliadTodosListaBoolean(FFAppState().CarrinhoTemporarioInternacional.toList()) ==
                                                                            true)
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Internacional',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .roboto(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF3E3D3D),
                                                                        fontSize:
                                                                            17.0,
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
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                functions.carrinhoIndexUltimo22(
                                                                            listaStringIndex,
                                                                            FFAppState().CarrinhoTemporarioInternacional.toList()) ==
                                                                        true
                                                                    ? 8.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                functions.carrinhoIndexUltimo22(
                                                                            listaStringIndex,
                                                                            FFAppState().CarrinhoTemporarioInternacional.toList()) ==
                                                                        true
                                                                    ? 8.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (functions.carrinhoLoja22(
                                                                      FFAppState()
                                                                          .CarrinhoTemporarioInternacional
                                                                          .toList(),
                                                                      listaStringItem) ==
                                                                  false)
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 7.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              if (functions.verificarPrimeiroDaLoja(
                                                                  FFAppState()
                                                                      .CarrinhoTemporarioInternacional
                                                                      .toList(),
                                                                  listaStringItem))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          9.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      LojasRecord>(
                                                                    stream: LojasRecord.getDocument(
                                                                        functions
                                                                            .carrinhoTemporarioLojaRef(listaStringItem)),
                                                                    builder:
                                                                        (context,
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
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                Color(0x004AA756),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final rowLojasRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
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
                                                                              FFAppState().CarrinhoTemporarioInternacional = functions.carrinhoAfiliadoLoja(FFAppState().CarrinhoTemporarioInternacional.toList(), listaStringItem).toList().cast<String>();
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 35.1,
                                                                              height: 26.5,
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 18.0,
                                                                                  height: 18.0,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Stack(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      children: [
                                                                                        if (functions.carrinhoAfiliadoLojaBoolean(FFAppState().CarrinhoTemporarioInternacional.toList(), listaStringItem) == false)
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: double.infinity,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        if (functions.carrinhoAfiliadoLojaBoolean(FFAppState().CarrinhoTemporarioInternacional.toList(), listaStringItem) == true)
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: double.infinity,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                                HomeLojaVendedor2Widget.routeName,
                                                                                queryParameters: {
                                                                                  'lojaRef': serializeParam(
                                                                                    functions.carrinhoTemporarioLojaRef(listaStringItem),
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              FFAppState().filtroPerfilLoja = 'relevancia';
                                                                              FFAppState().filtroPerfilLoja2 = 'itens';
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.storefront_outlined,
                                                                                  color: Color(0xFF3E3D3D),
                                                                                  size: 19.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    rowLojasRecord.nome,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.roboto(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF3E3D3D),
                                                                                          fontSize: 17.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.navigate_next_sharp,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 16.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
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
                                                                          FFAppState().CarrinhoTemporarioInternacional = functions
                                                                              .carrinhoAfiliadoSelecionado(FFAppState().CarrinhoTemporarioInternacional.toList(), listaStringItem)
                                                                              .toList()
                                                                              .cast<String>();
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              35.1,
                                                                          height:
                                                                              67.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 18.0,
                                                                              height: 18.0,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Stack(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  children: [
                                                                                    if (functions.carrinhoAfiliadoSelecionadoBoolen(listaStringItem) == false)
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    if (functions.carrinhoAfiliadoSelecionadoBoolen(listaStringItem) == true)
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                9.0,
                                                                                0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              child: Image.network(
                                                                                functions.carrinhoTemporarioImg(listaStringItem),
                                                                                width: 125.0,
                                                                                height: 124.6,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              functions.carrinhoTemporarioTitulo(listaStringItem).maybeHandleOverflow(
                                                                                    maxChars: 27,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF303131),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (functions
                                                                              .carrinhoTemporarioVarianteExiste(listaStringItem))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  height: 22.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF9F8F8),
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                        child: Text(
                                                                                          functions.carrinhoTemporarioVariante(listaStringItem).maybeHandleOverflow(
                                                                                                maxChars: 22,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      height: 24.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                child: Text(
                                                                                                  'R\$',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.valorRealString(functions.carrinhoTemporarioValor(listaStringItem)),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 19.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                child: Text(
                                                                                                  functions.valorCentavosEmString(functions.carrinhoTemporarioValor(listaStringItem)),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 5.0),
                                                                                                child: Text(
                                                                                                  'R\$${functions.valorDoubleEmString(functions.carrinhoTemporarioValorAntes(listaStringItem))}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        decoration: TextDecoration.lineThrough,
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 10.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 25.0,
                                                                                          height: 26.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFF9F8F8),
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(8.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(8.0),
                                                                                              topRight: Radius.circular(0.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: Color(0x5ECBCDCE),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      FFAppState().updateCarrinhoTemporarioInternacionalAtIndex(
                                                                                                        listaStringIndex,
                                                                                                        (_) => functions.carrinhoTemporarioQuantidadeUpdateMenos(listaStringItem),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
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
                                                                                              ),
                                                                                              if (functions.carrinhoTemporarioQuantidadeMinima(listaStringItem))
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      FFAppState().removeFromCarrinhoTemporarioInternacional(listaStringItem);
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.delete_rounded,
                                                                                                      color: Color(0xFF787878),
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 31.0,
                                                                                        height: 26.0,
                                                                                        decoration: BoxDecoration(
                                                                                          border: Border.all(
                                                                                            color: Color(0x5ECBCDCE),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                child: Text(
                                                                                                  functions.carrinhoTemporarioQuantidade(listaStringItem).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
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
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().updateCarrinhoTemporarioInternacionalAtIndex(
                                                                                            listaStringIndex,
                                                                                            (_) => functions.carrinhoTemporarioQuantidadeUpdateMais(listaStringItem),
                                                                                          );
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 25.0,
                                                                                          height: 26.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFF9F8F8),
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(8.0),
                                                                                              topLeft: Radius.circular(0.0),
                                                                                              topRight: Radius.circular(8.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: Color(0x5ECBCDCE),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Stack(
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
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 9.0),
                                        child: Text(
                                          'Resumo do Pedido',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Preço estimado:',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
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
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Text(
                                                          'R\$',
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
                                                                    .primary,
                                                                fontSize: 17.0,
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
                                                      Text(
                                                        functions.calcularTotalDeQueriesAfiliado(functions
                                                            .juntarListaCarrinhoAfiliado(
                                                                FFAppState()
                                                                    .CarrinhoTemporarioNacional
                                                                    .toList(),
                                                                FFAppState()
                                                                    .CarrinhoTemporarioInternacional
                                                                    .toList())
                                                            .toList()),
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
                                                                      .primary,
                                                                  fontSize:
                                                                      25.0,
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
                                          20.0, 16.0, 20.0, 16.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (functions.carrinhoAfiliadTodosListaBoolean(functions
                                                  .juntarListaCarrinhoAfiliado(
                                                      FFAppState()
                                                          .CarrinhoTemporarioNacional
                                                          .toList(),
                                                      FFAppState()
                                                          .CarrinhoTemporarioInternacional
                                                          .toList())
                                                  .toList()) ==
                                              true) {
                                            FFAppState().NaoTemConta = '';
                                            safeSetState(() {});
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
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        LoginPCCompraWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Selecione algum produto para continuar',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    Color(0xFFF85757),
                                              ),
                                            );
                                          }
                                        },
                                        text: 'Continuar',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 45.5,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconAlignment: IconAlignment.start,
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
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
                                                fontSize: 18.0,
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
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 9.0),
                                        child: Text(
                                          'Pagamento',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Captura%20de%20tela%202025-08-08%20225820.jpg?alt=media&token=978dc040-3847-4320-8a95-26b2f4d02ed2',
                                          width: double.infinity,
                                          height: 153.8,
                                          fit: BoxFit.contain,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Container(
                      width: 1300.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'VOCÊ TAMBÉM PODE GOSTAR',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Builder(
                                              builder: (context) {
                                                final produtoRef = functions
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
                                                    .toList();

                                                return MasonryGridView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                  ),
                                                  crossAxisSpacing: 1.0,
                                                  mainAxisSpacing: 10.0,
                                                  itemCount: produtoRef.length,
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
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Carregando19Widget();
                                                        }

                                                        final containerProdutoRecord =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
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
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    PaginaProdutoPCWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
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
                                                                  FFAppState()
                                                                          .verTudo =
                                                                      false;
                                                                  FFAppState()
                                                                          .adicionarCarrinho =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  if ((currentUserDocument?.vistoRecente.toList() ??
                                                                              [])
                                                                          .length ==
                                                                      6) {
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'vistoRecente':
                                                                              FieldValue.arrayRemove([
                                                                            (currentUserDocument?.vistoRecente.toList() ?? []).firstOrNull
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });

                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'vistoRecente':
                                                                              FieldValue.arrayUnion([
                                                                            containerProdutoRecord.reference.id
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
                                                                              FieldValue.arrayUnion([
                                                                            containerProdutoRecord.reference.id
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              5.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              5.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20.0),
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            7.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              height: valueOrDefault<double>(
                                                                                containerProdutoRecord.margem == 'story' ? 300.0 : 300.0,
                                                                                300.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
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
                                                                      if (containerProdutoRecord
                                                                          .envioNaciona)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.7,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
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
                                                                      if (containerProdutoRecord
                                                                          .envioNaciona)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.5,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
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
                  Container(
                    width: 1.0,
                    height: 250.0,
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
