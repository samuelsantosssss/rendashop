import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/promocao_relampago/time_promo_home/time_promo_home_widget.dart';
import '/loja/promocao_relampago/updata_promo_home/updata_promo_home_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_p_c_widget.dart' show HomePCWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePCModel extends FlutterFlowModel<HomePCWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for timePromoHome component.
  late TimePromoHomeModel timePromoHomeModel;
  // Model for updataPromoHome component.
  late UpdataPromoHomeModel updataPromoHomeModel;

  @override
  void initState(BuildContext context) {
    timePromoHomeModel = createModel(context, () => TimePromoHomeModel());
    updataPromoHomeModel = createModel(context, () => UpdataPromoHomeModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    timePromoHomeModel.dispose();
    updataPromoHomeModel.dispose();
  }
}
