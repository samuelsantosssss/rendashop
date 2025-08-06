import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teste_feed_model.dart';
export 'teste_feed_model.dart';

class TesteFeedWidget extends StatefulWidget {
  const TesteFeedWidget({
    super.key,
    required this.documentList,
  });

  final List<ProdutoRecord>? documentList;

  @override
  State<TesteFeedWidget> createState() => _TesteFeedWidgetState();
}

class _TesteFeedWidgetState extends State<TesteFeedWidget> {
  late TesteFeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TesteFeedModel());

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

    return Stack(
      children: [
        if (((FFAppState().feedDocumentoAntes !=
                    FFAppState().feedDocumentoDepois) &&
                (FFAppState().feedDocumentoAntes != null &&
                    FFAppState().feedDocumentoAntes != '')) ||
            (FFAppState().feedCheio == false))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().feedDocumentoAntes = functions
                    .buscarSugestoesCategoria(
                        FFAppState().palavraChavePesquisa.firstOrNull,
                        widget!.documentList!.toList(),
                        FFAppState().filtroNacional,
                        FFAppState().filtroEntregaRapida,
                        FFAppState().filtroLojaOficial,
                        FFAppState().filtroInternacional,
                        FFAppState().filtroRecente,
                        FFAppState().FiltroDestaque,
                        FFAppState().filtroPreco,
                        FFAppState().liberarMais)
                    .length
                    .toString();
                safeSetState(() {});
                FFAppState().liberarMais = FFAppState().liberarMais + 60;
                safeSetState(() {});
                FFAppState().feedDocumentoDepois = functions
                    .buscarSugestoesCategoria(
                        FFAppState().palavraChavePesquisa.firstOrNull,
                        widget!.documentList!.toList(),
                        FFAppState().filtroNacional,
                        FFAppState().filtroEntregaRapida,
                        FFAppState().filtroLojaOficial,
                        FFAppState().filtroInternacional,
                        FFAppState().filtroRecente,
                        FFAppState().FiltroDestaque,
                        FFAppState().filtroPreco,
                        FFAppState().liberarMais)
                    .length
                    .toString();
                safeSetState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 43.3,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ver mais',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (FFAppState().feedCheio)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 43.3,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
      ],
    );
  }
}
