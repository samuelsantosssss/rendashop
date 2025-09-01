import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/icms/icms_widget.dart';
import '/pc/p_csem_endereco/p_csem_endereco_widget.dart';
import '/index.dart';
import 'comprar_p_c_widget.dart' show ComprarPCWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ComprarPCModel extends FlutterFlowModel<ComprarPCWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late MaskTextInputFormatter textFieldMask;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Checkbox111 widget.
  bool? checkbox111Value;
  // State field(s) for Checkbox222 widget.
  bool? checkbox222Value1;
  // Stores action output result for [Firestore Query - Query a collection] action in RichText widget.
  CartaoRecord? queryCardCopyCopyCopy44;
  // State field(s) for Checkbox333 widget.
  bool? checkbox333Value;
  // State field(s) for Checkbox222 widget.
  bool? checkbox222Value2;
  // Model for ICMS component.
  late IcmsModel icmsModel;
  // Stores action output result for [Backend Call - API (Pag Pix MP)] action in Button widget.
  ApiCallResponse? mercadopago;
  // Stores action output result for [Backend Call - API (ObterIP)] action in cartao widget.
  ApiCallResponse? apiResultIP;
  // Stores action output result for [Backend Call - API (Asaas Pagamento)] action in cartao widget.
  ApiCallResponse? apiResulto1xxxxxxx;
  // Stores action output result for [Backend Call - API (Asaas Token  Cliente)] action in cartao widget.
  ApiCallResponse? apiResultduu;
  // Stores action output result for [Backend Call - API (ObterIP)] action in cartao widget.
  ApiCallResponse? apiResultIPP;
  // Stores action output result for [Backend Call - API (Asaas Pagamento)] action in cartao widget.
  ApiCallResponse? apiResulto1xx;
  // Model for PCsemEndereco component.
  late PCsemEnderecoModel pCsemEnderecoModel;

  @override
  void initState(BuildContext context) {
    icmsModel = createModel(context, () => IcmsModel());
    pCsemEnderecoModel = createModel(context, () => PCsemEnderecoModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    icmsModel.dispose();
    pCsemEnderecoModel.dispose();
  }
}
