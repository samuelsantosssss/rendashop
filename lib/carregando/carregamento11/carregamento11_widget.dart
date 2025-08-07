import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'carregamento11_model.dart';
export 'carregamento11_model.dart';

class Carregamento11Widget extends StatefulWidget {
  const Carregamento11Widget({super.key});

  @override
  State<Carregamento11Widget> createState() => _Carregamento11WidgetState();
}

class _Carregamento11WidgetState extends State<Carregamento11Widget> {
  late Carregamento11Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregamento11Model());

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
        Icon(
          Icons.storefront_outlined,
          color: Color(0xFF3E3D3D),
          size: 16.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
          child: Container(
            width: 50.0,
            height: 12.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC5C5C5), Colors.white, Color(0xFFA1A1A1)],
                stops: [0.0, 1.0, 1.0],
                begin: AlignmentDirectional(1.0, -0.34),
                end: AlignmentDirectional(-1.0, 0.34),
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ],
    );
  }
}
