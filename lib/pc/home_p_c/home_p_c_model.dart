import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo_home/time_promo_home_widget.dart';
import '/loja/promocao_relampago/updata_promo_home/updata_promo_home_widget.dart';
import '/pc/rodape/rodape_widget.dart';
import '/index.dart';
import 'home_p_c_widget.dart' show HomePCWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePCModel extends FlutterFlowModel<HomePCWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 2;

  // Model for timePromoHome component.
  late TimePromoHomeModel timePromoHomeModel;
  // Model for updataPromoHome component.
  late UpdataPromoHomeModel updataPromoHomeModel;
  // Model for rodape component.
  late RodapeModel rodapeModel;

  @override
  void initState(BuildContext context) {
    timePromoHomeModel = createModel(context, () => TimePromoHomeModel());
    updataPromoHomeModel = createModel(context, () => UpdataPromoHomeModel());
    rodapeModel = createModel(context, () => RodapeModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    timePromoHomeModel.dispose();
    updataPromoHomeModel.dispose();
    rodapeModel.dispose();
  }
}
