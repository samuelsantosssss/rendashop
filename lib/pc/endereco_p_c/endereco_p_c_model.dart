import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'endereco_p_c_widget.dart' show EnderecoPCWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EnderecoPCModel extends FlutterFlowModel<EnderecoPCWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late MaskTextInputFormatter textFieldMask2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  late MaskTextInputFormatter cepMask;
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  // Stores action output result for [Backend Call - API (Puxar CEP)] action in cep widget.
  ApiCallResponse? apiResult1rf;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinal3Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CarrinhoFinalRecord>? listCardFinal6;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarrinhoFinalRecord>? listCardFinal5;
  // State field(s) for TextField111 widget.
  FocusNode? textField111FocusNode;
  TextEditingController? textField111TextController;
  String? Function(BuildContext, String?)? textField111TextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController7;
  late MaskTextInputFormatter textFieldMask5;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for cepp widget.
  FocusNode? ceppFocusNode;
  TextEditingController? ceppTextController;
  late MaskTextInputFormatter ceppMask;
  String? Function(BuildContext, String?)? ceppTextControllerValidator;
  // Stores action output result for [Backend Call - API (Puxar CEP)] action in cepp widget.
  ApiCallResponse? apiResult1rff;
  // State field(s) for TextField777 widget.
  FocusNode? textField777FocusNode;
  TextEditingController? textField777TextController;
  String? Function(BuildContext, String?)? textField777TextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for CPFF widget.
  FocusNode? cpffFocusNode;
  TextEditingController? cpffTextController;
  late MaskTextInputFormatter cpffMask;
  String? Function(BuildContext, String?)? cpffTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EnderecosRecord? criado;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinal2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    cepFocusNode?.dispose();
    cepTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    textField111FocusNode?.dispose();
    textField111TextController?.dispose();

    textFieldFocusNode5?.dispose();
    textController7?.dispose();

    ceppFocusNode?.dispose();
    ceppTextController?.dispose();

    textField777FocusNode?.dispose();
    textField777TextController?.dispose();

    textFieldFocusNode6?.dispose();
    textController10?.dispose();

    cpffFocusNode?.dispose();
    cpffTextController?.dispose();
  }
}
