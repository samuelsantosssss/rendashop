import '/flutter_flow/flutter_flow_util.dart';
import 'capsula_variacao_atualizar_widget.dart'
    show CapsulaVariacaoAtualizarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CapsulaVariacaoAtualizarModel
    extends FlutterFlowModel<CapsulaVariacaoAtualizarWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataOnp0 = false;
  FFUploadedFile uploadedLocalFile_uploadDataOnp0 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOnp0 = '';

  bool isDataUploading_uploadDataOnp22 = false;
  FFUploadedFile uploadedLocalFile_uploadDataOnp22 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOnp22 = '';

  bool isDataUploading_uploadDataOnp33 = false;
  FFUploadedFile uploadedLocalFile_uploadDataOnp33 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOnp33 = '';

  // State field(s) for SwitchListTile1 widget.
  bool? switchListTile1Value;
  // State field(s) for SwitchListTile2 widget.
  bool? switchListTile2Value;
  // State field(s) for SwitchListTile3 widget.
  bool? switchListTile3Value1;
  // State field(s) for SwitchListTile3 widget.
  bool? switchListTile3Value2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late MaskTextInputFormatter textFieldMask;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
