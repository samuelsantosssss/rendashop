import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/limite_inicial_scroll_feed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/limpar_cache_img/limpar_cache_img_widget.dart';
import '/nav_bar/nav_bar_home/nav_bar_home_widget.dart';
import '/index.dart';
import 'home_loja_widget.dart' show HomeLojaWidget;
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
  // Model for limiteInicialScrollFeed component.
  late LimiteInicialScrollFeedModel limiteInicialScrollFeedModel;
  // Model for NavBar-home component.
  late NavBarHomeModel navBarHomeModel;
  // Model for limparCacheImg component.
  late LimparCacheImgModel limparCacheImgModel;

  @override
  void initState(BuildContext context) {
    limiteInicialScrollFeedModel =
        createModel(context, () => LimiteInicialScrollFeedModel());
    navBarHomeModel = createModel(context, () => NavBarHomeModel());
    limparCacheImgModel = createModel(context, () => LimparCacheImgModel());
  }

  @override
  void dispose() {
    limiteInicialScrollFeedModel.dispose();
    navBarHomeModel.dispose();
    limparCacheImgModel.dispose();
  }
}
