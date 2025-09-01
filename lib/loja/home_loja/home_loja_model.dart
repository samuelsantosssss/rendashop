import '/backend/api_requests/api_calls.dart';
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

  // Stores action output result for [Backend Call - API (ObterIP)] action in Home-loja widget.
  ApiCallResponse? apiResultp48;
  // Stores action output result for [Firestore Query - Query a collection] action in Home-loja widget.
  List<BaixarAppRecord>? query357;
  // Stores action output result for [Custom Action - mapeamentoBaixarHomePaginaProduto] action in Home-loja widget.
  DocumentReference? retorno1;
  // Stores action output result for [Firestore Query - Query a collection] action in Home-loja widget.
  BaixarAppRecord? query4;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 2;

  // Model for timePromoHome component.
  late TimePromoHomeModel timePromoHomeModel;
  // Model for updataPromoHome component.
  late UpdataPromoHomeModel updataPromoHomeModel;
  // Model for NavBar-home component.
  late NavBarHomeModel navBarHomeModel;

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
