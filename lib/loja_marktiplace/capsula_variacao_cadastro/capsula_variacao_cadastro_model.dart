import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'capsula_variacao_cadastro_widget.dart'
    show CapsulaVariacaoCadastroWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CapsulaVariacaoCadastroModel
    extends FlutterFlowModel<CapsulaVariacaoCadastroWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataOnp = false;
  FFUploadedFile uploadedLocalFile_uploadDataOnp =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOnp = '';

  bool isDataUploading_uploadDataOnp2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataOnp2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOnp2 = '';

  bool isDataUploading_uploadDataOnp3 = false;
  FFUploadedFile uploadedLocalFile_uploadDataOnp3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOnp3 = '';

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
