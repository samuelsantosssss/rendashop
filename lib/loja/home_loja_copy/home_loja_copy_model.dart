import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/limpar_cache_img/limpar_cache_img_widget.dart';
import '/loja/promocao_relampago/time_promo_home/time_promo_home_widget.dart';
import '/loja/promocao_relampago/updata_promo_home/updata_promo_home_widget.dart';
import '/nav_bar/nav_bar_home/nav_bar_home_widget.dart';
import '/index.dart';
import 'home_loja_copy_widget.dart' show HomeLojaCopyWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeLojaCopyModel extends FlutterFlowModel<HomeLojaCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ObterIP)] action in Home-lojaCopy widget.
  ApiCallResponse? apiResultp48;
  // Stores action output result for [Firestore Query - Query a collection] action in Home-lojaCopy widget.
  List<BaixarAppRecord>? query357;
  // Stores action output result for [Custom Action - mapeamentoBaixarHomePaginaProduto] action in Home-lojaCopy widget.
  DocumentReference? retorno1;
  // Stores action output result for [Firestore Query - Query a collection] action in Home-lojaCopy widget.
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
  // Model for limparCacheImg component.
  late LimparCacheImgModel limparCacheImgModel;

  @override
  void initState(BuildContext context) {
    timePromoHomeModel = createModel(context, () => TimePromoHomeModel());
    updataPromoHomeModel = createModel(context, () => UpdataPromoHomeModel());
    navBarHomeModel = createModel(context, () => NavBarHomeModel());
    limparCacheImgModel = createModel(context, () => LimparCacheImgModel());
  }

  @override
  void dispose() {
    timePromoHomeModel.dispose();
    updataPromoHomeModel.dispose();
    navBarHomeModel.dispose();
    limparCacheImgModel.dispose();
  }
}
