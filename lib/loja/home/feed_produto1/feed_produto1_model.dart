import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo_home/time_promo_home_widget.dart';
import '/loja/promocao_relampago/updata_promo_home/updata_promo_home_widget.dart';
import 'feed_produto1_widget.dart' show FeedProduto1Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeedProduto1Model extends FlutterFlowModel<FeedProduto1Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 2;

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
    timePromoHomeModel.dispose();
    updataPromoHomeModel.dispose();
  }
}
