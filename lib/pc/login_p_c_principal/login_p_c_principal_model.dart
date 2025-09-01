import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_p_c_principal_widget.dart' show LoginPCPrincipalWidget;
import 'package:flutter/material.dart';

class LoginPCPrincipalModel extends FlutterFlowModel<LoginPCPrincipalWidget> {
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
  // Stores action output result for [Firestore Query - Query a collection] action in naotem widget.
  UserRecord? exiteContaQuery;

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
