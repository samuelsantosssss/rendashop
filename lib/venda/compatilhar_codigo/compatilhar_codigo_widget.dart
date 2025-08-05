import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/venda/midia_venda_compartilhar/midia_venda_compartilhar_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'compatilhar_codigo_model.dart';
export 'compatilhar_codigo_model.dart';

class CompatilharCodigoWidget extends StatefulWidget {
  const CompatilharCodigoWidget({
    super.key,
    required this.afiliadoref,
  });

  final DocumentReference? afiliadoref;

  static String routeName = 'compatilhar_codigo';
  static String routePath = '/compatilharCodigo';

  @override
  State<CompatilharCodigoWidget> createState() =>
      _CompatilharCodigoWidgetState();
}

class _CompatilharCodigoWidgetState extends State<CompatilharCodigoWidget> {
  late CompatilharCodigoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompatilharCodigoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 209.1,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: custom_widgets.WidgetAction(
                  width: 209.1,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  screenshotFFpage: () => MidiaVendaCompartilharWidget(
                    afiliadoref: widget.afiliadoref!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
