import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'update_metodo_pagamento_widget.dart' show UpdateMetodoPagamentoWidget;
import 'package:flutter/material.dart';

class UpdateMetodoPagamentoModel
    extends FlutterFlowModel<UpdateMetodoPagamentoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox111 widget.
  bool? checkbox111Value;
  // State field(s) for Checkbox222 widget.
  bool? checkbox222Value;
  // State field(s) for Checkbox333 widget.
  bool? checkbox333Value;
  // Stores action output result for [Backend Call - API (ObterIP)] action in cartao widget.
  ApiCallResponse? apiResultIPP;
  // Stores action output result for [Backend Call - API (Asaas Pagamento)] action in cartao widget.
  ApiCallResponse? apiResulto13;
  // Stores action output result for [Backend Call - API (Pag Pix MP)] action in Button widget.
  ApiCallResponse? mercadopago2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
