import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/icms/icms_widget.dart';
import '/index.dart';
import 'comprar_widget.dart' show ComprarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ComprarModel extends FlutterFlowModel<ComprarWidget> {
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
  bool? checkbox222Value;
  // Stores action output result for [Firestore Query - Query a collection] action in RichText widget.
  CartaoRecord? queryCardCopyCopyCopy44;
  // State field(s) for Checkbox333 widget.
  bool? checkbox333Value;
  // Model for ICMS component.
  late IcmsModel icmsModel;
  // Stores action output result for [Backend Call - API (Pag Pix MP)] action in Button widget.
  ApiCallResponse? mercadopago;

  @override
  void initState(BuildContext context) {
    icmsModel = createModel(context, () => IcmsModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    icmsModel.dispose();
  }
}
