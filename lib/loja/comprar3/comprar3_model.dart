import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/carregando/carregando13/carregando13_widget.dart';
import '/carregando/carregando14/carregando14_widget.dart';
import '/carregando/carregando5/carregando5_widget.dart';
import '/carregando/carregando6/carregando6_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/cupom/cupom2/cupom2_widget.dart';
import '/loja/icms/icms_widget.dart';
import '/loja/imposto_i_c_m_s/imposto_i_c_m_s_widget.dart';
import '/loja/imposto_importacao/imposto_importacao_widget.dart';
import '/loja/pagamento/moedas_renda_shop/moedas_renda_shop_widget.dart';
import '/loja/pagamento/moedas_renda_shop2/moedas_renda_shop2_widget.dart';
import '/loja/taxa_processamento/taxa_processamento_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'comprar3_widget.dart' show Comprar3Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class Comprar3Model extends FlutterFlowModel<Comprar3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late MaskTextInputFormatter textFieldMask;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Checkbox111 widget.
  bool? checkbox111Value;
  // State field(s) for Checkbox222 widget.
  bool? checkbox222Value;
  // Stores action output result for [Firestore Query - Query a collection] action in RichText widget.
  CartaoRecord? queryCardCopyCopyCopy44;
  // State field(s) for Checkbox333 widget.
  bool? checkbox333Value;
  // Model for ICMS component.
  late IcmsModel icmsModel;
  // Stores action output result for [Backend Call - API (ObterIP)] action in cartao widget.
  ApiCallResponse? apiResultIP;
  // Stores action output result for [Backend Call - API (Asaas Pagamento)] action in cartao widget.
  ApiCallResponse? apiResulto1xxxxxxx;
  // Stores action output result for [Backend Call - API (Asaas Token  Cliente)] action in cartao widget.
  ApiCallResponse? apiResultduu;
  // Stores action output result for [Backend Call - API (ObterIP)] action in cartao widget.
  ApiCallResponse? apiResultIPP;
  // Stores action output result for [Backend Call - API (Asaas Pagamento)] action in cartao widget.
  ApiCallResponse? apiResulto1xx;
  // Stores action output result for [Backend Call - API (Pag Pix MP)] action in Button widget.
  ApiCallResponse? mercadopago;

  @override
  void initState(BuildContext context) {
    icmsModel = createModel(context, () => IcmsModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    icmsModel.dispose();
  }
}
