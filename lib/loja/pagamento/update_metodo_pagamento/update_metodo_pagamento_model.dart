import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/carregando/carregando13/carregando13_widget.dart';
import '/carregando/carregando14/carregando14_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/imposto_i_c_m_s/imposto_i_c_m_s_widget.dart';
import '/loja/imposto_importacao/imposto_importacao_widget.dart';
import '/loja/taxa_processamento/taxa_processamento_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'update_metodo_pagamento_widget.dart' show UpdateMetodoPagamentoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateMetodoPagamentoModel
    extends FlutterFlowModel<UpdateMetodoPagamentoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox111 widget.
  bool? checkbox111Value;
  // State field(s) for Checkbox222 widget.
  bool? checkbox222Value;
  // State field(s) for Checkbox333 widget.
  bool? checkbox333Value;
  // Stores action output result for [Backend Call - API (ObterIP)] action in cartao widget.
  ApiCallResponse? apiResultIPP;
  // Stores action output result for [Backend Call - API (Asaas Pagamento)] action in cartao widget.
  ApiCallResponse? apiResulto13;
  // Stores action output result for [Backend Call - API (Pag Pix MP)] action in Button widget.
  ApiCallResponse? mercadopago2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
