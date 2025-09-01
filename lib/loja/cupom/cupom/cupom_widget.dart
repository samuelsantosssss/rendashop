import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/cupom/cupom_acima10/cupom_acima10_widget.dart';
import '/loja/cupom/cupom_acima19/cupom_acima19_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cupom_model.dart';
export 'cupom_model.dart';

class CupomWidget extends StatefulWidget {
  const CupomWidget({
    super.key,
    required this.queryCarrinhoList,
  });

  final List<CarrinhoRecord>? queryCarrinhoList;

  @override
  State<CupomWidget> createState() => _CupomWidgetState();
}

class _CupomWidgetState extends State<CupomWidget> {
  late CupomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CupomModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<List<CarrinhoRecord>>(
      stream: queryCarrinhoRecord(
        parent: currentUserReference,
        queryBuilder: (carrinhoRecord) => carrinhoRecord.where(
          'selecionado',
          isEqualTo: true,
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
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 26.0,
              ),
            ),
          );
        }
        List<CarrinhoRecord> containerCarrinhoRecordList = snapshot.data!;

        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: StreamBuilder<List<CupomRecord>>(
                stream: queryCupomRecord(
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
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 26.0,
                        ),
                      ),
                    );
                  }
                  List<CupomRecord> containerCupomRecordList = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 11.0),
                                          child: Container(
                                            width: 48.0,
                                            height: 3.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFCBCBCB),
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
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
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().listCarrinho = [];
                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              'Selecione Cupons Renda Shop',
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
                                                    color: Color(0xFF3E3E3E),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          border: Border.all(
                                            color: Color(0xFFD2D2D2),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 3.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                  alignLabelWithHint: false,
                                                  hintText:
                                                      'Insira o código do cupom Renda Shop',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                        fontSize: 10.0,
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
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xFFFAFAFA),
                                                  contentPadding:
                                                      EdgeInsets.all(10.0),
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
                                                      color: Color(0xFF565656),
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
                                                textAlign: TextAlign.start,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Aplicar',
                                        options: FFButtonOptions(
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFB2B2B2),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 96.0, 0.0, 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cupons disponíveis',
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
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Permitido selecionar 1',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 10.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                ListView(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    StreamBuilder<List<CupomRecord>>(
                                      stream: queryCupomRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (cupomRecord) =>
                                            cupomRecord
                                                .where(
                                                  'status',
                                                  isEqualTo: 'disponivel',
                                                )
                                                .where(
                                                  'tipo_cupom',
                                                  isEqualTo:
                                                      'Produto a cima de R\$10',
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 26.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CupomRecord>
                                            containerCupomRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerCupomRecord =
                                            containerCupomRecordList.isNotEmpty
                                                ? containerCupomRecordList.first
                                                : null;

                                        return Container(
                                          width: double.infinity,
                                          height: 138.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child:
                                              StreamBuilder<List<CupomRecord>>(
                                            stream: queryCupomRecord(
                                              parent: currentUserReference,
                                              queryBuilder: (cupomRecord) =>
                                                  cupomRecord.where(
                                                'tipo_cupom',
                                                isEqualTo:
                                                    'Produto a cima de R\$10',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 26.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CupomRecord>
                                                  containerCupomRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    if (containerCupomRecordList
                                                            .length >=
                                                        2)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      18.0,
                                                                      0.0,
                                                                      18.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFE1E1E1),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(9.0),
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
                                                          if (FFAppState()
                                                                  .cupomSelecionadoRef ==
                                                              containerCupomRecord
                                                                  .reference) {
                                                            FFAppState()
                                                                    .cupomSelecionadoRef =
                                                                null;
                                                            FFAppState()
                                                                    .freteantes =
                                                                0.0;
                                                            safeSetState(() {});
                                                            await actions
                                                                .calcularFrete2(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.enderecoCompleto,
                                                                  ''),
                                                            );
                                                            FFAppState()
                                                                    .gerarICSM =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState()
                                                                    .cupomSelecionadoRef =
                                                                containerCupomRecord
                                                                    .reference;
                                                            safeSetState(() {});
                                                            await actions
                                                                .freteantess(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                            );
                                                            await actions
                                                                .freteCupomNovo(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.enderecoCompleto,
                                                                  ''),
                                                              containerCupomRecord
                                                                  .valor,
                                                              containerCupomRecord
                                                                  .nome,
                                                            );
                                                            FFAppState()
                                                                    .gerarICSM =
                                                                false;
                                                            safeSetState(() {});
                                                          }
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
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          28.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
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
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Ainda_no_Existem_Pedidos_(22).png',
                                                                          width:
                                                                              56.0,
                                                                          height:
                                                                              56.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                              child: Text(
                                                                                'TODAS AS LOJAS',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF3E3E3E),
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                3.0),
                                                                            child:
                                                                                Text(
                                                                              containerCupomRecord!.nome,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF3E3E3E),
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            containerCupomRecord.tipoCupom,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF3E3E3E),
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
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
                                                                            'Termina em ${functions.cupomData(containerCupomRecord.data!)} dias',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              0.0,
                                                                              3.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                1.0,
                                                                            height:
                                                                                8.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFDDDDDD),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
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
                                                                            'Condições',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF1B88E3),
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                2.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (FFAppState().cupomSelecionadoRef == containerCupomRecord.reference) {
                                                                                  FFAppState().cupomSelecionadoRef = null;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  FFAppState().cupomSelecionadoRef = containerCupomRecord.reference;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                width: 18.0,
                                                                                height: 18.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().cupomSelecionadoRef == containerCupomRecord.reference ? FlutterFlowTheme.of(context).primary : Color(0xFFD4D4D4),
                                                                                    Color(0xFFD4D4D4),
                                                                                  ),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 15.0,
                                                                                    height: 15.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        FFAppState().cupomSelecionadoRef == containerCupomRecord.reference ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.check,
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        size: 12.0,
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
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    2.0,
                                                                    32.0),
                                                        child: Container(
                                                          width: 13.0,
                                                          height: 13.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    0.0,
                                                                    32.0),
                                                        child: Container(
                                                          width: 13.0,
                                                          height: 13.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Container(
                                                        width: 9.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Container(
                                                        width: 9.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    99.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ),
                                                    ),
                                                    if (containerCupomRecordList
                                                            .length >=
                                                        2)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      19.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 17.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFCFFFD6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.9,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'x${containerCupomRecordList.length.toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .cupomAcima10Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: CupomAcima10Widget(
                                                        query:
                                                            containerCarrinhoRecordList,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    StreamBuilder<List<CupomRecord>>(
                                      stream: queryCupomRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (cupomRecord) =>
                                            cupomRecord
                                                .where(
                                                  'status',
                                                  isEqualTo: 'disponivel',
                                                )
                                                .where(
                                                  'tipo_cupom',
                                                  isEqualTo:
                                                      'Produto a cima de R\$19',
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 26.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CupomRecord>
                                            containerCupomRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerCupomRecord =
                                            containerCupomRecordList.isNotEmpty
                                                ? containerCupomRecordList.first
                                                : null;

                                        return Container(
                                          width: double.infinity,
                                          height: 138.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child:
                                              StreamBuilder<List<CupomRecord>>(
                                            stream: queryCupomRecord(
                                              parent: currentUserReference,
                                              queryBuilder: (cupomRecord) =>
                                                  cupomRecord.where(
                                                'tipo_cupom',
                                                isEqualTo:
                                                    'Produto a cima de R\$19',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 26.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CupomRecord>
                                                  containerCupomRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    if (containerCupomRecordList
                                                            .length >=
                                                        2)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      18.0,
                                                                      0.0,
                                                                      18.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFE1E1E1),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(9.0),
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
                                                          if (FFAppState()
                                                                  .cupomSelecionadoRef ==
                                                              containerCupomRecord
                                                                  .reference) {
                                                            FFAppState()
                                                                    .cupomSelecionadoRef =
                                                                null;
                                                            FFAppState()
                                                                    .freteantes =
                                                                0.0;
                                                            safeSetState(() {});
                                                            await actions
                                                                .calcularFrete2(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.enderecoCompleto,
                                                                  ''),
                                                            );
                                                            FFAppState()
                                                                    .gerarICSM =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState()
                                                                    .cupomSelecionadoRef =
                                                                containerCupomRecord
                                                                    .reference;
                                                            safeSetState(() {});
                                                            await actions
                                                                .freteantess(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                            );
                                                            await actions
                                                                .freteCupomNovo(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.enderecoCompleto,
                                                                  ''),
                                                              containerCupomRecord
                                                                  .valor,
                                                              containerCupomRecord
                                                                  .nome,
                                                            );
                                                            FFAppState()
                                                                    .gerarICSM =
                                                                false;
                                                            safeSetState(() {});
                                                          }
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
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          28.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
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
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Ainda_no_Existem_Pedidos_(22).png',
                                                                          width:
                                                                              56.0,
                                                                          height:
                                                                              56.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                              child: Text(
                                                                                'TODAS AS LOJAS',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF3E3E3E),
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                3.0),
                                                                            child:
                                                                                Text(
                                                                              containerCupomRecord!.nome,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF3E3E3E),
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            containerCupomRecord.tipoCupom,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF3E3E3E),
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
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
                                                                            'Termina em ${functions.cupomData(containerCupomRecord.data!)} dias',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              0.0,
                                                                              3.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                1.0,
                                                                            height:
                                                                                8.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFDDDDDD),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
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
                                                                            'Condições',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF1B88E3),
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                2.0),
                                                                            child:
                                                                                Container(
                                                                              width: 18.0,
                                                                              height: 18.0,
                                                                              decoration: BoxDecoration(
                                                                                color: valueOrDefault<Color>(
                                                                                  FFAppState().cupomSelecionadoRef == containerCupomRecord.reference ? FlutterFlowTheme.of(context).primary : Color(0xFFD4D4D4),
                                                                                  Color(0xFFD4D4D4),
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(2.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().cupomSelecionadoRef == containerCupomRecord.reference ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      size: 12.0,
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
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    2.0,
                                                                    32.0),
                                                        child: Container(
                                                          width: 13.0,
                                                          height: 13.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    0.0,
                                                                    32.0),
                                                        child: Container(
                                                          width: 13.0,
                                                          height: 13.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Container(
                                                        width: 9.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Container(
                                                        width: 9.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                      ),
                                                    ),
                                                    if (containerCupomRecordList
                                                            .length >=
                                                        2)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      19.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 17.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFCFFFD6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.9,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'x${containerCupomRecordList.length.toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .cupomAcima19Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: CupomAcima19Widget(
                                                        query19:
                                                            containerCarrinhoRecordList,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    StreamBuilder<List<CupomRecord>>(
                                      stream: queryCupomRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (cupomRecord) =>
                                            cupomRecord
                                                .where(
                                                  'status',
                                                  isEqualTo: 'disponivel',
                                                )
                                                .where(
                                                  'tipo_cupom',
                                                  isEqualTo: '50%OFF',
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 26.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CupomRecord>
                                            containerCupomRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerCupomRecord =
                                            containerCupomRecordList.isNotEmpty
                                                ? containerCupomRecordList.first
                                                : null;

                                        return Container(
                                          width: double.infinity,
                                          height: 138.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child:
                                              StreamBuilder<List<CupomRecord>>(
                                            stream: queryCupomRecord(
                                              parent: currentUserReference,
                                              queryBuilder: (cupomRecord) =>
                                                  cupomRecord.where(
                                                'tipo_cupom',
                                                isEqualTo: '50%OFF',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 26.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CupomRecord>
                                                  containerCupomRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    if (containerCupomRecordList
                                                            .length >=
                                                        2)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      18.0,
                                                                      0.0,
                                                                      18.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFE1E1E1),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(9.0),
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
                                                          if (FFAppState()
                                                                  .cupomSelecionadoRef ==
                                                              containerCupomRecord
                                                                  .reference) {
                                                            FFAppState()
                                                                    .cupomSelecionadoRef =
                                                                null;
                                                            FFAppState()
                                                                    .freteantes =
                                                                0.0;
                                                            safeSetState(() {});
                                                            await actions
                                                                .calcularFrete2(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.enderecoCompleto,
                                                                  ''),
                                                            );
                                                            FFAppState()
                                                                    .gerarICSM =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState()
                                                                    .cupomSelecionadoRef =
                                                                containerCupomRecord
                                                                    .reference;
                                                            safeSetState(() {});
                                                            await actions
                                                                .freteantess(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                            );
                                                            await actions
                                                                .freteCupomNovo(
                                                              widget
                                                                  .queryCarrinhoList!
                                                                  .toList(),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.enderecoCompleto,
                                                                  ''),
                                                              containerCupomRecord
                                                                  .valor,
                                                              containerCupomRecord
                                                                  .nome,
                                                            );
                                                            FFAppState()
                                                                    .gerarICSM =
                                                                false;
                                                            safeSetState(() {});
                                                          }
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
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          28.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
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
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 7.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x98E1E1E1),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Ainda_no_Existem_Pedidos_(22).png',
                                                                          width:
                                                                              56.0,
                                                                          height:
                                                                              56.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                              child: Text(
                                                                                'TODAS AS LOJAS',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF3E3E3E),
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                3.0),
                                                                            child:
                                                                                Text(
                                                                              containerCupomRecord!.nome,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF3E3E3E),
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'confira condições',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF3E3E3E),
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
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
                                                                            'Termina em ${functions.cupomData(containerCupomRecord.data!)} dias',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              0.0,
                                                                              3.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                1.0,
                                                                            height:
                                                                                8.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFDDDDDD),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
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
                                                                            'Condições',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF1B88E3),
                                                                                  fontSize: 9.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                2.0),
                                                                            child:
                                                                                Container(
                                                                              width: 18.0,
                                                                              height: 18.0,
                                                                              decoration: BoxDecoration(
                                                                                color: valueOrDefault<Color>(
                                                                                  FFAppState().cupomSelecionadoRef == containerCupomRecord.reference ? FlutterFlowTheme.of(context).primary : Color(0xFFD4D4D4),
                                                                                  Color(0xFFD4D4D4),
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(2.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().cupomSelecionadoRef == containerCupomRecord.reference ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      size: 12.0,
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
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    2.0,
                                                                    32.0),
                                                        child: Container(
                                                          width: 13.0,
                                                          height: 13.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    0.0,
                                                                    32.0),
                                                        child: Container(
                                                          width: 13.0,
                                                          height: 13.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE1E1E1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Container(
                                                        width: 9.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Container(
                                                        width: 9.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                      ),
                                                    ),
                                                    if (containerCupomRecordList
                                                            .length >=
                                                        2)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      19.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 17.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFCFFFD6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.9,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'x${containerCupomRecordList.length.toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 50.0, 10.0, 80.0),
                                  child: Text(
                                    '*Exibindo todos os cupons Renda Shop obtidos e disponíveis na sua carteira',
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
                                          color: Color(0xFF9E9F9F),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (FFAppState().cupomSelecionadoRef != null)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 9.0, 0.0, 0.0),
                                    child: Text(
                                      '1 Cupom aplicado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 8.0, 10.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 41.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'OK',
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
                                                        .secondaryBackground,
                                                fontSize: 17.0,
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
                                ),
                              ],
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
        );
      },
    );
  }
}
