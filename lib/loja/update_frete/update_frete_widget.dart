import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_frete_model.dart';
export 'update_frete_model.dart';

class UpdateFreteWidget extends StatefulWidget {
  const UpdateFreteWidget({
    super.key,
    required this.carrinhoRef,
    required this.stringList,
    required this.valorSP,
    required this.valorProduto,
  });

  final DocumentReference? carrinhoRef;
  final List<String>? stringList;
  final double? valorSP;
  final double? valorProduto;

  @override
  State<UpdateFreteWidget> createState() => _UpdateFreteWidgetState();
}

class _UpdateFreteWidgetState extends State<UpdateFreteWidget> {
  late UpdateFreteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateFreteModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while ((isAndroid == true) || isiOS || isWeb || kDebugMode) {
        await widget!.carrinhoRef!.update(createCarrinhoRecordData(
          frete: FFAppState().cupomSelecionadoRef != null
              ? functions.freteCupom2(
                  functions.frete(
                      valueOrDefault(currentUserDocument?.enderecoCompleto, ''),
                      widget!.stringList!.toList(),
                      widget!.valorSP!),
                  FFAppState().cupomFrete,
                  FFAppState().tipoDeCupom,
                  widget!.valorProduto!)
              : functions.dinheiroStringemDouble(functions.frete(
                  valueOrDefault(currentUserDocument?.enderecoCompleto, ''),
                  widget!.stringList!.toList(),
                  widget!.valorSP!)),
        ));
        await Future.delayed(
          Duration(
            milliseconds: 1000,
          ),
        );
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
