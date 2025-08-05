import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando17/carregando17_widget.dart';
import '/carregando/carregando3/carregando3_widget.dart';
import '/carregando/carregando4/carregando4_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venda/atualizar_carrinho_produto/atualizar_carrinho_produto_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carrinho_model.dart';
export 'carrinho_model.dart';

class CarrinhoWidget extends StatefulWidget {
  const CarrinhoWidget({super.key});

  static String routeName = 'Carrinho';
  static String routePath = '/carrinho';

  @override
  State<CarrinhoWidget> createState() => _CarrinhoWidgetState();
}

class _CarrinhoWidgetState extends State<CarrinhoWidget> {
  late CarrinhoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarrinhoModel());

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
        queryBuilder: (carrinhoRecord) =>
            carrinhoRecord.orderBy('lojaRef', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEEEEEE),
            body: Carregando4Widget(),
          );
        }
        List<CarrinhoRecord> carrinhoCarrinhoRecordList = snapshot.data!;

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
                      if (isWeb == false)
                        Container(
                          width: double.infinity,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      if (isWeb == true)
                        Container(
                          width: double.infinity,
                          height: 13.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      if ((FFAppState().bennerBaixarAPP == false) && isWeb)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.retorno =
                                await actions.detectarAndroidOuIOS();
                            if (_model.retorno!) {
                              _model.respostaAndroid2 =
                                  await queryLinkRecordOnce(
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
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Icon(
                                              Icons.close_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Ganhe Cupom de Frete Grátis',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'Compre online no aplicativo',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 12.0,
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
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Baixe Agora',
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 10.0,
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
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Carrinho (${functions.somarQuantidadesTotal(carrinhoCarrinhoRecordList.toList())})',
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 6.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.chevron_left_sharp,
                                  color: Color(0xFF303131),
                                  size: 32.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().FezLoginPeloAfiliado ==
                                      true) {
                                    context.pushNamed(HomeLojaWidget.routeName);
                                  } else {
                                    context.safePop();
                                  }
                                },
                                child: Container(
                                  width: 46.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 9.0, 20.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(0x5ECBCDCE),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.check,
                                    color: Color(0xFF2EA597),
                                    size: 17.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Devoluções Gratuitas',
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
                                          color: Color(0xFF2EA597),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                          0.0, 0.0, 20.0, 0.0),
                                      child: Text(
                                        'Oferta exclusiva',
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
                                              color: Color(0xFF303131),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<List<CarrinhoRecord>>(
                        stream: queryCarrinhoRecord(
                          parent: currentUserReference,
                          queryBuilder: (carrinhoRecord) => carrinhoRecord
                              .where(
                                'nacional',
                                isEqualTo: true,
                              )
                              .orderBy('lojaRef', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Carregando17Widget();
                          }
                          List<CarrinhoRecord> containerCarrinhoRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FutureBuilder<List<CarrinhoRecord>>(
                                    future: queryCarrinhoRecordOnce(
                                      parent: currentUserReference,
                                      queryBuilder: (carrinhoRecord) =>
                                          carrinhoRecord
                                              .where(
                                                'nacional',
                                                isEqualTo: true,
                                              )
                                              .orderBy('lojaRef',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Carregando3Widget();
                                      }
                                      List<CarrinhoRecord>
                                          carinhoCarrinhoRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            carinhoCarrinhoRecordList.length,
                                        itemBuilder: (context, carinhoIndex) {
                                          final carinhoCarrinhoRecord =
                                              carinhoCarrinhoRecordList[
                                                  carinhoIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (functions.carrinhoLoja(
                                                  carrinhoCarrinhoRecordList
                                                      .toList(),
                                                  carinhoCarrinhoRecord
                                                      .reference))
                                                Container(
                                                  width: double.infinity,
                                                  height: 4.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                              if (carinhoIndex == 0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await actions
                                                                .updateSelecionadoToTrue2(
                                                              carinhoCarrinhoRecord
                                                                  .reference,
                                                              containerCarrinhoRecordList
                                                                  .toList(),
                                                            );
                                                            if (FFAppState()
                                                                    .selecionadoTodosNacional ==
                                                                true) {
                                                              FFAppState()
                                                                      .selecionadoTodosNacional =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              FFAppState()
                                                                      .selecionadoTodosNacional =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 35.1,
                                                            height: 26.5,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
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
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      if (functions
                                                                              .carrinhoSelecionadoVisto(containerCarrinhoRecordList.toList()) ==
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
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .carrinhoSelecionadoVisto(containerCarrinhoRecordList.toList()) ??
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
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                              MainAxisSize.max,
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
                                                                    valueOrDefault<
                                                                        double>(
                                                              functions.carrinhoIndexUltimo(
                                                                          carinhoIndex,
                                                                          containerCarrinhoRecordList
                                                                              .toList()) ==
                                                                      true
                                                                  ? 8.0
                                                                  : 0.0,
                                                              0.0,
                                                            )),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              functions.carrinhoIndexUltimo(
                                                                          carinhoIndex,
                                                                          containerCarrinhoRecordList
                                                                              .toList()) ==
                                                                      true
                                                                  ? 8.0
                                                                  : 0.0,
                                                              0.0,
                                                            )),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (functions.carrinhoLoja(
                                                                    carrinhoCarrinhoRecordList
                                                                        .toList(),
                                                                    carinhoCarrinhoRecord
                                                                        .reference) ==
                                                                false)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 7.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                            if (functions.carrinhoLoja(
                                                                containerCarrinhoRecordList
                                                                    .toList(),
                                                                carinhoCarrinhoRecord
                                                                    .reference))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            9.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: StreamBuilder<
                                                                    LojasRecord>(
                                                                  stream: LojasRecord
                                                                      .getDocument(
                                                                          carinhoCarrinhoRecord
                                                                              .lojaRef!),
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

                                                                    final rowLojasRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
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
                                                                            await actions.updateSelecionadoToTrue(
                                                                              carinhoCarrinhoRecord.reference,
                                                                              containerCarrinhoRecordList.toList(),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35.1,
                                                                            height:
                                                                                26.5,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
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
                                                                                      if (functions.carrinhoSelecionadoVisto2(containerCarrinhoRecordList.toList(), rowLojasRecord.reference) == false)
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
                                                                                      if (functions.carrinhoSelecionadoVisto2(containerCarrinhoRecordList.toList(), rowLojasRecord.reference) ?? true)
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
                                                                                  rowLojasRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            FFAppState().filtroPerfilLoja =
                                                                                'relevancia';
                                                                            FFAppState().filtroPerfilLoja2 =
                                                                                'itens';
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.storefront_outlined,
                                                                                color: Color(0xFF3E3D3D),
                                                                                size: 17.0,
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
                                                                                        fontSize: 15.0,
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
                                                                        if (carinhoCarrinhoRecord.selecionado ==
                                                                            true) {
                                                                          await carinhoCarrinhoRecord
                                                                              .reference
                                                                              .update(createCarrinhoRecordData(
                                                                            selecionado:
                                                                                false,
                                                                          ));
                                                                        } else {
                                                                          await carinhoCarrinhoRecord
                                                                              .reference
                                                                              .update(createCarrinhoRecordData(
                                                                            selecionado:
                                                                                true,
                                                                          ));
                                                                        }
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
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                18.0,
                                                                            height:
                                                                                18.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Stack(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                children: [
                                                                                  if (carinhoCarrinhoRecord.selecionado == false)
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
                                                                                  if (carinhoCarrinhoRecord.selecionado == true)
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
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
                                                                        context
                                                                            .pushNamed(
                                                                          PaginaProdutoWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'produtoRef':
                                                                                serializeParam(
                                                                              carinhoCarrinhoRecord.itens,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        FFAppState()
                                                                            .quantidadeProduto = 1;
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
                                                                      },
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
                                                                                carinhoCarrinhoRecord.fotoCapa,
                                                                                width: 86.6,
                                                                                height: 87.7,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              3.0,
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
                                                                                PaginaProdutoWidget.routeName,
                                                                                queryParameters: {
                                                                                  'produtoRef': serializeParam(
                                                                                    carinhoCarrinhoRecord.itens,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              FFAppState().quantidadeProduto = 1;
                                                                              FFAppState().selecionarVariante1 = '';
                                                                              FFAppState().selecionarVariante2 = '';
                                                                              FFAppState().selecionarVariante1foto = '';
                                                                              FFAppState().verTudo = false;
                                                                              FFAppState().adicionarCarrinho = false;
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              carinhoCarrinhoRecord.titulo.maybeHandleOverflow(
                                                                                maxChars: 27,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF303131),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (carinhoCarrinhoRecord.variacao !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    PaginaProdutoWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'produtoRef': serializeParam(
                                                                                        carinhoCarrinhoRecord.itens,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );

                                                                                  FFAppState().quantidadeProduto = 1;
                                                                                  FFAppState().selecionarVariante1 = '';
                                                                                  FFAppState().selecionarVariante2 = '';
                                                                                  FFAppState().selecionarVariante1foto = '';
                                                                                  FFAppState().verTudo = false;
                                                                                  FFAppState().adicionarCarrinho = false;
                                                                                  safeSetState(() {});
                                                                                },
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
                                                                                          'Variação: ${carinhoCarrinhoRecord.variacao}'.maybeHandleOverflow(
                                                                                            maxChars: 22,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 13.0,
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
                                                                          ),
                                                                        if (carinhoCarrinhoRecord.variacao ==
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                height: 29.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(100.0),
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
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
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          context.pushNamed(
                                                                                            PaginaProdutoWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'produtoRef': serializeParam(
                                                                                                carinhoCarrinhoRecord.itens,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );

                                                                                          FFAppState().quantidadeProduto = 1;
                                                                                          FFAppState().selecionarVariante1 = '';
                                                                                          FFAppState().selecionarVariante2 = '';
                                                                                          FFAppState().selecionarVariante1foto = '';
                                                                                          FFAppState().verTudo = false;
                                                                                          FFAppState().adicionarCarrinho = false;
                                                                                          safeSetState(() {});
                                                                                        },
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
                                                                                                        fontSize: 10.0,
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
                                                                                                  functions.valorRealString(carinhoCarrinhoRecord.preco),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 17.0,
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
                                                                                                  functions.valorCentavosEmString(carinhoCarrinhoRecord.preco),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 10.0,
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
                                                                                                  'R\$${functions.valorDoubleEmString(carinhoCarrinhoRecord.precoAntes)}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
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
                                                                                                    if (carinhoCarrinhoRecord.quantidade >= 1) {
                                                                                                      await carinhoCarrinhoRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'quantidade': FieldValue.increment(-(1)),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      return;
                                                                                                    } else {
                                                                                                      return;
                                                                                                    }
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
                                                                                            if (carinhoCarrinhoRecord.quantidade <= 1)
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await carinhoCarrinhoRecord.reference.delete();
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
                                                                                                carinhoCarrinhoRecord.quantidade.toString(),
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
                                                                                        await carinhoCarrinhoRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'quantidade': FieldValue.increment(1),
                                                                                            },
                                                                                          ),
                                                                                        });
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
                                                            if ((functions.carrinhoLoja2(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    true) &&
                                                                (functions.carrinhoIndexUltimo(
                                                                        carinhoIndex,
                                                                        containerCarrinhoRecordList
                                                                            .toList()) !=
                                                                    true))
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 7.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                            if ((functions.carrinhoLoja(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    true) &&
                                                                (functions.carrinhoLoja2(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    false) &&
                                                                (functions.carrinhoLoja3(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    false))
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 7.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
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
                                              if (carinhoCarrinhoRecord
                                                          .variacao !=
                                                      '')
                                                StreamBuilder<VarianteRecord>(
                                                  stream: VarianteRecord
                                                      .getDocument(
                                                          carinhoCarrinhoRecord
                                                              .varianteRef!),
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

                                                    final containerVarianteRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          ProdutoRecord>(
                                                        stream: ProdutoRecord
                                                            .getDocument(
                                                                carinhoCarrinhoRecord
                                                                    .itens!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
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

                                                          final containerProdutoRecord =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                AtualizarCarrinhoProdutoWidget(
                                                              key: Key(
                                                                  'Key7sq_${carinhoIndex}_of_${carinhoCarrinhoRecordList.length}'),
                                                              exiteVariante: containerVarianteRecord
                                                                          .opcaoTitulo1 !=
                                                                      '',
                                                              preco:
                                                                  containerProdutoRecord
                                                                      .preco,
                                                              produtoRef:
                                                                  carinhoCarrinhoRecord
                                                                      .itens!,
                                                              dataAtualizacaoProduto:
                                                                  containerProdutoRecord
                                                                      .ultimaAtualizacao,
                                                              dataAtualizacaoCarrinho:
                                                                  carinhoCarrinhoRecord
                                                                      .utimaAtializacaoCarrinho,
                                                              carrinhoRef:
                                                                  carinhoCarrinhoRecord
                                                                      .reference,
                                                              precoVariante:
                                                                  containerVarianteRecord
                                                                      .preco,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              if (carinhoCarrinhoRecord
                                                          .variacao ==
                                                      '')
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: StreamBuilder<
                                                      ProdutoRecord>(
                                                    stream: ProdutoRecord
                                                        .getDocument(
                                                            carinhoCarrinhoRecord
                                                                .itens!),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                Color(
                                                                    0x004AA756),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      final containerProdutoRecord =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            AtualizarCarrinhoProdutoWidget(
                                                          key: Key(
                                                              'Key1jw_${carinhoIndex}_of_${carinhoCarrinhoRecordList.length}'),
                                                          exiteVariante: containerProdutoRecord
                                                                      .titulo1 !=
                                                                  '',
                                                          preco:
                                                              containerProdutoRecord
                                                                  .preco,
                                                          produtoRef:
                                                              carinhoCarrinhoRecord
                                                                  .itens!,
                                                          dataAtualizacaoProduto:
                                                              containerProdutoRecord
                                                                  .ultimaAtualizacao,
                                                          dataAtualizacaoCarrinho:
                                                              carinhoCarrinhoRecord
                                                                  .utimaAtializacaoCarrinho,
                                                          carrinhoRef:
                                                              carinhoCarrinhoRecord
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
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
                          );
                        },
                      ),
                      StreamBuilder<List<CarrinhoRecord>>(
                        stream: queryCarrinhoRecord(
                          parent: currentUserReference,
                          queryBuilder: (carrinhoRecord) => carrinhoRecord
                              .where(
                                'nacional',
                                isEqualTo: false,
                              )
                              .orderBy('lojaRef', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 0.1,
                                height: 0.1,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0x00FFFFFF),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CarrinhoRecord> containerCarrinhoRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FutureBuilder<List<CarrinhoRecord>>(
                                    future: queryCarrinhoRecordOnce(
                                      parent: currentUserReference,
                                      queryBuilder: (carrinhoRecord) =>
                                          carrinhoRecord
                                              .where(
                                                'nacional',
                                                isEqualTo: false,
                                              )
                                              .orderBy('lojaRef',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Carregando3Widget();
                                      }
                                      List<CarrinhoRecord>
                                          carinhoCarrinhoRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            carinhoCarrinhoRecordList.length,
                                        itemBuilder: (context, carinhoIndex) {
                                          final carinhoCarrinhoRecord =
                                              carinhoCarrinhoRecordList[
                                                  carinhoIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (functions.carrinhoLoja(
                                                  carrinhoCarrinhoRecordList
                                                      .toList(),
                                                  carinhoCarrinhoRecord
                                                      .reference))
                                                Container(
                                                  width: double.infinity,
                                                  height: 4.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                              if (carinhoIndex == 0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await actions
                                                                .updateSelecionadoToTrue2(
                                                              carinhoCarrinhoRecord
                                                                  .reference,
                                                              containerCarrinhoRecordList
                                                                  .toList(),
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 35.1,
                                                            height: 26.5,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
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
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      if (functions
                                                                              .carrinhoSelecionadoVisto(containerCarrinhoRecordList.toList()) ==
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
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(41).png?alt=media&token=3812db60-0d2d-46aa-a8d7-43821ffbc591',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .carrinhoSelecionadoVisto(containerCarrinhoRecordList.toList()) ??
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
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(39).png?alt=media&token=4bfe3aca-0c80-469d-bb0f-44b86125223f',
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                              MainAxisSize.max,
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
                                                                    valueOrDefault<
                                                                        double>(
                                                              functions.carrinhoIndexUltimo(
                                                                          carinhoIndex,
                                                                          containerCarrinhoRecordList
                                                                              .toList()) ==
                                                                      true
                                                                  ? 8.0
                                                                  : 0.0,
                                                              0.0,
                                                            )),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              functions.carrinhoIndexUltimo(
                                                                          carinhoIndex,
                                                                          containerCarrinhoRecordList
                                                                              .toList()) ==
                                                                      true
                                                                  ? 8.0
                                                                  : 0.0,
                                                              0.0,
                                                            )),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (functions.carrinhoLoja(
                                                                    carrinhoCarrinhoRecordList
                                                                        .toList(),
                                                                    carinhoCarrinhoRecord
                                                                        .reference) ==
                                                                false)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 7.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                            if (functions.carrinhoLoja(
                                                                containerCarrinhoRecordList
                                                                    .toList(),
                                                                carinhoCarrinhoRecord
                                                                    .reference))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            9.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: StreamBuilder<
                                                                    LojasRecord>(
                                                                  stream: LojasRecord
                                                                      .getDocument(
                                                                          carinhoCarrinhoRecord
                                                                              .lojaRef!),
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

                                                                    final rowLojasRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
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
                                                                            await actions.updateSelecionadoToTrue(
                                                                              carinhoCarrinhoRecord.reference,
                                                                              containerCarrinhoRecordList.toList(),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35.1,
                                                                            height:
                                                                                26.5,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
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
                                                                                      if (functions.carrinhoSelecionadoVisto2(containerCarrinhoRecordList.toList(), rowLojasRecord.reference) == false)
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
                                                                                      if (functions.carrinhoSelecionadoVisto2(containerCarrinhoRecordList.toList(), rowLojasRecord.reference) ?? true)
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
                                                                                  rowLojasRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            FFAppState().filtroPerfilLoja =
                                                                                'relevancia';
                                                                            FFAppState().filtroPerfilLoja2 =
                                                                                'itens';
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.storefront_outlined,
                                                                                color: Color(0xFF3E3D3D),
                                                                                size: 17.0,
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
                                                                                        fontSize: 15.0,
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
                                                                        if (carinhoCarrinhoRecord.selecionado ==
                                                                            true) {
                                                                          await carinhoCarrinhoRecord
                                                                              .reference
                                                                              .update(createCarrinhoRecordData(
                                                                            selecionado:
                                                                                false,
                                                                          ));
                                                                        } else {
                                                                          await carinhoCarrinhoRecord
                                                                              .reference
                                                                              .update(createCarrinhoRecordData(
                                                                            selecionado:
                                                                                true,
                                                                          ));
                                                                        }
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
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                18.0,
                                                                            height:
                                                                                18.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Stack(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                children: [
                                                                                  if (carinhoCarrinhoRecord.selecionado == false)
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
                                                                                  if (carinhoCarrinhoRecord.selecionado == true)
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
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
                                                                        context
                                                                            .pushNamed(
                                                                          PaginaProdutoWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'produtoRef':
                                                                                serializeParam(
                                                                              carinhoCarrinhoRecord.itens,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        FFAppState()
                                                                            .quantidadeProduto = 1;
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
                                                                      },
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
                                                                                carinhoCarrinhoRecord.fotoCapa,
                                                                                width: 86.6,
                                                                                height: 87.7,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              3.0,
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
                                                                                PaginaProdutoWidget.routeName,
                                                                                queryParameters: {
                                                                                  'produtoRef': serializeParam(
                                                                                    carinhoCarrinhoRecord.itens,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              FFAppState().quantidadeProduto = 1;
                                                                              FFAppState().selecionarVariante1 = '';
                                                                              FFAppState().selecionarVariante2 = '';
                                                                              FFAppState().selecionarVariante1foto = '';
                                                                              FFAppState().verTudo = false;
                                                                              FFAppState().adicionarCarrinho = false;
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              carinhoCarrinhoRecord.titulo.maybeHandleOverflow(
                                                                                maxChars: 27,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF303131),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (carinhoCarrinhoRecord.variacao !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    PaginaProdutoWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'produtoRef': serializeParam(
                                                                                        carinhoCarrinhoRecord.itens,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );

                                                                                  FFAppState().quantidadeProduto = 1;
                                                                                  FFAppState().selecionarVariante1 = '';
                                                                                  FFAppState().selecionarVariante2 = '';
                                                                                  FFAppState().selecionarVariante1foto = '';
                                                                                  FFAppState().verTudo = false;
                                                                                  FFAppState().adicionarCarrinho = false;
                                                                                  safeSetState(() {});
                                                                                },
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
                                                                                          'Variação: ${carinhoCarrinhoRecord.variacao}'.maybeHandleOverflow(
                                                                                            maxChars: 22,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 13.0,
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
                                                                          ),
                                                                        if (carinhoCarrinhoRecord.variacao ==
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                height: 29.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(100.0),
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
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
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          context.pushNamed(
                                                                                            PaginaProdutoWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'produtoRef': serializeParam(
                                                                                                carinhoCarrinhoRecord.itens,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );

                                                                                          FFAppState().quantidadeProduto = 1;
                                                                                          FFAppState().selecionarVariante1 = '';
                                                                                          FFAppState().selecionarVariante2 = '';
                                                                                          FFAppState().selecionarVariante1foto = '';
                                                                                          FFAppState().verTudo = false;
                                                                                          FFAppState().adicionarCarrinho = false;
                                                                                          safeSetState(() {});
                                                                                        },
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
                                                                                                        fontSize: 10.0,
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
                                                                                                  functions.valorRealString(carinhoCarrinhoRecord.preco),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 17.0,
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
                                                                                                  functions.valorCentavosEmString(carinhoCarrinhoRecord.preco),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 10.0,
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
                                                                                                  'R\$${functions.valorDoubleEmString(carinhoCarrinhoRecord.precoAntes)}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
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
                                                                                                    if (carinhoCarrinhoRecord.quantidade >= 1) {
                                                                                                      await carinhoCarrinhoRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'quantidade': FieldValue.increment(-(1)),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      return;
                                                                                                    } else {
                                                                                                      return;
                                                                                                    }
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
                                                                                            if (carinhoCarrinhoRecord.quantidade <= 1)
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await carinhoCarrinhoRecord.reference.delete();
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
                                                                                                carinhoCarrinhoRecord.quantidade.toString(),
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
                                                                                        await carinhoCarrinhoRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'quantidade': FieldValue.increment(1),
                                                                                            },
                                                                                          ),
                                                                                        });
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
                                                            if ((functions.carrinhoLoja2(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    true) &&
                                                                (functions.carrinhoIndexUltimo(
                                                                        carinhoIndex,
                                                                        containerCarrinhoRecordList
                                                                            .toList()) !=
                                                                    true))
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 7.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                            if ((functions.carrinhoLoja(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    true) &&
                                                                (functions.carrinhoLoja2(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    false) &&
                                                                (functions.carrinhoLoja3(
                                                                        carrinhoCarrinhoRecordList
                                                                            .toList(),
                                                                        carinhoCarrinhoRecord
                                                                            .reference) ==
                                                                    false))
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 7.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
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
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 87.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x7D14181B),
                                    Colors.transparent
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.41, -1.0),
                                  end: AlignmentDirectional(-0.41, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'Você Também Pode Gostar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xDF14181B),
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Container(
                              width: 87.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Color(0x7D14181B)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.41, -1.0),
                                  end: AlignmentDirectional(-0.41, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<ProdutoRecord>>(
                        stream: queryProdutoRecord(),
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
                          List<ProdutoRecord> feed2ProdutoRecordList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final produtoRef = functions
                                        .recomendarProdutosCarrinho(
                                            feed2ProdutoRecordList.toList(),
                                            (currentUserDocument
                                                        ?.favorito
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
                                                        ?.historicoPesquisa
                                                        .toList() ??
                                                    [])
                                                .toList(),
                                            40,
                                            60,
                                            carrinhoCarrinhoRecordList.toList())
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
                                      itemBuilder: (context, produtoRefIndex) {
                                        final produtoRefItem =
                                            produtoRef[produtoRefIndex];
                                        return StreamBuilder<ProdutoRecord>(
                                          stream: ProdutoRecord.getDocument(
                                              produtoRefItem.reference),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 26.0,
                                                  height: 26.0,
                                                  child: SpinKitCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 26.0,
                                                  ),
                                                ),
                                              );
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
                                                                              7.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              7.0),
                                                                    ),
                                                                  ),
                                                                  child: Stack(
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
                                                                        child: Image
                                                                            .network(
                                                                          containerProdutoRecord
                                                                              .imagens
                                                                              .firstOrNull!,
                                                                          width:
                                                                              double.infinity,
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
                                                                            maxLines:
                                                                                2,
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
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Visibility(
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
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (containerProdutoRecord
                                                                              .freteRapido)
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
                                                                          if (containerProdutoRecord
                                                                              .envioNaciona)
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.7,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
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
                                                                      topRight:
                                                                          Radius.circular(
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
                                                                      1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.5,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
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
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
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
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 1.0,
                        height: 250.0,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 105.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Total',
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
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 3.0, 0.0),
                                            child: Text(
                                              'R\$',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 13.0,
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
                                          Text(
                                            functions
                                                .calcularTotalDeQueriesTrue(
                                                    carrinhoCarrinhoRecordList
                                                        .toList()),
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
                                                      .primaryText,
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
                              20.0, 16.0, 20.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              _model.queryCardCopy2 =
                                  await queryCarrinhoRecordOnce(
                                parent: currentUserReference,
                                queryBuilder: (carrinhoRecord) =>
                                    carrinhoRecord.where(
                                  'selecionado',
                                  isEqualTo: true,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              if (_model.queryCardCopy2?.selecionado == true) {
                                await actions.calcularFrete2(
                                  carrinhoCarrinhoRecordList.toList(),
                                  valueOrDefault(
                                      currentUserDocument?.enderecoCompleto,
                                      ''),
                                );
                                FFAppState().cupomSelecionadoRef = null;
                                FFAppState().gerarICSM = true;
                                FFAppState().freteantes = 0.0;
                                safeSetState(() {});
                                if (valueOrDefault(
                                            currentUserDocument
                                                ?.enderecoCompleto,
                                            '') !=
                                        '') {
                                  FFAppState().metodoPagamento = '';
                                  FFAppState().parceladoApagagar = '';
                                  FFAppState().cartaoRef = null;
                                  FFAppState().taxaProcessamento = '';
                                  FFAppState().moeda = 0.0;
                                  FFAppState().taxaCartaoDouble = 0.0;
                                  safeSetState(() {});
                                  await actions.checkoutFinalSemFrete(
                                    carrinhoCarrinhoRecordList.toList(),
                                    currentUserReference!,
                                  );
                                  _model.listCardFinal2 =
                                      await queryCarrinhoFinalRecordOnce(
                                    parent: currentUserReference,
                                  );
                                  _shouldSetState = true;
                                  await actions.calcularFreteCarrinhoFinal(
                                    _model.listCardFinal2!.toList(),
                                    valueOrDefault(
                                        currentUserDocument?.enderecoCompleto,
                                        ''),
                                  );

                                  context.pushNamed(Comprar3Widget.routeName);
                                } else {
                                  FFAppState().metodoPagamento = '';
                                  FFAppState().parceladoApagagar = '';
                                  FFAppState().cartaoRef = null;
                                  FFAppState().taxaProcessamento = '';
                                  FFAppState().moeda = 0.0;
                                  FFAppState().taxaCartaoDouble = 0.0;
                                  safeSetState(() {});
                                  await actions.checkoutFinalSemFrete(
                                    carrinhoCarrinhoRecordList.toList(),
                                    currentUserReference!,
                                  );
                                  _model.listCardFinal =
                                      await queryCarrinhoFinalRecordOnce(
                                    parent: currentUserReference,
                                  );
                                  _shouldSetState = true;
                                  await actions.calcularFreteCarrinhoFinal(
                                    _model.listCardFinal!.toList(),
                                    valueOrDefault(
                                        currentUserDocument?.enderecoCompleto,
                                        ''),
                                  );

                                  context.pushNamed(
                                    CadastrarEnderecoWidget.routeName,
                                    queryParameters: {
                                      'queryCarrinhoList': serializeParam(
                                        carrinhoCarrinhoRecordList,
                                        ParamType.Document,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'queryCarrinhoList':
                                          carrinhoCarrinhoRecordList,
                                    },
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Selecione algum produto para continuar',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor: Color(0xFFF85757),
                                  ),
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'Continuar',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 38.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconAlignment: IconAlignment.start,
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
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
