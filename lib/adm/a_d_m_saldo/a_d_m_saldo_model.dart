import '/flutter_flow/flutter_flow_util.dart';
import '/venda/saldo/saldo_widget.dart';
import 'a_d_m_saldo_widget.dart' show ADMSaldoWidget;
import 'package:flutter/material.dart';

class ADMSaldoModel extends FlutterFlowModel<ADMSaldoWidget> {
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
