import '/flutter_flow/flutter_flow_util.dart';
import 'cadastrar_opcao11_widget.dart' show CadastrarOpcao11Widget;
import 'package:flutter/material.dart';

class CadastrarOpcao11Model extends FlutterFlowModel<CadastrarOpcao11Widget> {
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
