import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando17/carregando17_widget.dart';
import '/carregando/carregando3/carregando3_widget.dart';
import '/carregando/carregando4/carregando4_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venda/atualizar_carrinho_produto/atualizar_carrinho_produto_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'carrinho_widget.dart' show CarrinhoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
