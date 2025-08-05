import '/backend/api_requests/api_calls.dart';
import '/components/time_pix3_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pix2_widget.dart' show Pix2Widget;
import 'package:flutter/material.dart';

class Pix2Model extends FlutterFlowModel<Pix2Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Status Pix MP)] action in pix2 widget.
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
