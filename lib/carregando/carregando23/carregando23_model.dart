import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'carregando23_widget.dart' show Carregando23Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Carregando23Model extends FlutterFlowModel<Carregando23Widget> {
  ///  State fields for stateful widgets in this component.

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
