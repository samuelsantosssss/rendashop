import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import 'dart:async';
import 'pagina_produto_afiliado_scroll_widget.dart'
    show PaginaProdutoAfiliadoScrollWidget;
import 'package:flutter/material.dart';

class PaginaProdutoAfiliadoScrollModel
    extends FlutterFlowModel<PaginaProdutoAfiliadoScrollWidget> {
  ///  State fields for stateful widgets in this component.

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
