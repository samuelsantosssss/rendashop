import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'carregando21_model.dart';
export 'carregando21_model.dart';

class Carregando21Widget extends StatefulWidget {
  const Carregando21Widget({super.key});

  @override
  State<Carregando21Widget> createState() => _Carregando21WidgetState();
}

class _Carregando21WidgetState extends State<Carregando21Widget> {
  late Carregando21Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando21Model());

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
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 22.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
