import '/backend/backend.dart';
import '/carregando/carregando8/carregando8_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/perfil/excluir_cartao/excluir_cartao_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cartao_de_credito_delete_model.dart';
export 'cartao_de_credito_delete_model.dart';

class CartaoDeCreditoDeleteWidget extends StatefulWidget {
  const CartaoDeCreditoDeleteWidget({
    super.key,
    required this.cardRef,
  });

  final DocumentReference? cardRef;

  static String routeName = 'CartaoDeCreditoDelete';
  static String routePath = '/cartaoDeCreditoDelete';

  @override
  State<CartaoDeCreditoDeleteWidget> createState() =>
      _CartaoDeCreditoDeleteWidgetState();
}

class _CartaoDeCreditoDeleteWidgetState
    extends State<CartaoDeCreditoDeleteWidget> {
  late CartaoDeCreditoDeleteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartaoDeCreditoDeleteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CartaoRecord>(
      stream: CartaoRecord.getDocument(widget.cardRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEEEEEE),
            body: Carregando8Widget(),
          );
        }

        final cartaoDeCreditoDeleteCartaoRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFEEEEEE),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Color(0xFF75787A),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Cartão de Crédito',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xFF75787A),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 200.03,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFDFDFDF),
                            FlutterFlowTheme.of(context).secondaryBackground
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.44, -1.0),
                          end: AlignmentDirectional(-0.44, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(9.0),
                        border: Border.all(
                          color: Color(0xFFBDBDBD),
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 19.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 66.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              () {
                                                if (cartaoDeCreditoDeleteCartaoRecord
                                                        .bandeira ==
                                                    'VISA') {
                                                  return 'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Card%2Fvisa-icon-2048x628-6yzgq2vq.png?alt=media&token=1df5ecfa-7610-4fc9-8b44-5e83564ef094';
                                                } else if (cartaoDeCreditoDeleteCartaoRecord
                                                        .bandeira ==
                                                    'MASTERCARD') {
                                                  return 'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Card%2FMastercard-logo.svg.png?alt=media&token=881b160d-a635-4f8e-af0f-e33461794ffc';
                                                } else if (cartaoDeCreditoDeleteCartaoRecord
                                                        .bandeira ==
                                                    'ELO') {
                                                  return 'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Card%2Felo-icon-2048x750-n9jgb33k.png?alt=media&token=eaf95ba4-4548-4640-92f2-e3764fab5f6e';
                                                } else if (cartaoDeCreditoDeleteCartaoRecord
                                                        .bandeira ==
                                                    'AMERICAN EXPRESS') {
                                                  return 'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Card%2F349228.png?alt=media&token=148daa6a-5121-4166-9bbe-d5f9d2da85c8';
                                                } else if (cartaoDeCreditoDeleteCartaoRecord
                                                        .bandeira ==
                                                    'DISCOVER') {
                                                  return 'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Card%2FDiscover-logo.png?alt=media&token=c7cf671e-afd7-4813-ab4f-1a6f9182ad41';
                                                } else {
                                                  return 'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Card%2FDesign%20sem%20nome%20(79).png?alt=media&token=9db1b953-6e1d-4595-bc0b-83e53edc279d';
                                                }
                                              }(),
                                              'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Card%2FDesign%20sem%20nome%20(79).png?alt=media&token=9db1b953-6e1d-4595-bc0b-83e53edc279d',
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF17D62F),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Ativa',
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
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 30.0, 0.0, 0.0),
                              child: Text(
                                cartaoDeCreditoDeleteCartaoRecord.bin,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 17.0,
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
                                  12.0, 40.0, 0.0, 0.0),
                              child: Text(
                                '****  ****  ****  ${functions.card4Digitos(cartaoDeCreditoDeleteCartaoRecord.numeroCartao)}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
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
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 0.0, 10.0),
                      child: Text(
                        'Detalhes',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF6F6F6F),
                              fontSize: 12.0,
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
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
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
                                  child: ExcluirCartaoWidget(
                                    cartaoRef: widget.cardRef!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 105.74,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Bandeira do Cartão',
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
                                              .secondaryText,
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
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 7.0, 0.0, 10.0),
                                  child: Text(
                                    cartaoDeCreditoDeleteCartaoRecord.bandeira,
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
                                          fontSize: 14.0,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 0.5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 7.0, 0.0, 0.0),
                                    child: Text(
                                      'Apagar',
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
                                            color: Color(0xFFEE4545),
                                            fontSize: 14.0,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
