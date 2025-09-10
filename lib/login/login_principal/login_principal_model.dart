import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/limpar_cache_img/limpar_cache_img_widget.dart';
import '/index.dart';
import 'login_principal_widget.dart' show LoginPrincipalWidget;
import 'package:flutter/material.dart';

class LoginPrincipalModel extends FlutterFlowModel<LoginPrincipalWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for limparCacheImg component.
  late LimparCacheImgModel limparCacheImgModel;
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
  // Stores action output result for [Firestore Query - Query a collection] action in naotem widget.
  UserRecord? exiteContaQuery;

  @override
  void initState(BuildContext context) {
    limparCacheImgModel = createModel(context, () => LimparCacheImgModel());
    senhaVisibility = false;
  }

  @override
  void dispose() {
    limparCacheImgModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
