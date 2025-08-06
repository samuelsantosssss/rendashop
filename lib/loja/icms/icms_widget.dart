import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icms_model.dart';
export 'icms_model.dart';

class IcmsWidget extends StatefulWidget {
  const IcmsWidget({
    super.key,
    required this.documentList,
    required this.enderecoDestino,
  });

  final List<CarrinhoRecord>? documentList;
  final String? enderecoDestino;

  @override
  State<IcmsWidget> createState() => _IcmsWidgetState();
}

class _IcmsWidgetState extends State<IcmsWidget> {
  late IcmsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IcmsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (FFAppState().gerarICSM) {
        await actions.iCMScriar(
          widget!.documentList!.toList(),
          widget!.enderecoDestino!,
        );
        FFAppState().gerarICSM = false;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 1.0,
      height: 1.0,
      decoration: BoxDecoration(),
    );
  }
}
