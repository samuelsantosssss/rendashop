import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'saque_pix_cadastrar_widget.dart' show SaquePixCadastrarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SaquePixCadastrarModel extends FlutterFlowModel<SaquePixCadastrarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for seupix widget.
  FocusNode? seupixFocusNode;
  TextEditingController? seupixTextController;
  String? Function(BuildContext, String?)? seupixTextControllerValidator;
  // State field(s) for pix_tipo widget.
  FormFieldController<List<String>>? pixTipoValueController;
  String? get pixTipoValue => pixTipoValueController?.value?.firstOrNull;
  set pixTipoValue(String? val) =>
      pixTipoValueController?.value = val != null ? [val] : [];
  // State field(s) for seuabanco widget.
  FocusNode? seuabancoFocusNode;
  TextEditingController? seuabancoTextController;
  String? Function(BuildContext, String?)? seuabancoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    seupixFocusNode?.dispose();
    seupixTextController?.dispose();

    seuabancoFocusNode?.dispose();
    seuabancoTextController?.dispose();
  }
}
