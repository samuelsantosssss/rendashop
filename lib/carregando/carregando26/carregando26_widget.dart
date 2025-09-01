import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'carregando26_model.dart';
export 'carregando26_model.dart';

class Carregando26Widget extends StatefulWidget {
  const Carregando26Widget({super.key});

  @override
  State<Carregando26Widget> createState() => _Carregando26WidgetState();
}

class _Carregando26WidgetState extends State<Carregando26Widget> {
  late Carregando26Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando26Model());

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
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 147.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFAFAFA), Color(0xFFF5F5F5)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(14)%20(1).png?alt=media&token=7d0cf424-76a2-4610-825d-673ee8f9e34f',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
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
