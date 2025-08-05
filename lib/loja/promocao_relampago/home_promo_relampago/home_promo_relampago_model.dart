import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import '/index.dart';
import 'home_promo_relampago_widget.dart' show HomePromoRelampagoWidget;
import 'package:flutter/material.dart';

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
