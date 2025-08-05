import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo_home/time_promo_home_widget.dart';
import '/loja/promocao_relampago/updata_promo_home/updata_promo_home_widget.dart';
import '/nav_bar/nav_bar_home/nav_bar_home_widget.dart';
import '/index.dart';
import 'home_loja_widget.dart' show HomeLojaWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
