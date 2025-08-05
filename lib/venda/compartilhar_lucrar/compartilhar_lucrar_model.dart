import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'compartilhar_lucrar_widget.dart' show CompartilharLucrarWidget;
import 'package:flutter/material.dart';

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
