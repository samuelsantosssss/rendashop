import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_p_c_compra_widget.dart' show LoginPCCompraWidget;
import 'package:flutter/material.dart';

class LoginPCCompraModel extends FlutterFlowModel<LoginPCCompraWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for EMAIL widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Senha widget.
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
  List<CarrinhoRecord>? queryList7Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinal2Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinalCopy;
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
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
