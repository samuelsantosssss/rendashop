import '/backend/api_requests/api_calls.dart';
import '/components/time_pix2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pix_p_c_widget.dart' show PixPCWidget;
import 'package:flutter/material.dart';

class PixPCModel extends FlutterFlowModel<PixPCWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Status Pix MP)] action in pixPC widget.
  ApiCallResponse? apiResultnkfCopy2;
  // Model for timePix2 component.
  late TimePix2Model timePix2Model;

  @override
  void initState(BuildContext context) {
    timePix2Model = createModel(context, () => TimePix2Model());
  }

  @override
  void dispose() {
    timePix2Model.dispose();
  }
}
