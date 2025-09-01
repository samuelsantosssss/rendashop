import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'carrinho_p_c_widget.dart' show CarrinhoPCWidget;
import 'package:flutter/material.dart';

class CarrinhoPCModel extends FlutterFlowModel<CarrinhoPCWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button2 widget.
  CarrinhoRecord? queryCardCopy2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button2 widget.
  List<CarrinhoFinalRecord>? listCardFinal2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button2 widget.
  List<CarrinhoFinalRecord>? listCardFinal;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
