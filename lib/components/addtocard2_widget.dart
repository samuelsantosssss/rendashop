import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addtocard2_model.dart';
export 'addtocard2_model.dart';

class Addtocard2Widget extends StatefulWidget {
  const Addtocard2Widget({super.key});

  @override
  State<Addtocard2Widget> createState() => _Addtocard2WidgetState();
}

class _Addtocard2WidgetState extends State<Addtocard2Widget> {
  late Addtocard2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Addtocard2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 58.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 7.0),
          child: Container(
            width: double.infinity,
            height: 96.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Adicionar oa Carrinho',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
