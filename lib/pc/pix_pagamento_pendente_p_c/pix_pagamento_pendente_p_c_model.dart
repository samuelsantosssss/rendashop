import '/backend/api_requests/api_calls.dart';
import '/components/time_pix3_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pix_pagamento_pendente_p_c_widget.dart'
    show PixPagamentoPendentePCWidget;
import 'package:flutter/material.dart';

class PixPagamentoPendentePCModel
    extends FlutterFlowModel<PixPagamentoPendentePCWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Status Pix MP)] action in pixPagamentoPendentePC widget.
  ApiCallResponse? apiResultnkfCopy;
  // Model for timePix3 component.
  late TimePix3Model timePix3Model;

  @override
  void initState(BuildContext context) {
    timePix3Model = createModel(context, () => TimePix3Model());
  }

  @override
  void dispose() {
    timePix3Model.dispose();
  }
}
