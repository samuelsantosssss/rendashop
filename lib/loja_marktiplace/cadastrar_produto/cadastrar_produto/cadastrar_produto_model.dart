import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastrar_produto_widget.dart' show CadastrarProdutoWidget;
import 'package:flutter/material.dart';

class CadastrarProdutoModel extends FlutterFlowModel<CadastrarProdutoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData33f4556 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadData33f4556 = [];
  List<String> uploadedFileUrls_uploadData33f4556 = [];

  // State field(s) for Checkbox1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox2 widget.
  bool? checkbox2Value;
  bool isDataUploading_uploadData33f4455 = false;
  FFUploadedFile uploadedLocalFile_uploadData33f4455 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData33f4455 = '';

  // State field(s) for nome_produto widget.
  FocusNode? nomeProdutoFocusNode;
  TextEditingController? nomeProdutoTextController;
  String? Function(BuildContext, String?)? nomeProdutoTextControllerValidator;
  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  // State field(s) for descricao333 widget.
  FocusNode? descricao333FocusNode;
  TextEditingController? descricao333TextController;
  String? Function(BuildContext, String?)? descricao333TextControllerValidator;
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
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutoRecord? produtoCriado;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VarianteRecord>? listVariante;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VarianteRecord>? listVariante2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeProdutoFocusNode?.dispose();
    nomeProdutoTextController?.dispose();

    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();

    descricao333FocusNode?.dispose();
    descricao333TextController?.dispose();

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
