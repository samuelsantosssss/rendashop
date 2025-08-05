import '/flutter_flow/flutter_flow_util.dart';
import 'atualizar_opcao11_widget.dart' show AtualizarOpcao11Widget;
import 'package:flutter/material.dart';

class AtualizarOpcao11Model extends FlutterFlowModel<AtualizarOpcao11Widget> {
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
