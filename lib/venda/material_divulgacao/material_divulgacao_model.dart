import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'material_divulgacao_widget.dart' show MaterialDivulgacaoWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MaterialDivulgacaoModel
    extends FlutterFlowModel<MaterialDivulgacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
