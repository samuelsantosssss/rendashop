import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'carregando22_model.dart';
export 'carregando22_model.dart';

class Carregando22Widget extends StatefulWidget {
  const Carregando22Widget({super.key});

  @override
  State<Carregando22Widget> createState() => _Carregando22WidgetState();
}

class _Carregando22WidgetState extends State<Carregando22Widget> {
  late Carregando22Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando22Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Ainda_no_Existem_Pedidos_(92).png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 20.0, 0.0),
              child: Container(
                width: 117.6,
                height: 38.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12.0,
                      color: Color(0xB44AA756),
                      offset: Offset(
                        9.0,
                        -5.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      Color(0xFFBBF4EE)
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.28, -1.0),
                    end: AlignmentDirectional(-0.28, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Color(0xFFE3FBE6),
                    width: 0.4,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.donate,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 17.0,
                      ),
                    ),
                    Text(
                      'Saque',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.robotoMono(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 129.0, 0.0, 0.0),
              child: GradientText(
                'Seu saldo',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.robotoMono(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                colors: [
                  FlutterFlowTheme.of(context).secondaryBackground,
                  Color(0xFFF0EEEE)
                ],
                gradientDirection: GradientDirection.ttb,
                gradientType: GradientType.linear,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
              child: FaIcon(
                FontAwesomeIcons.creditCard,
                color: Color(0xD2262525),
                size: 34.0,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 31.0, 0.0, 0.0),
              child: Text(
                'Cartão Renda Shop',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
