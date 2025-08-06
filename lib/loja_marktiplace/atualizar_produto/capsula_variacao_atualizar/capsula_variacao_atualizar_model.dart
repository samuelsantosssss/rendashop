import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'capsula_variacao_atualizar_widget.dart'
    show CapsulaVariacaoAtualizarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

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
