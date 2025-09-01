import '/flutter_flow/flutter_flow_util.dart';
import '/pc/rodape/rodape_widget.dart';
import '/index.dart';
import 'pc_categoria_widget.dart' show PcCategoriaWidget;
import 'package:flutter/material.dart';

class PcCategoriaModel extends FlutterFlowModel<PcCategoriaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for rodape component.
  late RodapeModel rodapeModel;

  @override
  void initState(BuildContext context) {
    rodapeModel = createModel(context, () => RodapeModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    rodapeModel.dispose();
  }
}
