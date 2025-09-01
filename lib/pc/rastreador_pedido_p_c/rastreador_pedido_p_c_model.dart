import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rastreador_pedido_p_c_widget.dart' show RastreadorPedidoPCWidget;
import 'package:flutter/material.dart';

class RastreadorPedidoPCModel
    extends FlutterFlowModel<RastreadorPedidoPCWidget> {
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
