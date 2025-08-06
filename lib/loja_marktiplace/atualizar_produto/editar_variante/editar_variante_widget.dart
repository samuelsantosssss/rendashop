import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja_marktiplace/atualizar_produto/atualizar_foto_variente/atualizar_foto_variente_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editar_variante_model.dart';
export 'editar_variante_model.dart';

class EditarVarianteWidget extends StatefulWidget {
  const EditarVarianteWidget({
    super.key,
    required this.varianteRef,
    required this.produtoRef,
  });

  final DocumentReference? varianteRef;
  final DocumentReference? produtoRef;

  @override
  State<EditarVarianteWidget> createState() => _EditarVarianteWidgetState();
}

class _EditarVarianteWidgetState extends State<EditarVarianteWidget> {
  late EditarVarianteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarVarianteModel());

    _model.preco12FocusNode ??= FocusNode();

    _model.estoque12FocusNode ??= FocusNode();

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
          alignment: AlignmentDirectional(0.0, 0.0),
          child: StreamBuilder<VarianteRecord>(
            stream: VarianteRecord.getDocument(widget!.varianteRef!),
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

              final opcao1VarianteRecord = snapshot.data!;

              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: StreamBuilder<ProdutoRecord>(
                  stream: ProdutoRecord.getDocument(widget!.produtoRef!),
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

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (opcao1VarianteRecord.foto != null &&
                                opcao1VarianteRecord.foto != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
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
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: AtualizarFotoVarienteWidget(
                                            produtoRef: widget!.produtoRef!,
                                            varianteRef:
                                                opcao1VarianteRecord.reference,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        () {
                                          if (FFAppState().imgUpdateVariante !=
                                                  null &&
                                              FFAppState().imgUpdateVariante !=
                                                  '') {
                                            return FFAppState()
                                                .imgUpdateVariante;
                                          } else if (FFAppState()
                                                      .imgUpdateVariante2 !=
                                                  null &&
                                              FFAppState().imgUpdateVariante2 !=
                                                  '') {
                                            return FFAppState()
                                                .imgUpdateVariante2;
                                          } else {
                                            return valueOrDefault<String>(
                                              opcao1VarianteRecord.foto,
                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(9)%20(1).png?alt=media&token=f8f6139c-4087-4ce6-842c-09bd2f4bf7c8',
                                            );
                                          }
                                        }(),
                                        'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(9)%20(1).png?alt=media&token=f8f6139c-4087-4ce6-842c-09bd2f4bf7c8',
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${opcao1VarianteRecord.opcaoTitulo1}${opcao1VarianteRecord.opcaoTitulo2 != null && opcao1VarianteRecord.opcaoTitulo2 != '' ? ', ' : ''}${opcao1VarianteRecord.opcaoTitulo2 != null && opcao1VarianteRecord.opcaoTitulo2 != '' ? opcao1VarianteRecord.opcaoTitulo2 : ''}',
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
                                      fontSize: 13.0,
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
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().imgUpdateVariante = '';
                                      FFAppState().imgUpdateVariante2 = '';
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Preço',
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
                                                      .secondaryText,
                                                  fontSize: 11.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                                _model.preco12TextController ??=
                                                    TextEditingController(
                                              text:
                                                  functions.valorDoubleEmString(
                                                      opcao1VarianteRecord
                                                          .preco),
                                            ),
                                            focusNode: _model.preco12FocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.preco12TextController',
                                              Duration(milliseconds: 0),
                                              () async {
                                                safeSetState(() {
                                                  _model.preco12TextController
                                                          ?.text =
                                                      functions
                                                          .formatToBrazilianCurrency(
                                                              _model
                                                                  .preco12TextController
                                                                  .text);
                                                  _model.preco12FocusNode
                                                      ?.requestFocus();
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    _model.preco12TextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                      offset: _model
                                                          .preco12TextController!
                                                          .text
                                                          .length,
                                                    );
                                                  });
                                                });
                                                FFAppState().opcao12preco =
                                                    _model.preco12TextController
                                                        .text;
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              hintText: 'R\$',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF75787A),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
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
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .preco12TextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.45,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Estoque',
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 11.0,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model
                                                      .estoque12TextController ??=
                                                  TextEditingController(
                                                text: opcao1VarianteRecord
                                                    .estoque
                                                    .toString(),
                                              ),
                                              focusNode:
                                                  _model.estoque12FocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF75787A),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
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
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .estoque12TextControllerValidator
                                                  .asValidator(context),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 10.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;

                              await widget!.varianteRef!
                                  .update(createVarianteRecordData(
                                estoque: int.tryParse(
                                    _model.estoque12TextController.text),
                                preco: functions.dinheiroStringemDouble(
                                    _model.preco12TextController.text),
                              ));
                              _model.listVariante2 =
                                  await queryVarianteRecordOnce(
                                parent: widget!.produtoRef,
                              );
                              _shouldSetState = true;

                              await widget!.produtoRef!
                                  .update(createProdutoRecordData(
                                menorPrecoRevenda: functions.menorValorVatiente(
                                    _model.listVariante2!.toList()),
                                ultimaAtualizacao: getCurrentTimestamp,
                              ));
                              if (FFAppState().imgUpdateVariante != null &&
                                  FFAppState().imgUpdateVariante != '') {
                                await widget!.produtoRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'imagens': FieldValue.arrayUnion(
                                          [FFAppState().imgUpdateVariante]),
                                    },
                                  ),
                                });
                                _model.respostaQuery =
                                    await queryVarianteRecordOnce(
                                  parent: widget!.produtoRef,
                                  queryBuilder: (varianteRecord) =>
                                      varianteRecord.where(
                                    'foto',
                                    isEqualTo: opcao1VarianteRecord.foto,
                                  ),
                                );
                                _shouldSetState = true;
                                if (_model.respostaQuery!.length >= 2) {
                                  await widget!.produtoRef!.update({
                                    ...mapToFirestore(
                                      {
                                        'variante_imgList':
                                            FieldValue.arrayUnion([
                                          FFAppState().imgUpdateVariante
                                        ]),
                                      },
                                    ),
                                  });

                                  await opcao1VarianteRecord.reference
                                      .update(createVarianteRecordData(
                                    foto: FFAppState().imgUpdateVariante,
                                  ));
                                  FFAppState().imgUpdateVariante = '';
                                  FFAppState().imgUpdateVariante2 = '';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  await widget!.produtoRef!.update({
                                    ...mapToFirestore(
                                      {
                                        'variante_imgList':
                                            functions.updateImagemVariante(
                                                columnProdutoRecord
                                                    .varianteImgList
                                                    .toList(),
                                                opcao1VarianteRecord.foto),
                                      },
                                    ),
                                  });

                                  await columnProdutoRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'variante_imgList':
                                            FieldValue.arrayUnion([
                                          FFAppState().imgUpdateVariante
                                        ]),
                                      },
                                    ),
                                  });

                                  await opcao1VarianteRecord.reference
                                      .update(createVarianteRecordData(
                                    foto: FFAppState().imgUpdateVariante,
                                  ));
                                  FFAppState().imgUpdateVariante = '';
                                  FFAppState().imgUpdateVariante2 = '';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                if (FFAppState().imgUpdateVariante2 != null &&
                                    FFAppState().imgUpdateVariante2 != '') {
                                  _model.respostaQuery2 =
                                      await queryVarianteRecordOnce(
                                    parent: widget!.produtoRef,
                                    queryBuilder: (varianteRecord) =>
                                        varianteRecord.where(
                                      'foto',
                                      isEqualTo: opcao1VarianteRecord.foto,
                                    ),
                                  );
                                  _shouldSetState = true;
                                  if (_model.respostaQuery2!.length >= 2) {
                                    await widget!.produtoRef!.update({
                                      ...mapToFirestore(
                                        {
                                          'variante_imgList':
                                              FieldValue.arrayUnion([
                                            FFAppState().imgUpdateVariante2
                                          ]),
                                        },
                                      ),
                                    });

                                    await opcao1VarianteRecord.reference
                                        .update(createVarianteRecordData(
                                      foto: FFAppState().imgUpdateVariante2,
                                    ));
                                    FFAppState().imgUpdateVariante = '';
                                    FFAppState().imgUpdateVariante2 = '';
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    await columnProdutoRecord.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'variante_imgList':
                                              functions.updateImagemVariante(
                                                  columnProdutoRecord
                                                      .varianteImgList
                                                      .toList(),
                                                  opcao1VarianteRecord.foto),
                                        },
                                      ),
                                    });

                                    await columnProdutoRecord.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'variante_imgList':
                                              FieldValue.arrayUnion([
                                            FFAppState().imgUpdateVariante2
                                          ]),
                                        },
                                      ),
                                    });

                                    await opcao1VarianteRecord.reference
                                        .update(createVarianteRecordData(
                                      foto: FFAppState().imgUpdateVariante2,
                                    ));
                                    FFAppState().imgUpdateVariante = '';
                                    FFAppState().imgUpdateVariante2 = '';
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  Navigator.pop(context);
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'Atualizar variante',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
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
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
