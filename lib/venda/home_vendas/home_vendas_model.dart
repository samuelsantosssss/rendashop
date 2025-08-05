import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar/nav_bar_venda/nav_bar_venda_widget.dart';
import '/index.dart';
import 'home_vendas_widget.dart' show HomeVendasWidget;
import 'package:flutter/material.dart';

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
