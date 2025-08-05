import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'atualizar_produto_widget.dart' show AtualizarProdutoWidget;
import 'package:flutter/material.dart';

class AtualizarProdutoModel extends FlutterFlowModel<AtualizarProdutoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData33f45533 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadData33f45533 = [];
  List<String> uploadedFileUrls_uploadData33f45533 = [];

  // State field(s) for Checkbox1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox2 widget.
  bool? checkbox2Value;
  bool isDataUploading_uploadData33f4455684 = false;
  FFUploadedFile uploadedLocalFile_uploadData33f4455684 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData33f4455684 = '';

  // State field(s) for nome_produto widget.
  FocusNode? nomeProdutoFocusNode;
  TextEditingController? nomeProdutoTextController;
  String? Function(BuildContext, String?)? nomeProdutoTextControllerValidator;
  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  // State field(s) for palavrachave widget.
  FocusNode? palavrachaveFocusNode;
  TextEditingController? palavrachaveTextController;
  String? Function(BuildContext, String?)? palavrachaveTextControllerValidator;
  // State field(s) for precoantes widget.
  FocusNode? precoantesFocusNode;
  TextEditingController? precoantesTextController;
  String? Function(BuildContext, String?)? precoantesTextControllerValidator;
  // State field(s) for preco widget.
  FocusNode? precoFocusNode;
  TextEditingController? precoTextController;
  String? Function(BuildContext, String?)? precoTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for frete-sp widget.
  FocusNode? freteSpFocusNode;
  TextEditingController? freteSpTextController;
  String? Function(BuildContext, String?)? freteSpTextControllerValidator;
  // State field(s) for frete-rg widget.
  FocusNode? freteRgFocusNode;
  TextEditingController? freteRgTextController;
  String? Function(BuildContext, String?)? freteRgTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeProdutoFocusNode?.dispose();
    nomeProdutoTextController?.dispose();

    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();

    palavrachaveFocusNode?.dispose();
    palavrachaveTextController?.dispose();

    precoantesFocusNode?.dispose();
    precoantesTextController?.dispose();

    precoFocusNode?.dispose();
    precoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();

    freteSpFocusNode?.dispose();
    freteSpTextController?.dispose();

    freteRgFocusNode?.dispose();
    freteRgTextController?.dispose();
  }
}
