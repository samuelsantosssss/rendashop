import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'compartilhar_lucrar_widget.dart' show CompartilharLucrarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompartilharLucrarModel
    extends FlutterFlowModel<CompartilharLucrarWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProdutoAfiliadoRecord? queryExiste;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VarianteRecord>? listPorduct2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VarianteRecord>? listPorduct;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutoAfiliadoRecord? updateLink1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutoAfiliadoRecord? updateLink11;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
