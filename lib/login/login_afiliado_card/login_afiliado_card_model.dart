import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/limpar_cache_img/limpar_cache_img_widget.dart';
import '/index.dart';
import 'login_afiliado_card_widget.dart' show LoginAfiliadoCardWidget;
import 'package:flutter/material.dart';

class LoginAfiliadoCardModel extends FlutterFlowModel<LoginAfiliadoCardWidget> {
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
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoRecord>? queryList78;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinal28;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoFinalRecord>? listCardFinal3;

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
