import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/loja_marktiplace/atualizar_produto/capsula_variacao_atualizar/capsula_variacao_atualizar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'atualizar_produto_widget.dart' show AtualizarProdutoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
