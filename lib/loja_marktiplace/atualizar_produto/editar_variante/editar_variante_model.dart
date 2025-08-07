import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_variante_widget.dart' show EditarVarianteWidget;
import 'package:flutter/material.dart';

class EditarVarianteModel extends FlutterFlowModel<EditarVarianteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode;
  TextEditingController? preco12TextController;
  String? Function(BuildContext, String?)? preco12TextControllerValidator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode;
  TextEditingController? estoque12TextController;
  String? Function(BuildContext, String?)? estoque12TextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VarianteRecord>? listVariante2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VarianteRecord>? respostaQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VarianteRecord>? respostaQuery2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    preco12FocusNode?.dispose();
    preco12TextController?.dispose();

    estoque12FocusNode?.dispose();
    estoque12TextController?.dispose();
  }
}
