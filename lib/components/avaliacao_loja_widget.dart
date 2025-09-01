import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'avaliacao_loja_model.dart';
export 'avaliacao_loja_model.dart';

class AvaliacaoLojaWidget extends StatefulWidget {
  const AvaliacaoLojaWidget({super.key});

  @override
  State<AvaliacaoLojaWidget> createState() => _AvaliacaoLojaWidgetState();
}

class _AvaliacaoLojaWidgetState extends State<AvaliacaoLojaWidget> {
  late AvaliacaoLojaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvaliacaoLojaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
            child: Text(
              '4,9',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: Color(0xFF303131),
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
            child: Icon(
              Icons.star,
              color: Color(0xFF363636),
              size: 13.0,
            ),
          ),
        ),
      ],
    );
  }
}
