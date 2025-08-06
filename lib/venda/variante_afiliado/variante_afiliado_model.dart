import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/addtocart3/addtocart3_widget.dart';
import '/carregando/caregando2/caregando2_widget.dart';
import '/components/addtocard2_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'variante_afiliado_widget.dart' show VarianteAfiliadoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class VarianteAfiliadoModel extends FlutterFlowModel<VarianteAfiliadoWidget> {
  ///  Local state fields for this component.

  DocumentReference? produtoRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in baixo widget.
  List<CarrinhoRecord>? respostaCarrinho3;
  // Stores action output result for [Firestore Query - Query a collection] action in baixo2 widget.
  List<CarrinhoRecord>? respostaCarrinho1;
  // Stores action output result for [Firestore Query - Query a collection] action in baixo widget.
  List<CarrinhoRecord>? respostaCarrinho4;
  // Stores action output result for [Firestore Query - Query a collection] action in baixo2 widget.
  List<CarrinhoRecord>? respostaCarrinho11;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
