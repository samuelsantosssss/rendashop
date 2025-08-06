import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'login_afiliado_card_widget.dart' show LoginAfiliadoCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginAfiliadoCardModel extends FlutterFlowModel<LoginAfiliadoCardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in tem widget.
  UserRecord? exiteContaQuery2;
  // Stores action output result for [Firestore Query - Query a collection] action in tem widget.
  List<CarrinhoRecord>? queryList777;
  // Stores action output result for [Firestore Query - Query a collection] action in tem widget.
  List<CarrinhoFinalRecord>? listCardFinal222;
  // Stores action output result for [Firestore Query - Query a collection] action in tem widget.
  List<CarrinhoFinalRecord>? listCardFinalll;
  // Stores action output result for [Firestore Query - Query a collection] action in naotem widget.
  UserRecord? exiteContaQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in naotem widget.
  List<CarrinhoRecord>? queryList77;
  // Stores action output result for [Firestore Query - Query a collection] action in naotem widget.
  List<CarrinhoFinalRecord>? listCardFinal22;
  // Stores action output result for [Firestore Query - Query a collection] action in naotem widget.
  List<CarrinhoFinalRecord>? listCardFinall;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoRecord>? queryList7;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinal2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinal;

  @override
  void initState(BuildContext context) {
    senhaVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
