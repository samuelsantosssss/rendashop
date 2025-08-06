import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dddddddddd_model.dart';
export 'dddddddddd_model.dart';

class DdddddddddWidget extends StatefulWidget {
  const DdddddddddWidget({
    super.key,
    required this.varianteRef,
    required this.listVariantes,
  });

  final DocumentReference? varianteRef;
  final List<String>? listVariantes;

  @override
  State<DdddddddddWidget> createState() => _DdddddddddWidgetState();
}

class _DdddddddddWidgetState extends State<DdddddddddWidget> {
  late DdddddddddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DdddddddddModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().apagar = functions
          .valorProdutoAfiliado(
              widget!.varianteRef!, widget!.listVariantes!.toList())
          .toString();
      safeSetState(() {});
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
