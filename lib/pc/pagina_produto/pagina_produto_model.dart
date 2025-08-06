import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/caregando2/caregando2_widget.dart';
import '/carregando/carregando1/carregando1_widget.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/components/avaliacao_loja_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/addto_card/addto_card_widget.dart';
import '/loja/cartao_feed/cartao_feed_widget.dart';
import '/loja/frete/frete_widget.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import '/loja/variante/variante_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:badges/badges.dart' as badges;
import 'pagina_produto_widget.dart' show PaginaProdutoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaProdutoModel extends FlutterFlowModel<PaginaProdutoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  Completer<ProdutoRecord>? documentRequestCompleter;
  // Model for timePromo component.
  late TimePromoModel timePromoModel;
  // Stores action output result for [Custom Action - detectarAndroidOuIOS] action in webNotBaixar widget.
  bool? retorno;
  // Stores action output result for [Firestore Query - Query a collection] action in webNotBaixar widget.
  LinkRecord? respostaAndroid2;
  // Stores action output result for [Firestore Query - Query a collection] action in webNotBaixar widget.
  LinkRecord? respostaIos2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CarrinhoRecord>? respostaCarrinho2;
  // Stores action output result for [Firestore Query - Query a collection] action in Text4444foto widget.
  List<CarrinhoRecord>? respostaCarrinho;
  // Stores action output result for [Firestore Query - Query a collection] action in Text22222 widget.
  List<CarrinhoRecord>? respostaCarrinho3;
  // Stores action output result for [Firestore Query - Query a collection] action in Text3333 widget.
  List<CarrinhoRecord>? respostaCarrinhSemVariante1;

  @override
  void initState(BuildContext context) {
    timePromoModel = createModel(context, () => TimePromoModel());
  }

  @override
  void dispose() {
    timePromoModel.dispose();
  }

  /// Additional helper methods.
  Future waitForDocumentRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = documentRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
