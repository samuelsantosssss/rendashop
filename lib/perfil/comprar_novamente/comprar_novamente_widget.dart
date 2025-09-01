import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/perfil/deletar_comprar_novamente/deletar_comprar_novamente_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comprar_novamente_model.dart';
export 'comprar_novamente_model.dart';

class ComprarNovamenteWidget extends StatefulWidget {
  const ComprarNovamenteWidget({super.key});

  static String routeName = 'comprarNovamente';
  static String routePath = '/comprarNovamente';

  @override
  State<ComprarNovamenteWidget> createState() => _ComprarNovamenteWidgetState();
}

class _ComprarNovamenteWidgetState extends State<ComprarNovamenteWidget> {
  late ComprarNovamenteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComprarNovamenteModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Color(0xFF353232),
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Comprar Novamente',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF353232),
                  fontSize: 17.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 1.0,
                height: 30.0,
                decoration: BoxDecoration(),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: StreamBuilder<List<PedidosTotalRecord>>(
                            stream: queryPedidosTotalRecord(
                              queryBuilder: (pedidosTotalRecord) =>
                                  pedidosTotalRecord.where(
                                'userRef',
                                isEqualTo: currentUserReference,
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
                              List<PedidosTotalRecord>
                                  staggeredViewPedidosTotalRecordList =
                                  snapshot.data!;

                              return MasonryGridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                crossAxisSpacing: 1.0,
                                mainAxisSpacing: 10.0,
                                itemCount:
                                    staggeredViewPedidosTotalRecordList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, staggeredViewIndex) {
                                  final staggeredViewPedidosTotalRecord =
                                      staggeredViewPedidosTotalRecordList[
                                          staggeredViewIndex];
                                  return Stack(
                                    children: [
                                      StreamBuilder<ProdutoRecord>(
                                        stream: ProdutoRecord.getDocument(
                                            staggeredViewPedidosTotalRecord
                                                .produtoRef!),
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
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
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

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'vistoRecente':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            containerProdutoRecord
                                                                .reference.id
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
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
                                                                height:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  containerProdutoRecord
                                                                              .margem ==
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
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(5.0),
                                                                        topRight:
                                                                            Radius.circular(5.0),
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        containerProdutoRecord
                                                                            .imagens
                                                                            .firstOrNull!,
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        alignment: Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                      ),
                                                                    ),
                                                                    if (containerProdutoRecord.video !=
                                                                            '')
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
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
                                                                              color: Color(0x91272727),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Icon(
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
                                                                        alignment: AlignmentDirectional(
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
                                                                              color: Color(0x4E000000),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              border: Border.all(
                                                                                color: Color(0xBBFFFFFF),
                                                                                width: 0.4,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
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
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 1.0),
                                                                          child:
                                                                              Padding(
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
                                                                            child:
                                                                                Text(
                                                                          containerProdutoRecord
                                                                              .nome
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                20,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        List<
                                                                            ProdutoRecord>>(
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
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Visibility(
                                                                            visible: functions.maisVendidoBooleanFeed(
                                                                                containerProdutoRecord.reference,
                                                                                containerProdutoRecordList.toList(),
                                                                                containerProdutoRecord.vendas),
                                                                            child:
                                                                                Padding(
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
                                                                            containerProdutoRecord.titulo1 != ''
                                                                                ? functions.valorRealString(containerProdutoRecord.menorPrecoRevenda)
                                                                                : functions.valorRealString(containerProdutoRecord.preco),
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
                                                                            containerProdutoRecord.titulo1 != ''
                                                                                ? functions.valorCentavosEmString(containerProdutoRecord.menorPrecoRevenda)
                                                                                : functions.valorCentavosEmString(containerProdutoRecord.preco),
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
                                                                          if (containerProdutoRecord.vendas >=
                                                                              1)
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
                                                                          if (containerProdutoRecord.vendas ==
                                                                              0)
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (containerProdutoRecord
                                                                            .freteRapido)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                7.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
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
                                                                        if (containerProdutoRecord
                                                                            .envioNaciona)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            13.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                        if (containerProdutoRecord
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
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            13.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                                          .all(
                                                                              2.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
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
                                      ),
                                      DeletarComprarNovamenteWidget(
                                        key: Key(
                                            'Key63j_${staggeredViewIndex}_of_${staggeredViewPedidosTotalRecordList.length}'),
                                        pedidoRef:
                                            staggeredViewPedidosTotalRecord
                                                .reference,
                                        produtoRef:
                                            staggeredViewPedidosTotalRecord
                                                .produtoRef!,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        if (FFAppState().feedDocumentoAntes ==
                            FFAppState().feedDocumentoDepois)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'Não foram encontrados mais produtos',
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
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                decoration: BoxDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
