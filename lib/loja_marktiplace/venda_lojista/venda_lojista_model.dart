import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venda/saldo/saldo_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'venda_lojista_widget.dart' show VendaLojistaWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
