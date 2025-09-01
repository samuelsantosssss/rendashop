import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'variante_widget.dart' show VarianteWidget;
import 'package:flutter/material.dart';

class VarianteModel extends FlutterFlowModel<VarianteWidget> {
  ///  Local state fields for this component.

  DocumentReference? produtoRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in baixo widget.
  List<CarrinhoRecord>? respostaCarrinho;
  // Stores action output result for [Firestore Query - Query a collection] action in baixo2 widget.
  List<CarrinhoRecord>? respostaCarrinho1;
  // Stores action output result for [Firestore Query - Query a collection] action in Stack widget.
  List<CarrinhoRecord>? respostaCarrinho5;
  // Stores action output result for [Firestore Query - Query a collection] action in baixo widget.
  List<CarrinhoRecord>? respostaCarrinho2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
