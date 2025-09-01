import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'carregando7_model.dart';
export 'carregando7_model.dart';

class Carregando7Widget extends StatefulWidget {
  const Carregando7Widget({super.key});

  @override
  State<Carregando7Widget> createState() => _Carregando7WidgetState();
}

class _Carregando7WidgetState extends State<Carregando7Widget> {
  late Carregando7Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando7Model());

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
      height: 207.76,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(-1.0, -1.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFA1A1A1),
                FlutterFlowTheme.of(context).secondaryBackground,
                Color(0xFFA1A1A1)
              ],
              stops: [0.0, 1.0, 1.0],
              begin: AlignmentDirectional(1.0, -1.0),
              end: AlignmentDirectional(-1.0, 1.0),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
