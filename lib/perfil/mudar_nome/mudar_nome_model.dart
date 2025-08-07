import '/flutter_flow/flutter_flow_util.dart';
import 'mudar_nome_widget.dart' show MudarNomeWidget;
import 'package:flutter/material.dart';

class MudarNomeModel extends FlutterFlowModel<MudarNomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
