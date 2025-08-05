import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'carrinho_widget.dart' show CarrinhoWidget;
import 'package:flutter/material.dart';

class CarrinhoModel extends FlutterFlowModel<CarrinhoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - detectarAndroidOuIOS] action in webNotBaixar widget.
  bool? retorno;
  // Stores action output result for [Firestore Query - Query a collection] action in webNotBaixar widget.
  LinkRecord? respostaAndroid2;
  // Stores action output result for [Firestore Query - Query a collection] action in webNotBaixar widget.
  LinkRecord? respostaIos2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button2 widget.
  CarrinhoRecord? queryCardCopy2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button2 widget.
  List<CarrinhoFinalRecord>? listCardFinal2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button2 widget.
  List<CarrinhoFinalRecord>? listCardFinal;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
