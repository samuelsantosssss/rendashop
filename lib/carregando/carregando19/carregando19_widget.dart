import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'carregando19_model.dart';
export 'carregando19_model.dart';

class Carregando19Widget extends StatefulWidget {
  const Carregando19Widget({super.key});

  @override
  State<Carregando19Widget> createState() => _Carregando19WidgetState();
}

class _Carregando19WidgetState extends State<Carregando19Widget> {
  late Carregando19Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carregando19Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 224.5,
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                alignment: AlignmentDirectional(0.0, 0.0),
                                image: Image.network(
                                  '',
                                ).image,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/renda-shop-sat8qr.firebasestorage.app/o/Ainda%20n%C3%A3o%20Existem%20Pedidos%20(99)%20(2).png?alt=media&token=75c2d24d-98c0-4768-90fa-699b231d56d1',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 8.0, 10.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              height: 31.4,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 31.4,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(7.0),
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
        ),
      ],
    );
  }
}
