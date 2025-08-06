import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'cencelando_pedido2_widget.dart' show CencelandoPedido2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CencelandoPedido2Model extends FlutterFlowModel<CencelandoPedido2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox-1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox-2 widget.
  bool? checkbox2Value;
  // State field(s) for Checkbox-3 widget.
  bool? checkbox3Value;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PedidosTotalRecord? query1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
