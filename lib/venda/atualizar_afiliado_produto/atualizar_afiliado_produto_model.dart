import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'atualizar_afiliado_produto_widget.dart'
    show AtualizarAfiliadoProdutoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AtualizarAfiliadoProdutoModel
    extends FlutterFlowModel<AtualizarAfiliadoProdutoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in atualizarAfiliadoProduto widget.
  ProdutoRecord? query;
  // Stores action output result for [Firestore Query - Query a collection] action in atualizarAfiliadoProduto widget.
  List<VarianteRecord>? listVariante;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
