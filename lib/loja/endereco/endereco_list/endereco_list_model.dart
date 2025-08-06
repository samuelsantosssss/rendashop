import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'endereco_list_widget.dart' show EnderecoListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnderecoListModel extends FlutterFlowModel<EnderecoListWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CarrinhoFinalRecord>? listCardFinal6;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<CarrinhoFinalRecord>? listCardFinal5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
