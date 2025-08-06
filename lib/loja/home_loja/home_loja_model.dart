import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/carregando/carregando20/carregando20_widget.dart';
import '/carregando/carregando21/carregando21_widget.dart';
import '/carregando/carregando25/carregando25_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/promocao_relampago/time_promo_home/time_promo_home_widget.dart';
import '/loja/promocao_relampago/updata_promo_home/updata_promo_home_widget.dart';
import '/nav_bar/nav_bar_home/nav_bar_home_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_loja_widget.dart' show HomeLojaWidget;
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeLojaModel extends FlutterFlowModel<HomeLojaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 2;

  // Model for timePromoHome component.
  late TimePromoHomeModel timePromoHomeModel;
  // Model for updataPromoHome component.
  late UpdataPromoHomeModel updataPromoHomeModel;
  // Stores action output result for [Custom Action - firebaseDiagnostic] action in Container widget.
  String? retorno5;
  // Model for NavBar-home component.
  late NavBarHomeModel navBarHomeModel;
  // Stores action output result for [Custom Action - detectarAndroidOuIOS] action in webNotBaixar widget.
  bool? retorno;
  // Stores action output result for [Firestore Query - Query a collection] action in webNotBaixar widget.
  LinkRecord? respostaAndroid2;
  // Stores action output result for [Firestore Query - Query a collection] action in webNotBaixar widget.
  LinkRecord? respostaIos2;

  @override
  void initState(BuildContext context) {
    timePromoHomeModel = createModel(context, () => TimePromoHomeModel());
    updataPromoHomeModel = createModel(context, () => UpdataPromoHomeModel());
    navBarHomeModel = createModel(context, () => NavBarHomeModel());
  }

  @override
  void dispose() {
    timePromoHomeModel.dispose();
    updataPromoHomeModel.dispose();
    navBarHomeModel.dispose();
  }
}
