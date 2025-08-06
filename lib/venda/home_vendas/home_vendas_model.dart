import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando22/carregando22_widget.dart';
import '/carregando/carregando23/carregando23_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_venda/nav_bar_venda_widget.dart';
import '/venda/naotem_produto/naotem_produto_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_vendas_widget.dart' show HomeVendasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeVendasModel extends FlutterFlowModel<HomeVendasWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in home-Vendas widget.
  List<PedidosTotalRecord>? query11;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<PedidosTotalRecord>? query1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<PedidosTotalRecord>? query2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<PedidosTotalRecord>? query3;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<PedidosTotalRecord>? query4;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<PedidosTotalRecord>? query5;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ProdutoAfiliadoRecord? existeQuery;
  // Model for NavBar-venda component.
  late NavBarVendaModel navBarVendaModel;

  @override
  void initState(BuildContext context) {
    navBarVendaModel = createModel(context, () => NavBarVendaModel());
  }

  @override
  void dispose() {
    navBarVendaModel.dispose();
  }
}
