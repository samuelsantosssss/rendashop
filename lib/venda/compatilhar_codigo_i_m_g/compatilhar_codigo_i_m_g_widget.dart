import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venda/midia_dowload_i_m_g/midia_dowload_i_m_g_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'compatilhar_codigo_i_m_g_model.dart';
export 'compatilhar_codigo_i_m_g_model.dart';

class CompatilharCodigoIMGWidget extends StatefulWidget {
  const CompatilharCodigoIMGWidget({
    super.key,
    required this.imgRef,
  });

  final String? imgRef;

  static String routeName = 'compatilhar_codigoIMG';
  static String routePath = '/compatilharCodigoIMG';

  @override
  State<CompatilharCodigoIMGWidget> createState() =>
      _CompatilharCodigoIMGWidgetState();
}

class _CompatilharCodigoIMGWidgetState
    extends State<CompatilharCodigoIMGWidget> {
  late CompatilharCodigoIMGModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompatilharCodigoIMGModel());

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
      body: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: custom_widgets.WidgetAction(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            screenshotFFpage: () => MidiaDowloadIMGWidget(
              imgRef: widget!.imgRef!,
            ),
          ),
        ),
      ),
    );
  }
}
