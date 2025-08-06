import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'update_pix_model.dart';
export 'update_pix_model.dart';

class UpdatePixWidget extends StatefulWidget {
  const UpdatePixWidget({
    super.key,
    required this.pedidoRef,
    required this.dataPedido,
    required this.statusPagamento,
    required this.lojaRef,
    required this.totalPedido,
    required this.produtoRef,
    required this.status,
  });

  final DocumentReference? pedidoRef;
  final DateTime? dataPedido;
  final String? statusPagamento;
  final DocumentReference? lojaRef;
  final double? totalPedido;
  final DocumentReference? produtoRef;
  final String? status;

  @override
  State<UpdatePixWidget> createState() => _UpdatePixWidgetState();
}

class _UpdatePixWidgetState extends State<UpdatePixWidget> {
  late UpdatePixModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdatePixModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while ((functions.contagemregressivaPix(widget!.dataPedido!) ==
              'Tempo expirado') &&
          (widget!.statusPagamento == 'naopago') &&
          (widget!.status != 'cancelado')) {
        await widget!.pedidoRef!.update(createPedidosTotalRecordData(
          status: 'cancelado',
        ));

        await CancelamentoRecord.createDoc(widget!.pedidoRef!)
            .set(createCancelamentoRecordData(
          data: getCurrentTimestamp,
          pedidoRef: widget!.pedidoRef,
          solicitante: 'Renda Shop',
          motivo: 'Falha no pagamento',
          status: 'cancelado',
          lojaRef: widget!.lojaRef,
          userRef: currentUserReference,
          iDSolicitacao: functions.idCancelamento(),
          valorReembolso: widget!.totalPedido,
          produtoRef: widget!.produtoRef,
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
    return Container(
      width: 1.0,
      height: 1.0,
      decoration: BoxDecoration(),
    );
  }
}
