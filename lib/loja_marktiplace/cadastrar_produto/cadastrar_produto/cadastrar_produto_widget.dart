import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/loja_marktiplace/capsula_variacao_cadastro/capsula_variacao_cadastro_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cadastrar_produto_model.dart';
export 'cadastrar_produto_model.dart';

class CadastrarProdutoWidget extends StatefulWidget {
  const CadastrarProdutoWidget({
    super.key,
    required this.lojaRef,
  });

  final DocumentReference? lojaRef;

  static String routeName = 'Cadastrar_produto';
  static String routePath = '/cadastrarProduto';

  @override
  State<CadastrarProdutoWidget> createState() => _CadastrarProdutoWidgetState();
}

class _CadastrarProdutoWidgetState extends State<CadastrarProdutoWidget> {
  late CadastrarProdutoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastrarProdutoModel());

    _model.nomeProdutoTextController ??=
        TextEditingController(text: FFAppState().tituloProduto);
    _model.nomeProdutoFocusNode ??= FocusNode();

    _model.descricaoTextController ??=
        TextEditingController(text: FFAppState().descicaoProduto);
    _model.descricaoFocusNode ??= FocusNode();

    _model.descricao333TextController ??=
        TextEditingController(text: FFAppState().palavraChaveProduto);
    _model.descricao333FocusNode ??= FocusNode();

    _model.precoantesTextController ??= TextEditingController();
    _model.precoantesFocusNode ??= FocusNode();

    _model.precoTextController ??= TextEditingController();
    _model.precoFocusNode ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.freteSpTextController ??= TextEditingController();
    _model.freteSpFocusNode ??= FocusNode();

    _model.freteRgTextController ??= TextEditingController();
    _model.freteRgFocusNode ??= FocusNode();

    _model.switchValue1 = true;
    _model.switchValue2 = false;
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF4E5152),
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Adicionar Produto',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF4E5152),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 10.0),
                                child: Container(
                                  width: 66.0,
                                  height: 61.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Adicionar foto',
                                          textAlign: TextAlign.center,
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
                                                        .tertiary,
                                                fontSize: 11.0,
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
                                      FFButtonWidget(
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMedia(
                                            maxWidth: 1080.00,
                                            imageQuality: 80,
                                            mediaSource:
                                                MediaSource.photoGallery,
                                            multiImage: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadData33f4556 =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading_uploadData33f4556 =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFiles_uploadData33f4556 =
                                                    selectedUploadedFiles;
                                                _model.uploadedFileUrls_uploadData33f4556 =
                                                    downloadUrls;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if ((_model
                                                  .uploadedFileUrls_uploadData33f4556
                                                  .isNotEmpty) ==
                                              true) {
                                            FFAppState().fotoProduto = functions
                                                .atualizarImagem(
                                                    FFAppState()
                                                        .fotoProduto
                                                        .toList(),
                                                    _model
                                                        .uploadedFileUrls_uploadData33f4556
                                                        .toList())
                                                .toList()
                                                .cast<String>();
                                            safeSetState(() {});
                                          }
                                        },
                                        text: '',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: double.infinity,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0x00FFFFFF),
                                          textStyle: FlutterFlowTheme.of(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 12.0,
                                                letterSpacing: 1.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                                lineHeight: 2.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.75,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final fotoList =
                                      FFAppState().fotoProduto.toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(fotoList.length,
                                          (fotoListIndex) {
                                        final fotoListItem =
                                            fotoList[fotoListIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onLongPress: () async {
                                                FFAppState().editarCapa = true;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 91.7,
                                                height: 81.0,
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    7.0,
                                                                    0.0,
                                                                    7.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    fotoListItem,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag:
                                                                      fotoListItem,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: fotoListItem,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              child:
                                                                  Image.network(
                                                                fotoListItem,
                                                                width: 66.0,
                                                                height: 300.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    7.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .removeFromFotoProduto(
                                                                    fotoListItem);
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 17.0,
                                                            height: 17.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFA1A2A3),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Icon(
                                                                Icons.close,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 10.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (fotoListIndex == 0)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      13.0,
                                                                      0.0,
                                                                      13.0,
                                                                      7.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 16.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x8014181B),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'Foto de capa',
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          8.0,
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
                                                      ),
                                                    if (FFAppState().editarCapa)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      3.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(49).png?alt=media&token=2ca6821e-f1b5-48eb-8a72-b39eb4e07fbd',
                                                              width: 11.0,
                                                              height: 11.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if ((fotoListIndex != 0) &&
                                                        FFAppState().editarCapa)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(50).png?alt=media&token=25320d9b-cb01-44e4-9aba-5e687b126575',
                                                              width: 11.0,
                                                              height: 11.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState().editarCapa)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: InkWell(
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
                                                                .posicaoFoto(
                                                              fotoListIndex,
                                                              'cima',
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 22.5,
                                                            height: 36.7,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState().editarCapa)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: InkWell(
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
                                                                .posicaoFoto(
                                                              fotoListIndex,
                                                              'baixo',
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 21.5,
                                                            height: 36.7,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if ((FFAppState().fotoProduto.isNotEmpty) == true)
                Container(
                  width: double.infinity,
                  height: 193.29,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 75.59,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                safeSetState(() {
                                  _model.checkbox1Value = true;
                                });
                                safeSetState(() {
                                  _model.checkbox2Value = false;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 71.5,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 3.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                                child: Image.network(
                                                  FFAppState()
                                                      .fotoProduto
                                                      .firstOrNull!,
                                                  width: 52.0,
                                                  height: 53.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(48).png?alt=media&token=3bc4efdf-ebfb-4672-aa37-b1a44dd9aa9e',
                                              width: 300.0,
                                              height: 300.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 60.0, 0.0, 0.0),
                                              child: Container(
                                                width: 15.0,
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 66.0, 0.0, 0.0),
                                              child: Container(
                                                width: 36.0,
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 75.0, 0.0, 0.0),
                                              child: Container(
                                                width: 10.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      23.0, 75.0, 0.0, 0.0),
                                              child: Container(
                                                width: 10.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      37.0, 75.0, 0.0, 0.0),
                                              child: Container(
                                                width: 10.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 91.0, 0.0, 0.0),
                                              child: Container(
                                                width: 30.0,
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 101.0, 0.0, 0.0),
                                              child: Container(
                                                width: 47.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkbox1Value ??= true,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                .checkbox1Value = newValue!);
                                            if (newValue!) {
                                              safeSetState(() {
                                                _model.checkbox2Value = false;
                                              });
                                            } else {
                                              safeSetState(() {
                                                _model.checkbox2Value = true;
                                              });
                                            }
                                          },
                                          side: (FlutterFlowTheme.of(context)
                                                      .alternate !=
                                                  null)
                                              ? BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                )
                                              : null,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Text(
                                        'Margem 1:1',
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
                                              fontSize: 13.0,
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
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                safeSetState(() {
                                  _model.checkbox1Value = false;
                                });
                                safeSetState(() {
                                  _model.checkbox2Value = true;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 71.5,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 3.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                                child: Image.network(
                                                  FFAppState()
                                                      .fotoProduto
                                                      .firstOrNull!,
                                                  width: 52.0,
                                                  height: 68.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(48).png?alt=media&token=3bc4efdf-ebfb-4672-aa37-b1a44dd9aa9e',
                                              width: 300.0,
                                              height: 300.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 79.0, 0.0, 0.0),
                                              child: Container(
                                                width: 15.0,
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 88.0, 0.0, 0.0),
                                              child: Container(
                                                width: 36.0,
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 99.0, 0.0, 0.0),
                                              child: Container(
                                                width: 10.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      23.0, 99.0, 0.0, 0.0),
                                              child: Container(
                                                width: 10.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      37.0, 99.0, 0.0, 0.0),
                                              child: Container(
                                                width: 10.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA1A1A1),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      Color(0xFFA1A1A1)
                                                    ],
                                                    stops: [0.0, 1.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkbox2Value ??=
                                              false,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                .checkbox2Value = newValue!);
                                            if (newValue!) {
                                              safeSetState(() {
                                                _model.checkbox1Value = false;
                                              });
                                            } else {
                                              safeSetState(() {
                                                _model.checkbox1Value = true;
                                              });
                                            }
                                          },
                                          side: (FlutterFlowTheme.of(context)
                                                      .alternate !=
                                                  null)
                                              ? BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                )
                                              : null,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Text(
                                        'Margem 3:4',
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
                                              fontSize: 13.0,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    height: 86.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: 66.0,
                              height: 76.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Adicionar Video',
                                      textAlign: TextAlign.center,
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
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 11.0,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 7.0, 0.0, 6.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final selectedMedia = await selectMedia(
                                          isVideo: true,
                                          mediaSource: MediaSource.videoGallery,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadData33f4455 =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_uploadData33f4455 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadData33f4455 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_uploadData33f4455 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState().videoProduto = _model
                                            .uploadedFileUrl_uploadData33f4455;
                                        safeSetState(() {});
                                      },
                                      text: '',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00FFFFFF),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 12.0,
                                              letterSpacing: 1.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 2.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_model.uploadedFileUrl_uploadData33f4455 != '')
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: 76.0,
                                      height: 75.0,
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FlutterFlowVideoPlayer(
                                              path: FFAppState().videoProduto,
                                              videoType: VideoType.network,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.528,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.813,
                                              autoPlay: false,
                                              looping: false,
                                              showControls: true,
                                              allowFullScreen: true,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                safeSetState(() {
                                                  _model.isDataUploading_uploadData33f4455 =
                                                      false;
                                                  _model.uploadedLocalFile_uploadData33f4455 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl_uploadData33f4455 =
                                                      '';
                                                });
                                              },
                                              child: Container(
                                                width: 17.0,
                                                height: 17.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFA1A2A3),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 10.0,
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
                              ],
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
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Nome do Produto',
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
                                          fontSize: 13.0,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '*',
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
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 13.0,
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
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.nomeProdutoTextController,
                                focusNode: _model.nomeProdutoFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.nomeProdutoTextController',
                                  Duration(milliseconds: 0),
                                  () async {
                                    FFAppState().tituloProduto =
                                        _model.nomeProdutoTextController.text;
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  alignLabelWithHint: true,
                                  hintText: 'Digite o Nome do Produto',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  counterStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                maxLength: 120,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                cursorColor: Color(0xFFC1C2C5),
                                validator: _model
                                    .nomeProdutoTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.none),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Descrição do Produto',
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '*',
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
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 13.0,
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
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.descricaoTextController,
                                focusNode: _model.descricaoFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.descricaoTextController',
                                  Duration(milliseconds: 0),
                                  () async {
                                    FFAppState().descicaoProduto =
                                        _model.descricaoTextController.text;
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  alignLabelWithHint: true,
                                  hintText: 'Digite a Descrição do Produto',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  counterStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                maxLines: 3,
                                maxLength: 5000,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                cursorColor: Color(0xFFC1C2C5),
                                validator: _model
                                    .descricaoTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.none),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Palavras Chave',
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '*',
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
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 13.0,
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
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.descricao333TextController,
                                focusNode: _model.descricao333FocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.descricao333TextController',
                                  Duration(milliseconds: 0),
                                  () async {
                                    FFAppState().palavraChave =
                                        _model.descricao333TextController.text;
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  alignLabelWithHint: true,
                                  hintText:
                                      'Digite as Palavras Chaves do Produto',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  counterStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFC1C2C5),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                maxLines: 4,
                                cursorColor: Color(0xFFC1C2C5),
                                validator: _model
                                    .descricao333TextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.none),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        AdicionarVariante11Widget.routeName,
                        queryParameters: {
                          'lojaRef': serializeParam(
                            widget.lojaRef,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 100.0,
                      height: 39.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 0.0),
                              child: Icon(
                                Icons.auto_awesome_motion,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 19.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  13.0, 13.0, 0.0, 0.0),
                              child: Text(
                                'Variações',
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 29.0, 0.0),
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Color(0x8575787A),
                                  size: 25.0,
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
              if (FFAppState().titulo1 != '')
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
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
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: CapsulaVariacaoCadastroWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        FFAppState().capsulaextra = '2';
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 39.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.fiber_smart_record_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 19.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    13.0, 13.0, 0.0, 0.0),
                                child: Text(
                                  'Cápsula de variações',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 3.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.info_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 17.0,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 29.0, 0.0),
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: Color(0x8575787A),
                                    size: 25.0,
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
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(CadastrarCategoriaWidget.routeName);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                    child: Container(
                      width: 100.0,
                      height: 39.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.listUl,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 19.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  13.0, 13.0, 0.0, 0.0),
                              child: Text(
                                'Categoria',
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
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '*',
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFAppState().categoriasGeral,
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
                                              fontSize: 13.0,
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
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 29.0, 0.0),
                                        child: Icon(
                                          Icons.navigate_next,
                                          color: Color(0x8575787A),
                                          size: 25.0,
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
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    height: 39.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: Icon(
                              Icons.attach_money,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 19.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 0.0, 0.0),
                            child: Text(
                              'Preço antes',
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
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: TextFormField(
                                controller: _model.precoantesTextController,
                                focusNode: _model.precoantesFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.precoantesTextController',
                                  Duration(milliseconds: 0),
                                  () async {
                                    safeSetState(() {
                                      _model.precoantesTextController?.text =
                                          functions.formatToBrazilianCurrency(
                                              _model.precoantesTextController
                                                  .text);
                                      _model.precoantesFocusNode
                                          ?.requestFocus();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        _model.precoantesTextController
                                                ?.selection =
                                            TextSelection.collapsed(
                                          offset: _model
                                              .precoantesTextController!
                                              .text
                                              .length,
                                        );
                                      });
                                    });
                                    if (_model.precoantesTextController.text ==
                                        'R\$ 0,00') {
                                      safeSetState(() {
                                        _model.precoantesTextController
                                            ?.clear();
                                      });
                                    }
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  hintText: 'R\$0,00',
                                  hintStyle: FlutterFlowTheme.of(context)
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
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
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                textAlign: TextAlign.center,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .precoantesTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
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
              if (FFAppState().titulo1 == '')
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                    child: Container(
                      width: 100.0,
                      height: 39.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 0.0),
                              child: Icon(
                                Icons.attach_money,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 19.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  13.0, 13.0, 0.0, 0.0),
                              child: Text(
                                'Preço',
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
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '*',
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                child: TextFormField(
                                  controller: _model.precoTextController,
                                  focusNode: _model.precoFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.precoTextController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      safeSetState(() {
                                        _model.precoTextController?.text =
                                            functions.formatToBrazilianCurrency(
                                                _model
                                                    .precoTextController.text);
                                        _model.precoFocusNode?.requestFocus();
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          _model.precoTextController
                                                  ?.selection =
                                              TextSelection.collapsed(
                                            offset: _model.precoTextController!
                                                .text.length,
                                          );
                                        });
                                      });
                                      if (FFAppState().titulo1 != '') {
                                        safeSetState(() {
                                          _model.precoTextController?.clear();
                                        });
                                      }
                                      if (_model.precoTextController.text ==
                                          'R\$ 0,00') {
                                        safeSetState(() {
                                          _model.precoTextController?.clear();
                                        });
                                      }
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText: 'R\$0,00',
                                    hintStyle: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
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
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  textAlign: TextAlign.center,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.precoTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
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
              if (FFAppState().titulo1 == '')
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                    child: Container(
                      width: 100.0,
                      height: 39.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 0.0),
                              child: Icon(
                                Icons.attach_money,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 19.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  13.0, 13.0, 0.0, 0.0),
                              child: Text(
                                'Comissão afiliado',
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
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '*',
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 10.0, 0.0, 0.0),
                              child: Icon(
                                Icons.info_outline,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 17.0,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (FFAppState()
                                                      .comissaoAfiliadooo !=
                                                  1) {
                                                FFAppState()
                                                        .comissaoAfiliadooo =
                                                    FFAppState()
                                                            .comissaoAfiliadooo +
                                                        -1;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              width: 25.0,
                                              height: 26.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF9F8F8),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: Color(0x5ECBCDCE),
                                                  width: 1.0,
                                                ),
                                              ),
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  1.0),
                                                      child: Text(
                                                        '-',
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
                                                              color: Color(
                                                                  0xFF787878),
                                                              fontSize: 20.0,
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 26.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0x5ECBCDCE),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 1.0),
                                                    child: Text(
                                                      'R\$${FFAppState().comissaoAfiliadooo.toString()},00',
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
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState().comissaoAfiliadooo ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                            ),
                                                            fontSize: 14.0,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().comissaoAfiliadooo =
                                                FFAppState()
                                                        .comissaoAfiliadooo +
                                                    1;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 25.0,
                                            height: 26.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF9F8F8),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 1.0),
                                                    child: Text(
                                                      '+',
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
                                                                color: Color(
                                                                    0xFF787878),
                                                                fontSize: 20.0,
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
                                      ],
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
              if (FFAppState().titulo1 == '')
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                    child: Container(
                      width: 100.0,
                      height: 39.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.dolly,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 19.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  13.0, 13.0, 0.0, 0.0),
                              child: Text(
                                'Estoque',
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
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '*',
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                child: TextFormField(
                                  controller: _model.textController6,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText: '0',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController6Validator
                                      .asValidator(context),
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
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    height: 39.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.truck,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 19.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 0.0, 0.0),
                            child: Text(
                              'Frete SP',
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 15.0, 0.0, 0.0),
                            child: Text(
                              '(peso/Tamanho)',
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 11.0,
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 12.0, 0.0, 0.0),
                            child: Text(
                              '*',
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: 163.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.freteSpTextController,
                                          focusNode: _model.freteSpFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.freteSpTextController',
                                            Duration(milliseconds: 0),
                                            () async {
                                              safeSetState(() {
                                                _model.freteSpTextController
                                                        ?.text =
                                                    functions
                                                        .formatToBrazilianCurrency(
                                                            _model
                                                                .freteSpTextController
                                                                .text);
                                                _model.freteSpFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.freteSpTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .freteSpTextController!
                                                        .text
                                                        .length,
                                                  );
                                                });
                                              });
                                              FFAppState().fretesp =
                                                  FFAppState().fretesp;
                                              safeSetState(() {});
                                              if (FFAppState().fretesp ==
                                                  'R\$ 0,00') {
                                                safeSetState(() {
                                                  _model.freteSpTextController
                                                      ?.clear();
                                                });
                                              }
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            hintText: 'R\$0,00',
                                            hintStyle:
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          textAlign: TextAlign.center,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .freteSpTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
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
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    height: 39.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.truck,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 19.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 0.0, 0.0),
                            child: Text(
                              'Frete RJ',
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 15.0, 0.0, 0.0),
                            child: Text(
                              '(peso/Tamanho)',
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 11.0,
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 12.0, 0.0, 0.0),
                            child: Text(
                              '*',
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: 163.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.freteRgTextController,
                                          focusNode: _model.freteRgFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.freteRgTextController',
                                            Duration(milliseconds: 0),
                                            () async {
                                              safeSetState(() {
                                                _model.freteRgTextController
                                                        ?.text =
                                                    functions
                                                        .formatToBrazilianCurrency(
                                                            _model
                                                                .freteRgTextController
                                                                .text);
                                                _model.freteRgFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.freteRgTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .freteRgTextController!
                                                        .text
                                                        .length,
                                                  );
                                                });
                                              });

                                              safeSetState(() {});
                                              if (_model.freteRgTextController
                                                      .text ==
                                                  'R\$ 0,00') {
                                                safeSetState(() {
                                                  _model.freteRgTextController
                                                      ?.clear();
                                                });
                                              }
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            hintText: 'R\$0,00',
                                            hintStyle:
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          textAlign: TextAlign.center,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .freteRgTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
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
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    height: 39.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.truck,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 19.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 0.0, 0.0),
                            child: Text(
                              'Envio Nascional',
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 12.0, 0.0, 0.0),
                            child: Text(
                              '*',
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: 163.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Switch.adaptive(
                                    value: _model.switchValue1!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue1 = newValue);
                                    },
                                    activeColor: Colors.white,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).primary,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    height: 39.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.truck,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 19.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 0.0, 0.0),
                            child: Text(
                              'Frete Rapido',
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
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: 163.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Switch.adaptive(
                                    value: _model.switchValue2!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue2 = newValue);
                                    },
                                    activeColor: Colors.white,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).primary,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    height: 39.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: Icon(
                              Icons.info_outline,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 19.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 0.0, 0.0),
                            child: Text(
                              'Condição',
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
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: 163.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 27.0, 0.0),
                                      child: Text(
                                        'Novo',
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
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3.0, 0.0, 29.0, 0.0),
                                      child: Icon(
                                        Icons.navigate_next,
                                        color: Color(0x8575787A),
                                        size: 25.0,
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 94.0,
                    height: 81.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            _model.saidaImg = await actions.imsgLisEmUpload(
                              FFAppState().fotoProduto.toList(),
                            );
                            _shouldSetState = true;
                            for (int loop1Index = 0;
                                loop1Index < _model.saidaImg!.length;
                                loop1Index++) {
                              final currentLoop1Item =
                                  _model.saidaImg![loop1Index];
                              _model.apiResult4cb =
                                  await UploadToCloudinaryCall.call(
                                file: currentLoop1Item,
                                uploadPreset: 'rendashop_images',
                              );

                              _shouldSetState = true;
                              FFAppState().addToImgListTeste(functions
                                  .buildWebpUrl(UploadToCloudinaryCall.publicId(
                                (_model.apiResult4cb?.jsonBody ?? ''),
                              )!));
                              safeSetState(() {});
                            }

                            var produtoRecordReference =
                                ProdutoRecord.collection.doc();
                            await produtoRecordReference.set({
                              ...createProdutoRecordData(
                                nome: FFAppState().tituloProduto,
                                descricao: FFAppState().descicaoProduto,
                                lojaRef: currentUserDocument?.lojaRef,
                                precoAntes: functions.dinheiroStringemDouble(
                                    _model.precoantesTextController.text),
                                video: FFAppState().videoProduto,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                freteSP: functions.dinheiroStringemDouble(
                                    _model.freteSpTextController.text),
                                envioNaciona: _model.switchValue1,
                                lider1: FFAppState().lider1,
                                lider2: FFAppState().lider2,
                                lider3: FFAppState().lider3,
                                lider4: FFAppState().lider4,
                                data: getCurrentTimestamp,
                                vendas: 0,
                                freteRapido: _model.switchValue2,
                                comissaoAfiliado:
                                    FFAppState().comissaoAfiliadooo,
                                freteRJ: functions.dinheiroStringemDouble(
                                    _model.freteRgTextController.text),
                                categoria: functions.categoria(
                                    FFAppState().lider1,
                                    FFAppState().lider2,
                                    FFAppState().lider3,
                                    FFAppState().lider4),
                                margem: valueOrDefault<String>(
                                  _model.checkbox1Value == true
                                      ? 'feed'
                                      : 'story',
                                  'story',
                                ),
                                ultimaAtualizacao: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'imagens': FFAppState().imgListTeste,
                                  'variante_imgList': functions.imageList(
                                      FFAppState().foto1titulo1,
                                      FFAppState().foto2titulo1,
                                      FFAppState().foto3titulo1,
                                      FFAppState().foto4titulo1,
                                      FFAppState().foto5titulo1,
                                      FFAppState().foto6titulo1,
                                      FFAppState().foto7titulo1,
                                      FFAppState().foto8titulo1,
                                      FFAppState().foto9titulo1,
                                      FFAppState().foto10titulo1),
                                  'variante_titulo1List':
                                      functions.titulo2opcaoList(
                                          FFAppState().opcao1titulo1,
                                          FFAppState().opcao2titulo1,
                                          FFAppState().opcao3titulo1,
                                          FFAppState().opcao4titulo1,
                                          FFAppState().opcao5titulo1,
                                          FFAppState().opcao6titulo1,
                                          FFAppState().opcao7titulo1,
                                          FFAppState().opcao8titulo1,
                                          FFAppState().opcao9titulo1,
                                          FFAppState().opcao10titulo1),
                                  'variante_titulo2List':
                                      functions.titulo2opcaoList(
                                          FFAppState().opcao1titulo2,
                                          FFAppState().opcao2titulo2,
                                          FFAppState().opcao3titulo2,
                                          FFAppState().opcao4titulo2,
                                          FFAppState().opcao5titulo2,
                                          FFAppState().opcao6titulo2,
                                          FFAppState().opcao7titulo2,
                                          FFAppState().opcao8titulo2,
                                          FFAppState().opcao9titulo2,
                                          FFAppState().opcao10titulo2),
                                  'listFrete': functions.calcularfretee(
                                      functions.dinheiroStringemDouble(
                                          _model.freteRgTextController.text),
                                      functions.dinheiroStringemDouble(
                                          _model.freteSpTextController.text)),
                                  'palavras_chaveList': functions.palavrachave(
                                      _model.descricao333TextController.text),
                                },
                              ),
                            });
                            _model.produtoCriado =
                                ProdutoRecord.getDocumentFromData({
                              ...createProdutoRecordData(
                                nome: FFAppState().tituloProduto,
                                descricao: FFAppState().descicaoProduto,
                                lojaRef: currentUserDocument?.lojaRef,
                                precoAntes: functions.dinheiroStringemDouble(
                                    _model.precoantesTextController.text),
                                video: FFAppState().videoProduto,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                freteSP: functions.dinheiroStringemDouble(
                                    _model.freteSpTextController.text),
                                envioNaciona: _model.switchValue1,
                                lider1: FFAppState().lider1,
                                lider2: FFAppState().lider2,
                                lider3: FFAppState().lider3,
                                lider4: FFAppState().lider4,
                                data: getCurrentTimestamp,
                                vendas: 0,
                                freteRapido: _model.switchValue2,
                                comissaoAfiliado:
                                    FFAppState().comissaoAfiliadooo,
                                freteRJ: functions.dinheiroStringemDouble(
                                    _model.freteRgTextController.text),
                                categoria: functions.categoria(
                                    FFAppState().lider1,
                                    FFAppState().lider2,
                                    FFAppState().lider3,
                                    FFAppState().lider4),
                                margem: valueOrDefault<String>(
                                  _model.checkbox1Value == true
                                      ? 'feed'
                                      : 'story',
                                  'story',
                                ),
                                ultimaAtualizacao: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'imagens': FFAppState().imgListTeste,
                                  'variante_imgList': functions.imageList(
                                      FFAppState().foto1titulo1,
                                      FFAppState().foto2titulo1,
                                      FFAppState().foto3titulo1,
                                      FFAppState().foto4titulo1,
                                      FFAppState().foto5titulo1,
                                      FFAppState().foto6titulo1,
                                      FFAppState().foto7titulo1,
                                      FFAppState().foto8titulo1,
                                      FFAppState().foto9titulo1,
                                      FFAppState().foto10titulo1),
                                  'variante_titulo1List':
                                      functions.titulo2opcaoList(
                                          FFAppState().opcao1titulo1,
                                          FFAppState().opcao2titulo1,
                                          FFAppState().opcao3titulo1,
                                          FFAppState().opcao4titulo1,
                                          FFAppState().opcao5titulo1,
                                          FFAppState().opcao6titulo1,
                                          FFAppState().opcao7titulo1,
                                          FFAppState().opcao8titulo1,
                                          FFAppState().opcao9titulo1,
                                          FFAppState().opcao10titulo1),
                                  'variante_titulo2List':
                                      functions.titulo2opcaoList(
                                          FFAppState().opcao1titulo2,
                                          FFAppState().opcao2titulo2,
                                          FFAppState().opcao3titulo2,
                                          FFAppState().opcao4titulo2,
                                          FFAppState().opcao5titulo2,
                                          FFAppState().opcao6titulo2,
                                          FFAppState().opcao7titulo2,
                                          FFAppState().opcao8titulo2,
                                          FFAppState().opcao9titulo2,
                                          FFAppState().opcao10titulo2),
                                  'listFrete': functions.calcularfretee(
                                      functions.dinheiroStringemDouble(
                                          _model.freteRgTextController.text),
                                      functions.dinheiroStringemDouble(
                                          _model.freteSpTextController.text)),
                                  'palavras_chaveList': functions.palavrachave(
                                      _model.descricao333TextController.text),
                                },
                              ),
                            }, produtoRecordReference);
                            _shouldSetState = true;
                            if (FFAppState().titulo1 != '') {
                              if (FFAppState().capsula1 != '') {
                                await _model.produtoCriado!.reference
                                    .update(createProdutoRecordData(
                                  capsula1: FFAppState().capsula1,
                                  capsula2: FFAppState().capsula2,
                                  capsula3: FFAppState().capsula3,
                                  capsulaExtra: FFAppState().capsulaextra,
                                ));
                                FFAppState().capsula1 = '';
                                FFAppState().capsula2 = '';
                                FFAppState().capsula3 = '';
                                FFAppState().capsulaextra = '';
                                safeSetState(() {});
                              }
                            } else {
                              await _model.produtoCriado!.reference
                                  .update(createProdutoRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    _model.precoTextController.text),
                                estoque:
                                    int.tryParse(_model.textController6.text),
                              ));
                            }

                            FFAppState().fotoProduto = [];
                            FFAppState().videoProduto = '';
                            FFAppState().tituloProduto = '';
                            FFAppState().descicaoProduto = '';
                            FFAppState().lider1 = '';
                            FFAppState().lider2 = '';
                            FFAppState().lider3 = '';
                            FFAppState().lider4 = '';
                            FFAppState().palavraChaveProduto = '';
                            FFAppState().imgListTeste = [];
                            FFAppState().categoriasGeral = '';
                            safeSetState(() {});

                            await _model.produtoCriado!.reference
                                .update(createProdutoRecordData(
                              produtoRef: _model.produtoCriado?.reference,
                            ));
                            if (FFAppState().titulo1 != '') {
                              if (FFAppState().titulo2 != '') {
                                if (FFAppState().opcao1preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao1preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao1estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao12preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao12preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao12estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao13preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao13preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao13estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao14preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao14preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao14estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao15preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao15preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao15estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao16preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao16preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao16estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao17preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao17preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao17estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao18preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao18preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao18estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao19preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao19preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao19estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao110preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao110preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao110estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                                if (FFAppState().opcao21preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao21preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao21estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao22preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao22preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao22estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao23preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao23preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao23estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao24preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao24preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao24estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao25preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao25preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao25estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao26preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao26preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao26estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao27preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao27preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao27estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao28preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao28preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao28estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao29preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao29preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao29estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao210preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao210preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao210estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                                if (FFAppState().opcao31preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao31preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao31estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao32preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao32preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao32estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao33preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao33preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao33estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao34preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao34preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao34estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao35preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao35preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao35estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao36preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao36preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao36estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao37preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao37preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao37estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao38preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao38preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao38estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao39preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao39preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao39estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao310preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao310preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao310estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                                if (FFAppState().opcao41preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao41preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao41estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao42preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao42preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao42estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao43preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao43preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao43estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao44preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao44preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao44estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao45preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao45preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao45estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao46preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao46preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao46estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao47preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao47preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao47estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao48preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao48preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao48estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao49preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao49preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao49estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao410preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao410preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao410estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                                if (FFAppState().opcao51preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao51preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao51estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao52preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao52preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao52estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao53preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao53preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao53estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao54preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao54preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao54estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao55preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao55preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao55estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao56preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao56preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao56estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao57preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao57preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao57estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao58preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao58preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao58estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao59preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao59preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao59estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao510preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao510preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao510estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                                if (FFAppState().opcao61preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao61preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao61estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao62preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao62preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao62estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao63preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao63preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao63estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao64preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao64preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao64estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao65preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao65preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao65estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao66preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao66preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao66estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao67preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao67preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao67estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao68preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao68preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao68estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao69preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao69preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao69estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao610preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao610preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao610estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                                if (FFAppState().opcao71preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao71preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao71estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao72preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao72preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao72estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao73preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao73preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao73estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao74preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao74preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao74estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao75preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao75preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao75estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao76preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao76preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao76estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao77preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao77preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao77estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao78preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao78preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao78estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao79preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao79preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao79estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao710preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao710preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao710estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                                if (FFAppState().opcao81preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao81preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao81estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao1titulo2,
                                  ));
                                }
                                if (FFAppState().opcao82preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao82preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao82estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao2titulo2,
                                  ));
                                }
                                if (FFAppState().opcao83preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao83preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao83estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao3titulo2,
                                  ));
                                }
                                if (FFAppState().opcao84preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao84preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao84estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao4titulo2,
                                  ));
                                }
                                if (FFAppState().opcao85preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao85preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao85estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao5titulo2,
                                  ));
                                }
                                if (FFAppState().opcao86preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao86preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao86estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao6titulo2,
                                  ));
                                }
                                if (FFAppState().opcao87preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao87preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao87estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao7titulo2,
                                  ));
                                }
                                if (FFAppState().opcao88preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao88preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao88estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao8titulo2,
                                  ));
                                }
                                if (FFAppState().opcao89preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao89preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao89estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao9titulo2,
                                  ));
                                }
                                if (FFAppState().opcao810preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao810preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao810estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    titulo2: FFAppState().titulo2,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                    opcaoTitulo2: FFAppState().opcao10titulo2,
                                  ));
                                }
                              } else {
                                if (FFAppState().opcao1preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao1preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao1estoque),
                                    foto: FFAppState().foto1titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao1titulo1,
                                  ));
                                }
                                if (FFAppState().opcao12preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao12preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao12estoque),
                                    foto: FFAppState().foto2titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao2titulo1,
                                  ));
                                }
                                if (FFAppState().opcao13preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao13preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao13estoque),
                                    foto: FFAppState().foto3titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao3titulo1,
                                  ));
                                }
                                if (FFAppState().opcao14preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao14preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao14estoque),
                                    foto: FFAppState().foto4titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao4titulo1,
                                  ));
                                }
                                if (FFAppState().opcao15preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao15preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao15estoque),
                                    foto: FFAppState().foto5titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao5titulo1,
                                  ));
                                }
                                if (FFAppState().opcao16preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao16preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao16estoque),
                                    foto: FFAppState().foto6titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao6titulo1,
                                  ));
                                }
                                if (FFAppState().opcao17preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao17preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao17estoque),
                                    foto: FFAppState().foto7titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao7titulo1,
                                  ));
                                }
                                if (FFAppState().opcao18preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao18preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao18estoque),
                                    foto: FFAppState().foto8titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao8titulo1,
                                  ));
                                }
                                if (FFAppState().opcao19preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao19preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao19estoque),
                                    foto: FFAppState().foto9titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao9titulo1,
                                  ));
                                }
                                if (FFAppState().opcao110preco != '') {
                                  await VarianteRecord.createDoc(
                                          _model.produtoCriado!.reference)
                                      .set(createVarianteRecordData(
                                    preco: functions.dinheiroStringemDouble(
                                        FFAppState().opcao110preco),
                                    estoque: functions.stringEmInterger(
                                        FFAppState().opcao110estoque),
                                    foto: FFAppState().foto10titulo1,
                                    titulo1: FFAppState().titulo1,
                                    produtoRef: _model.produtoCriado?.reference,
                                    opcaoTitulo1: FFAppState().opcao10titulo1,
                                  ));
                                }
                                FFAppState().titulo1 = '';
                                FFAppState().titulo2 = '';
                                FFAppState().opcao1titulo1 = '';
                                FFAppState().foto1titulo1 = '';
                                FFAppState().opcao2titulo1 = '';
                                FFAppState().foto2titulo1 = '';
                                FFAppState().fotoAtivoTitulo1 = false;
                                FFAppState().fotoAtivoTitulo2 = false;
                                FFAppState().opcao3titulo1 = '';
                                FFAppState().foto3titulo1 = '';
                                FFAppState().opcao4titulo1 = '';
                                FFAppState().foto4titulo1 = '';
                                FFAppState().opcao5titulo1 = '';
                                FFAppState().foto5titulo1 = '';
                                FFAppState().opcao6titulo1 = '';
                                FFAppState().foto6titulo1 = '';
                                FFAppState().opcao7titulo1 = '';
                                FFAppState().foto7titulo1 = '';
                                FFAppState().opcao8titulo1 = '';
                                FFAppState().foto8titulo1 = '';
                                FFAppState().opcao9titulo1 = '';
                                FFAppState().foto9titulo1 = '';
                                FFAppState().opcao10titulo1 = '';
                                FFAppState().foto10titulo1 = '';
                                FFAppState().opcao1titulo2 = '';
                                FFAppState().opcao2titulo2 = '';
                                FFAppState().opcao3titulo2 = '';
                                FFAppState().opcao4titulo2 = '';
                                FFAppState().opcao5titulo2 = '';
                                FFAppState().opcao6titulo2 = '';
                                FFAppState().opcao7titulo2 = '';
                                FFAppState().opcao8titulo2 = '';
                                FFAppState().opcao9titulo2 = '';
                                FFAppState().opcao10titulo2 = '';
                                FFAppState().opcao1selecionado = false;
                                FFAppState().opcao2selecionado = false;
                                FFAppState().opcao1preco = '';
                                FFAppState().opcao1estoque = '';
                                FFAppState().opcao12preco = '';
                                FFAppState().opcao12estoque = '';
                                FFAppState().opcao13preco = '';
                                FFAppState().opcao13estoque = '';
                                FFAppState().opcao14preco = '';
                                FFAppState().opcao14estoque = '';
                                FFAppState().opcao15preco = '';
                                FFAppState().opcao15estoque = '';
                                FFAppState().opcao16preco = '';
                                FFAppState().opcao16estoque = '';
                                FFAppState().opcao17preco = '';
                                FFAppState().opcao17estoque = '';
                                FFAppState().opcao18preco = '';
                                FFAppState().opcao18estoque = '';
                                FFAppState().opcao19preco = '';
                                FFAppState().opcao19estoque = '';
                                FFAppState().opcao110preco = '';
                                FFAppState().opcao110estoque = '';
                                FFAppState().naoliberar = false;
                                safeSetState(() {});
                                _model.listVariante =
                                    await queryVarianteRecordOnce(
                                  parent: _model.produtoCriado?.reference,
                                );
                                _shouldSetState = true;

                                await _model.produtoCriado!.reference
                                    .update(createProdutoRecordData(
                                  menorPrecoRevenda:
                                      functions.menorValorVatiente(
                                          _model.listVariante!.toList()),
                                ));
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Tudo certo'),
                                      content: Text('Produto criado!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                context.goNamed(
                                  ProdutosWidget.routeName,
                                  queryParameters: {
                                    'lojaref': serializeParam(
                                      widget.lojaRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (FFAppState().opcao91preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao91preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao91estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao1titulo2,
                                ));
                              }
                              if (FFAppState().opcao92preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao92preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao92estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao2titulo2,
                                ));
                              }
                              if (FFAppState().opcao93preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao93preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao93estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao3titulo2,
                                ));
                              }
                              if (FFAppState().opcao94preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao94preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao94estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao4titulo2,
                                ));
                              }
                              if (FFAppState().opcao95preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao95preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao95estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao5titulo2,
                                ));
                              }
                              if (FFAppState().opcao96preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao96preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao96estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao6titulo2,
                                ));
                              }
                              if (FFAppState().opcao97preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao97preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao97estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao7titulo2,
                                ));
                              }
                              if (FFAppState().opcao98preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao98preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao98estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao8titulo2,
                                ));
                              }
                              if (FFAppState().opcao99preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao99preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao99estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao9titulo2,
                                ));
                              }
                              if (FFAppState().opcao910preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao910preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao910estoque),
                                  foto: FFAppState().foto9titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao9titulo1,
                                  opcaoTitulo2: FFAppState().opcao10titulo2,
                                ));
                              }
                              if (FFAppState().opcao101preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao101preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao101estoque),
                                  foto: FFAppState().foto10titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao10titulo1,
                                  opcaoTitulo2: FFAppState().opcao1titulo2,
                                ));
                              }
                              if (FFAppState().opcao102preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao102preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao102estoque),
                                  foto: FFAppState().foto10titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao10titulo1,
                                  opcaoTitulo2: FFAppState().opcao2titulo2,
                                ));
                              }
                              if (FFAppState().opcao103preco != '') {
                                await VarianteRecord.createDoc(
                                        _model.produtoCriado!.reference)
                                    .set(createVarianteRecordData(
                                  preco: functions.dinheiroStringemDouble(
                                      FFAppState().opcao103preco),
                                  estoque: functions.stringEmInterger(
                                      FFAppState().opcao103estoque),
                                  foto: FFAppState().foto10titulo1,
                                  titulo1: FFAppState().titulo1,
                                  titulo2: FFAppState().titulo2,
                                  produtoRef: _model.produtoCriado?.reference,
                                  opcaoTitulo1: FFAppState().opcao10titulo1,
                                  opcaoTitulo2: FFAppState().opcao3titulo2,
                                ));
                              }
                            } else {
                              context.goNamed(
                                ProdutosWidget.routeName,
                                queryParameters: {
                                  'lojaref': serializeParam(
                                    widget.lojaRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }

                            if (FFAppState().opcao104preco != '') {
                              await VarianteRecord.createDoc(
                                      _model.produtoCriado!.reference)
                                  .set(createVarianteRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    FFAppState().opcao104preco),
                                estoque: functions.stringEmInterger(
                                    FFAppState().opcao104estoque),
                                foto: FFAppState().foto10titulo1,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                produtoRef: _model.produtoCriado?.reference,
                                opcaoTitulo1: FFAppState().opcao10titulo1,
                                opcaoTitulo2: FFAppState().opcao4titulo2,
                              ));
                            }
                            if (FFAppState().opcao105preco != '') {
                              await VarianteRecord.createDoc(
                                      _model.produtoCriado!.reference)
                                  .set(createVarianteRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    FFAppState().opcao105preco),
                                estoque: functions.stringEmInterger(
                                    FFAppState().opcao105estoque),
                                foto: FFAppState().foto10titulo1,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                produtoRef: _model.produtoCriado?.reference,
                                opcaoTitulo1: FFAppState().opcao10titulo1,
                                opcaoTitulo2: FFAppState().opcao5titulo2,
                              ));
                            }
                            if (FFAppState().opcao106preco != '') {
                              await VarianteRecord.createDoc(
                                      _model.produtoCriado!.reference)
                                  .set(createVarianteRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    FFAppState().opcao106preco),
                                estoque: functions.stringEmInterger(
                                    FFAppState().opcao106estoque),
                                foto: FFAppState().foto10titulo1,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                produtoRef: _model.produtoCriado?.reference,
                                opcaoTitulo1: FFAppState().opcao10titulo1,
                                opcaoTitulo2: FFAppState().opcao6titulo2,
                              ));
                            }
                            if (FFAppState().opcao107preco != '') {
                              await VarianteRecord.createDoc(
                                      _model.produtoCriado!.reference)
                                  .set(createVarianteRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    FFAppState().opcao107preco),
                                estoque: functions.stringEmInterger(
                                    FFAppState().opcao107estoque),
                                foto: FFAppState().foto10titulo1,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                produtoRef: _model.produtoCriado?.reference,
                                opcaoTitulo1: FFAppState().opcao10titulo1,
                                opcaoTitulo2: FFAppState().opcao7titulo2,
                              ));
                            }
                            if (FFAppState().opcao108preco != '') {
                              await VarianteRecord.createDoc(
                                      _model.produtoCriado!.reference)
                                  .set(createVarianteRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    FFAppState().opcao108preco),
                                estoque: functions.stringEmInterger(
                                    FFAppState().opcao108estoque),
                                foto: FFAppState().foto10titulo1,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                produtoRef: _model.produtoCriado?.reference,
                                opcaoTitulo1: FFAppState().opcao10titulo1,
                                opcaoTitulo2: FFAppState().opcao8titulo2,
                              ));
                            }
                            if (FFAppState().opcao109preco != '') {
                              await VarianteRecord.createDoc(
                                      _model.produtoCriado!.reference)
                                  .set(createVarianteRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    FFAppState().opcao109preco),
                                estoque: functions.stringEmInterger(
                                    FFAppState().opcao109estoque),
                                foto: FFAppState().foto10titulo1,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                produtoRef: _model.produtoCriado?.reference,
                                opcaoTitulo1: FFAppState().opcao10titulo1,
                                opcaoTitulo2: FFAppState().opcao9titulo2,
                              ));
                            }
                            if (FFAppState().opcao1010preco != '') {
                              await VarianteRecord.createDoc(
                                      _model.produtoCriado!.reference)
                                  .set(createVarianteRecordData(
                                preco: functions.dinheiroStringemDouble(
                                    FFAppState().opcao1010preco),
                                estoque: functions.stringEmInterger(
                                    FFAppState().opcao1010estoque),
                                foto: FFAppState().foto10titulo1,
                                titulo1: FFAppState().titulo1,
                                titulo2: FFAppState().titulo2,
                                produtoRef: _model.produtoCriado?.reference,
                                opcaoTitulo1: FFAppState().opcao10titulo1,
                                opcaoTitulo2: FFAppState().opcao10titulo2,
                              ));
                            }
                            FFAppState().titulo1 = '';
                            FFAppState().titulo2 = '';
                            FFAppState().opcao1titulo1 = '';
                            FFAppState().foto1titulo1 = '';
                            FFAppState().opcao2titulo1 = '';
                            FFAppState().foto2titulo1 = '';
                            FFAppState().fotoAtivoTitulo1 = false;
                            FFAppState().fotoAtivoTitulo2 = false;
                            FFAppState().opcao3titulo1 = '';
                            FFAppState().foto3titulo1 = '';
                            FFAppState().opcao4titulo1 = '';
                            FFAppState().foto4titulo1 = '';
                            FFAppState().opcao5titulo1 = '';
                            FFAppState().foto5titulo1 = '';
                            FFAppState().opcao6titulo1 = '';
                            FFAppState().foto6titulo1 = '';
                            FFAppState().opcao7titulo1 = '';
                            FFAppState().foto7titulo1 = '';
                            FFAppState().opcao8titulo1 = '';
                            FFAppState().foto8titulo1 = '';
                            FFAppState().opcao9titulo1 = '';
                            FFAppState().foto9titulo1 = '';
                            FFAppState().opcao10titulo1 = '';
                            FFAppState().foto10titulo1 = '';
                            FFAppState().opcao1titulo2 = '';
                            FFAppState().opcao2titulo2 = '';
                            FFAppState().opcao3titulo2 = '';
                            FFAppState().opcao4titulo2 = '';
                            FFAppState().opcao5titulo2 = '';
                            FFAppState().opcao6titulo2 = '';
                            FFAppState().opcao7titulo2 = '';
                            FFAppState().opcao8titulo2 = '';
                            FFAppState().opcao9titulo2 = '';
                            FFAppState().opcao10titulo2 = '';
                            FFAppState().opcao1selecionado = false;
                            FFAppState().opcao2selecionado = false;
                            FFAppState().opcao1preco = '';
                            FFAppState().opcao1estoque = '';
                            FFAppState().opcao12preco = '';
                            FFAppState().opcao12estoque = '';
                            FFAppState().opcao13preco = '';
                            FFAppState().opcao13estoque = '';
                            FFAppState().opcao14preco = '';
                            FFAppState().opcao14estoque = '';
                            FFAppState().opcao15preco = '';
                            FFAppState().opcao15estoque = '';
                            FFAppState().opcao16preco = '';
                            FFAppState().opcao16estoque = '';
                            FFAppState().opcao17preco = '';
                            FFAppState().opcao17estoque = '';
                            FFAppState().opcao18preco = '';
                            FFAppState().opcao18estoque = '';
                            FFAppState().opcao19preco = '';
                            FFAppState().opcao19estoque = '';
                            FFAppState().opcao110preco = '';
                            FFAppState().opcao110estoque = '';
                            FFAppState().naoliberar = false;
                            FFAppState().opcao3selecionado = false;
                            FFAppState().opcao4selecionado = false;
                            FFAppState().opcao5selecionado = false;
                            FFAppState().opcao6selecionado = false;
                            FFAppState().opcao7selecionado = false;
                            FFAppState().opcao8selecionado = false;
                            FFAppState().opcao9selecionado = false;
                            FFAppState().opcao10selecionado = false;
                            FFAppState().opcao21preco = '';
                            FFAppState().opcao21estoque = '';
                            FFAppState().opcao22preco = '';
                            FFAppState().opcao22estoque = '';
                            FFAppState().opcao23preco = '';
                            FFAppState().opcao23estoque = '';
                            FFAppState().opcao24preco = '';
                            FFAppState().opcao24estoque = '';
                            FFAppState().opcao25preco = '';
                            FFAppState().opcao34preco = '';
                            FFAppState().opcao25estoque = '';
                            FFAppState().opcao26preco = '';
                            FFAppState().opcao72preco = '';
                            FFAppState().opcao1010preco = '';
                            FFAppState().opcao109estoque = '';
                            FFAppState().opcao109preco = '';
                            FFAppState().opcao108estoque = '';
                            FFAppState().opcao108preco = '';
                            FFAppState().opcao107estoque = '';
                            FFAppState().opcao26estoque = '';
                            FFAppState().opcao27preco = '';
                            FFAppState().opcao27estoque = '';
                            FFAppState().opcao28preco = '';
                            FFAppState().opcao28estoque = '';
                            FFAppState().opcao29preco = '';
                            FFAppState().opcao29estoque = '';
                            FFAppState().opcao210preco = '';
                            FFAppState().opcao210estoque = '';
                            FFAppState().opcao107preco = '';
                            FFAppState().opcao106estoque = '';
                            FFAppState().opcao31preco = '';
                            FFAppState().opcao31estoque = '';
                            FFAppState().opcao32preco = '';
                            FFAppState().opcao32estoque = '';
                            FFAppState().opcao33preco = '';
                            FFAppState().opcao33estoque = '';
                            FFAppState().opcao34estoque = '';
                            FFAppState().opcao35preco = '';
                            FFAppState().opcao35estoque = '';
                            FFAppState().opcao36preco = '';
                            FFAppState().opcao37estoque = '';
                            FFAppState().opcao38preco = '';
                            FFAppState().opcao38estoque = '';
                            FFAppState().opcao39preco = '';
                            FFAppState().opcao39estoque = '';
                            FFAppState().opcao310preco = '';
                            FFAppState().opcao310estoque = '';
                            FFAppState().opcao36estoque = '';
                            FFAppState().opcao37preco = '';
                            FFAppState().opcao41preco = '';
                            FFAppState().opcao41estoque = '';
                            FFAppState().opcao42preco = '';
                            FFAppState().opcao42estoque = '';
                            FFAppState().opcao43preco = '';
                            FFAppState().opcao43estoque = '';
                            FFAppState().opcao44preco = '';
                            FFAppState().opcao44estoque = '';
                            FFAppState().opcao45preco = '';
                            FFAppState().opcao45estoque = '';
                            FFAppState().opcao46preco = '';
                            FFAppState().opcao46estoque = '';
                            FFAppState().opcao47preco = '';
                            FFAppState().opcao47estoque = '';
                            FFAppState().opcao48preco = '';
                            FFAppState().opcao48estoque = '';
                            FFAppState().opcao49preco = '';
                            FFAppState().opcao49estoque = '';
                            FFAppState().opcao410preco = '';
                            FFAppState().opcao410estoque = '';
                            FFAppState().opcao51preco = '';
                            FFAppState().opcao51estoque = '';
                            FFAppState().opcao52preco = '';
                            FFAppState().opcao52estoque = '';
                            FFAppState().opcao53preco = '';
                            FFAppState().opcao53estoque = '';
                            FFAppState().opcao54preco = '';
                            FFAppState().opcao54estoque = '';
                            FFAppState().opcao55preco = '';
                            FFAppState().opcao55estoque = '';
                            FFAppState().opcao56preco = '';
                            FFAppState().opcao56estoque = '';
                            FFAppState().opcao57preco = '';
                            FFAppState().opcao57estoque = '';
                            FFAppState().opcao58preco = '';
                            FFAppState().opcao58estoque = '';
                            FFAppState().opcao59preco = '';
                            FFAppState().opcao59estoque = '';
                            FFAppState().opcao510preco = '';
                            FFAppState().opcao510estoque = '';
                            FFAppState().opcao61preco = '';
                            FFAppState().opcao61estoque = '';
                            FFAppState().opcao62preco = '';
                            FFAppState().opcao62estoque = '';
                            FFAppState().opcao63preco = '';
                            FFAppState().opcao63estoque = '';
                            FFAppState().opcao64preco = '';
                            FFAppState().opcao65estoque = '';
                            FFAppState().opcao65preco = '';
                            FFAppState().opcao66preco = '';
                            FFAppState().opcao67estoque = '';
                            FFAppState().opcao68preco = '';
                            FFAppState().opcao68estoque = '';
                            FFAppState().opcao69preco = '';
                            FFAppState().opcao69estoque = '';
                            FFAppState().opcao610preco = '';
                            FFAppState().opcao610estoque = '';
                            FFAppState().opcao64estoque = '';
                            FFAppState().opcao66estoque = '';
                            FFAppState().opcao67preco = '';
                            FFAppState().opcao71preco = '';
                            FFAppState().opcao71estoque = '';
                            FFAppState().opcao1010estoque = '';
                            FFAppState().opcao72estoque = '';
                            FFAppState().opcao76estoque = '';
                            FFAppState().opcao73preco = '';
                            FFAppState().opcao73estoque = '';
                            FFAppState().opcao74preco = '';
                            FFAppState().opcao74estoque = '';
                            FFAppState().opcao75preco = '';
                            FFAppState().opcao75estoque = '';
                            FFAppState().opcao76preco = '';
                            FFAppState().opcao77preco = '';
                            FFAppState().opcao77estoque = '';
                            FFAppState().opcao78preco = '';
                            FFAppState().opcao78estoque = '';
                            FFAppState().opcao79preco = '';
                            FFAppState().opcao79estoque = '';
                            FFAppState().opcao710preco = '';
                            FFAppState().opcao710estoque = '';
                            FFAppState().opcao81preco = '';
                            FFAppState().opcao81estoque = '';
                            FFAppState().opcao83preco = '';
                            FFAppState().opcao82preco = '';
                            FFAppState().opcao82estoque = '';
                            FFAppState().opcao83estoque = '';
                            FFAppState().opcao84preco = '';
                            FFAppState().opcao84estoque = '';
                            FFAppState().opcao85preco = '';
                            FFAppState().opcao85estoque = '';
                            FFAppState().opcao86preco = '';
                            FFAppState().opcao86estoque = '';
                            FFAppState().opcao87preco = '';
                            FFAppState().opcao87estoque = '';
                            FFAppState().opcao88preco = '';
                            FFAppState().opcao88estoque = '';
                            FFAppState().opcao89preco = '';
                            FFAppState().opcao89estoque = '';
                            FFAppState().opcao810preco = '';
                            FFAppState().opcao810estoque = '';
                            FFAppState().opcao91preco = '';
                            FFAppState().opcao91estoque = '';
                            FFAppState().opcao92preco = '';
                            FFAppState().opcao92estoque = '';
                            FFAppState().opcao93preco = '';
                            FFAppState().opcao93estoque = '';
                            FFAppState().opcao94preco = '';
                            FFAppState().opcao94estoque = '';
                            FFAppState().opcao95preco = '';
                            FFAppState().opcao95estoque = '';
                            FFAppState().opcao96preco = '';
                            FFAppState().opcao96estoque = '';
                            FFAppState().opcao97preco = '';
                            FFAppState().opcao97estoque = '';
                            FFAppState().opcao98preco = '';
                            FFAppState().opcao98estoque = '';
                            FFAppState().opcao99preco = '';
                            FFAppState().opcao99estoque = '';
                            FFAppState().opcao910preco = '';
                            FFAppState().opcao910estoque = '';
                            FFAppState().opcao101preco = '';
                            FFAppState().opcao101estoque = '';
                            FFAppState().opcao102preco = '';
                            FFAppState().opcao102estoque = '';
                            FFAppState().opcao103preco = '';
                            FFAppState().opcao103estoque = '';
                            FFAppState().opcao104preco = '';
                            FFAppState().opcao104estoque = '';
                            FFAppState().opcao106preco = '';
                            FFAppState().opcao105estoque = '';
                            FFAppState().opcao105preco = '';
                            FFAppState().menorValor = 0.0;
                            FFAppState().selecionarVariante1foto = '';
                            FFAppState().selecionarVariante2 = '';
                            FFAppState().selecionarVariante1 = '';
                            FFAppState().fretesp = '';
                            FFAppState().freterj = '';
                            safeSetState(() {});
                            _model.listVariante2 =
                                await queryVarianteRecordOnce(
                              parent: _model.produtoCriado?.reference,
                            );
                            _shouldSetState = true;

                            await _model.produtoCriado!.reference
                                .update(createProdutoRecordData(
                              menorPrecoRevenda: functions.menorValorVatiente(
                                  _model.listVariante2!.toList()),
                            ));
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Tudo certo'),
                                  content: Text('Produto criado!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.goNamed(
                              ProdutosWidget.routeName,
                              queryParameters: {
                                'lojaref': serializeParam(
                                  widget.lojaRef,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );

                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: 'Publicar',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 40.0,
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
