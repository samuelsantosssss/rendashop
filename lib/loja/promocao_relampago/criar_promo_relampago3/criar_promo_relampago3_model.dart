import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'criar_promo_relampago3_widget.dart' show CriarPromoRelampago3Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CriarPromoRelampago3Model
    extends FlutterFlowModel<CriarPromoRelampago3Widget> {
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
  // State field(s) for LimiteCompra widget.
  FocusNode? limiteCompraFocusNode;
  TextEditingController? limiteCompraTextController;
  String? Function(BuildContext, String?)? limiteCompraTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField111FocusNode?.dispose();
    textField111TextController?.dispose();

    estoqueFocusNode?.dispose();
    estoqueTextController?.dispose();

    limiteCompraFocusNode?.dispose();
    limiteCompraTextController?.dispose();
  }
}
