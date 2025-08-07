import '/flutter_flow/flutter_flow_util.dart';
import 'atualizar_opcao22_widget.dart' show AtualizarOpcao22Widget;
import 'package:flutter/material.dart';

class AtualizarOpcao22Model extends FlutterFlowModel<AtualizarOpcao22Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nome_produto widget.
  FocusNode? nomeProdutoFocusNode;
  TextEditingController? nomeProdutoTextController;
  String? Function(BuildContext, String?)? nomeProdutoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeProdutoFocusNode?.dispose();
    nomeProdutoTextController?.dispose();
  }
}
