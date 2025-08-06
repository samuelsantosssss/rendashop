import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando23/carregando23_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'minhas_vendas_widget.dart' show MinhasVendasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MinhasVendasModel extends FlutterFlowModel<MinhasVendasWidget> {
  ///  State fields for stateful widgets in this page.

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
