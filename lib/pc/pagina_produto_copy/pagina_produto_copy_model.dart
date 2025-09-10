import '/backend/backend.dart';
import '/components/limpa_cache2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import '/index.dart';
import 'dart:async';
import 'pagina_produto_copy_widget.dart' show PaginaProdutoCopyWidget;
import 'package:flutter/material.dart';

class PaginaProdutoCopyModel extends FlutterFlowModel<PaginaProdutoCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for limpaCache2 component.
  late LimpaCache2Model limpaCache2Model;
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
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CarrinhoRecord>? respostaCarrinho2;
  // Stores action output result for [Firestore Query - Query a collection] action in Text4444foto widget.
  List<CarrinhoRecord>? respostaCarrinho;
  // Stores action output result for [Firestore Query - Query a collection] action in TextFoto widget.
  List<CarrinhoRecord>? respostaCarrinho3;
  // Stores action output result for [Firestore Query - Query a collection] action in TextSemFoto widget.
  List<CarrinhoRecord>? respostaCarrinho5;
  // Stores action output result for [Firestore Query - Query a collection] action in Text3333 widget.
  List<CarrinhoRecord>? respostaCarrinhSemVariante1;

  @override
  void initState(BuildContext context) {
    limpaCache2Model = createModel(context, () => LimpaCache2Model());
    timePromoModel = createModel(context, () => TimePromoModel());
  }

  @override
  void dispose() {
    limpaCache2Model.dispose();
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
