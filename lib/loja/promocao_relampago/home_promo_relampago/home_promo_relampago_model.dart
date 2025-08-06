import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_promo_relampago_widget.dart' show HomePromoRelampagoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePromoRelampagoModel
    extends FlutterFlowModel<HomePromoRelampagoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for timePromo component.
  late TimePromoModel timePromoModel;

  @override
  void initState(BuildContext context) {
    timePromoModel = createModel(context, () => TimePromoModel());
  }

  @override
  void dispose() {
    timePromoModel.dispose();
  }
}
