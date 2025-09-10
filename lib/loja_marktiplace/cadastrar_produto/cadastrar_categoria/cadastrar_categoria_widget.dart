import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cadastrar_categoria_model.dart';
export 'cadastrar_categoria_model.dart';

class CadastrarCategoriaWidget extends StatefulWidget {
  const CadastrarCategoriaWidget({super.key});

  static String routeName = 'Cadastrar_categoria';
  static String routePath = '/cadastrarCategoria';

  @override
  State<CadastrarCategoriaWidget> createState() =>
      _CadastrarCategoriaWidgetState();
}

class _CadastrarCategoriaWidgetState extends State<CadastrarCategoriaWidget> {
  late CadastrarCategoriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastrarCategoriaModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 33.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Escolher Categoria',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().selecionardoLider1 = true;
                              FFAppState().selecionardoLider2 = false;
                              FFAppState().selecionardoLider3 = false;
                              FFAppState().selecionardoLider4 = false;
                              safeSetState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 7.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().lider1,
                                        'Por favor escolha',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: valueOrDefault<Color>(
                                              FFAppState().selecionardoLider1
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : Color(0xFF3D3D40),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().selecionardoLider1 == true)
                                  Flexible(
                                    child: Container(
                                      width: 50.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (FFAppState().lider1 != '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().selecionardoLider1 = false;
                                FFAppState().selecionardoLider2 = true;
                                FFAppState().selecionardoLider3 = false;
                                FFAppState().selecionardoLider4 = false;
                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 7.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().lider2,
                                          'Por favor escolha',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                FFAppState().selecionardoLider2 ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0xFF3D3D40),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().selecionardoLider2 == true)
                                    Flexible(
                                      child: Container(
                                        width: 50.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        if (FFAppState().lider2 != '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().selecionardoLider1 = false;
                                FFAppState().selecionardoLider2 = false;
                                FFAppState().selecionardoLider3 = true;
                                FFAppState().selecionardoLider4 = false;
                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 7.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().lider3,
                                          'Por favor escolha',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                FFAppState().selecionardoLider3 ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0xFF3D3D40),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().selecionardoLider3 == true)
                                    Flexible(
                                      child: Container(
                                        width: 50.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        if (FFAppState().lider3 != '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().selecionardoLider1 = false;
                                FFAppState().selecionardoLider2 = false;
                                FFAppState().selecionardoLider3 = false;
                                FFAppState().selecionardoLider4 = true;
                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 7.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().lider4,
                                          'Por favor escolha',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                FFAppState().selecionardoLider4 ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0xFF3D3D40),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().selecionardoLider4 == true)
                                    Flexible(
                                      child: Container(
                                        width: 50.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
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
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: Color(0x5ECBCDCE),
                  ),
                ),
                if ((FFAppState().lider1 == '') ||
                    FFAppState().selecionardoLider1)
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: StreamBuilder<List<CategoriaProdutoRecord>>(
                      stream: queryCategoriaProdutoRecord(
                        queryBuilder: (categoriaProdutoRecord) =>
                            categoriaProdutoRecord.where(
                          'numero_categoria',
                          isEqualTo: '1',
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                            ),
                          );
                        }
                        List<CategoriaProdutoRecord>
                            lider1CategoriaProdutoRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final lider1CategoriaProdutoRecord =
                            lider1CategoriaProdutoRecordList.isNotEmpty
                                ? lider1CategoriaProdutoRecordList.first
                                : null;

                        return ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Builder(
                              builder: (context) {
                                final lider1 = lider1CategoriaProdutoRecord
                                        ?.listDoLider
                                        .toList() ??
                                    [];

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(lider1.length,
                                        (lider1Index) {
                                      final lider1Item = lider1[lider1Index];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().lider1 = lider1Item;
                                          FFAppState().selecionardoLider1 =
                                              false;
                                          FFAppState().selecionardoLider2 =
                                              true;
                                          FFAppState().selecionardoLider3 =
                                              false;
                                          FFAppState().selecionardoLider4 =
                                              false;
                                          FFAppState().lider2 = '';
                                          FFAppState().lider3 = '';
                                          FFAppState().lider4 = '';
                                          safeSetState(() {});
                                        },
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      lider1Item,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppState()
                                                                        .lider1 ==
                                                                    lider1Item
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Icon(
                                                      Icons.navigate_next,
                                                      color: Color(0xFFCBCBCB),
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
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
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                if ((FFAppState().lider1 != '') &&
                    FFAppState().selecionardoLider2)
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: StreamBuilder<List<CategoriaProdutoRecord>>(
                      stream: queryCategoriaProdutoRecord(
                        queryBuilder: (categoriaProdutoRecord) =>
                            categoriaProdutoRecord
                                .where(
                                  'numero_categoria',
                                  isEqualTo: '2',
                                )
                                .where(
                                  'lider_nome',
                                  isEqualTo: FFAppState().lider1,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                            ),
                          );
                        }
                        List<CategoriaProdutoRecord>
                            lider2CategoriaProdutoRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final lider2CategoriaProdutoRecord =
                            lider2CategoriaProdutoRecordList.isNotEmpty
                                ? lider2CategoriaProdutoRecordList.first
                                : null;

                        return ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Builder(
                              builder: (context) {
                                final lider2 = lider2CategoriaProdutoRecord
                                        ?.listDoLider
                                        .toList() ??
                                    [];

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(lider2.length,
                                        (lider2Index) {
                                      final lider2Item = lider2[lider2Index];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (functions
                                              .cadastroCategoria2(lider2Item)) {
                                            FFAppState().categoriasGeral =
                                                functions.cadastroCategoria1(
                                                    lider2Item);
                                            FFAppState().lider2 = functions
                                                .cadastroCategoria1(lider2Item);
                                            FFAppState().selecionardoLider4 =
                                                false;
                                            FFAppState().selecionardoLider3 =
                                                false;
                                            FFAppState().lider4 = '';
                                            FFAppState().lider3 = '';
                                            safeSetState(() {});
                                            context.safePop();
                                          } else {
                                            FFAppState().selecionardoLider1 =
                                                false;
                                            FFAppState().selecionardoLider2 =
                                                false;
                                            FFAppState().selecionardoLider3 =
                                                true;
                                            FFAppState().selecionardoLider4 =
                                                false;
                                            FFAppState().lider2 = lider2Item;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      functions
                                                          .cadastroCategoria1(
                                                              lider2Item),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppState()
                                                                        .lider2 ==
                                                                    lider2Item
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    if (functions
                                                            .cadastroCategoria2(
                                                                lider2Item) ==
                                                        false)
                                                      Icon(
                                                        Icons.navigate_next,
                                                        color:
                                                            Color(0xFFCBCBCB),
                                                        size: 24.0,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
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
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                if ((FFAppState().lider2 != '') &&
                    FFAppState().selecionardoLider3)
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: StreamBuilder<List<CategoriaProdutoRecord>>(
                      stream: queryCategoriaProdutoRecord(
                        queryBuilder: (categoriaProdutoRecord) =>
                            categoriaProdutoRecord
                                .where(
                                  'numero_categoria',
                                  isEqualTo: '3',
                                )
                                .where(
                                  'lider_nome',
                                  isEqualTo: FFAppState().lider2,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                            ),
                          );
                        }
                        List<CategoriaProdutoRecord>
                            lider3CategoriaProdutoRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final lider3CategoriaProdutoRecord =
                            lider3CategoriaProdutoRecordList.isNotEmpty
                                ? lider3CategoriaProdutoRecordList.first
                                : null;

                        return ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Builder(
                              builder: (context) {
                                final lider3 = lider3CategoriaProdutoRecord
                                        ?.listDoLider
                                        .toList() ??
                                    [];

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(lider3.length,
                                        (lider3Index) {
                                      final lider3Item = lider3[lider3Index];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (functions
                                              .cadastroCategoria2(lider3Item)) {
                                            FFAppState().categoriasGeral =
                                                functions.cadastroCategoria1(
                                                    lider3Item);
                                            FFAppState().lider3 = functions
                                                .cadastroCategoria1(lider3Item);
                                            FFAppState().selecionardoLider4 =
                                                false;
                                            FFAppState().lider4 = '';
                                            safeSetState(() {});
                                            context.safePop();
                                          } else {
                                            FFAppState().selecionardoLider1 =
                                                false;
                                            FFAppState().selecionardoLider2 =
                                                false;
                                            FFAppState().selecionardoLider3 =
                                                false;
                                            FFAppState().selecionardoLider4 =
                                                true;
                                            FFAppState().lider3 = lider3Item;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      functions
                                                          .cadastroCategoria1(
                                                              lider3Item),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppState()
                                                                        .lider3 ==
                                                                    lider3Item
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    if (functions
                                                            .cadastroCategoria2(
                                                                lider3Item) ==
                                                        false)
                                                      Icon(
                                                        Icons.navigate_next,
                                                        color:
                                                            Color(0xFFCBCBCB),
                                                        size: 24.0,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
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
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                if ((FFAppState().lider3 != '') &&
                    FFAppState().selecionardoLider4)
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: StreamBuilder<List<CategoriaProdutoRecord>>(
                      stream: queryCategoriaProdutoRecord(
                        queryBuilder: (categoriaProdutoRecord) =>
                            categoriaProdutoRecord
                                .where(
                                  'numero_categoria',
                                  isEqualTo: '4',
                                )
                                .where(
                                  'lider_nome',
                                  isEqualTo: FFAppState().lider3,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                            ),
                          );
                        }
                        List<CategoriaProdutoRecord>
                            lider4CategoriaProdutoRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final lider4CategoriaProdutoRecord =
                            lider4CategoriaProdutoRecordList.isNotEmpty
                                ? lider4CategoriaProdutoRecordList.first
                                : null;

                        return ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Builder(
                              builder: (context) {
                                final lider4 = lider4CategoriaProdutoRecord
                                        ?.listDoLider
                                        .toList() ??
                                    [];

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(lider4.length,
                                        (lider4Index) {
                                      final lider4Item = lider4[lider4Index];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (functions
                                              .cadastroCategoria2(lider4Item)) {
                                            FFAppState().categoriasGeral =
                                                functions.cadastroCategoria1(
                                                    lider4Item);
                                            FFAppState().lider4 = functions
                                                .cadastroCategoria1(lider4Item);
                                            safeSetState(() {});
                                            context.safePop();
                                          } else {
                                            FFAppState().selecionardoLider1 =
                                                false;
                                            FFAppState().selecionardoLider2 =
                                                false;
                                            FFAppState().selecionardoLider3 =
                                                false;
                                            FFAppState().selecionardoLider4 =
                                                true;
                                            FFAppState().lider3 = '';
                                            FFAppState().lider4 = lider4Item;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      functions
                                                          .cadastroCategoria1(
                                                              lider4Item),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppState()
                                                                        .lider4 ==
                                                                    lider4Item
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    if (functions
                                                            .cadastroCategoria2(
                                                                lider4Item) ==
                                                        false)
                                                      Icon(
                                                        Icons.navigate_next,
                                                        color:
                                                            Color(0xFFCBCBCB),
                                                        size: 24.0,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
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
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
