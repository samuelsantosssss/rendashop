import '/flutter_flow/flutter_flow_util.dart';
import '/venda/saldo/saldo_widget.dart';
import 'venda_lojista_widget.dart' show VendaLojistaWidget;
import 'package:flutter/material.dart';

class VendaLojistaModel extends FlutterFlowModel<VendaLojistaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for saldo component.
  late SaldoModel saldoModel;

  @override
  void initState(BuildContext context) {
    saldoModel = createModel(context, () => SaldoModel());
  }

  @override
  void dispose() {
    saldoModel.dispose();
  }
}
