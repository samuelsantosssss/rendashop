import '/flutter_flow/flutter_flow_util.dart';
import 'editar_promo_widget.dart' show EditarPromoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarPromoModel extends FlutterFlowModel<EditarPromoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField111 widget.
  FocusNode? textField111FocusNode;
  TextEditingController? textField111TextController;
  late MaskTextInputFormatter textField111Mask;
  String? Function(BuildContext, String?)? textField111TextControllerValidator;
  // State field(s) for Estoque widget.
  FocusNode? estoqueFocusNode;
  TextEditingController? estoqueTextController;
  String? Function(BuildContext, String?)? estoqueTextControllerValidator;
  // State field(s) for LimiteCompra2 widget.
  FocusNode? limiteCompra2FocusNode;
  TextEditingController? limiteCompra2TextController;
  String? Function(BuildContext, String?)? limiteCompra2TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField111FocusNode?.dispose();
    textField111TextController?.dispose();

    estoqueFocusNode?.dispose();
    estoqueTextController?.dispose();

    limiteCompra2FocusNode?.dispose();
    limiteCompra2TextController?.dispose();
  }
}
