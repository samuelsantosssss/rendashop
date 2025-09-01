import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import '/venda/atualizar_afiliado_produto/atualizar_afiliado_produto_widget.dart';
import '/index.dart';
import 'dart:async';
import 'pagina_produto_afiliado_widget.dart' show PaginaProdutoAfiliadoWidget;
import 'package:flutter/material.dart';

class PaginaProdutoAfiliadoModel
    extends FlutterFlowModel<PaginaProdutoAfiliadoWidget> {
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
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CarrinhoRecord>? respostaCarrinho2;
  // Stores action output result for [Firestore Query - Query a collection] action in Text4444foto widget.
  List<CarrinhoRecord>? respostaCarrinho;
  // Stores action output result for [Firestore Query - Query a collection] action in TextFoto widget.
  List<CarrinhoRecord>? respostaCarrinhooo;
  // Stores action output result for [Firestore Query - Query a collection] action in TextSemFoto widget.
  List<CarrinhoRecord>? respostaCarrinhooo3;
  // Stores action output result for [Firestore Query - Query a collection] action in Text3333 widget.
  List<CarrinhoRecord>? respostaCarrinhSemVariante1;
  // Model for atualizarAfiliadoProduto component.
  late AtualizarAfiliadoProdutoModel atualizarAfiliadoProdutoModel;

  @override
  void initState(BuildContext context) {
    timePromoModel = createModel(context, () => TimePromoModel());
    atualizarAfiliadoProdutoModel =
        createModel(context, () => AtualizarAfiliadoProdutoModel());
  }

  @override
  void dispose() {
    timePromoModel.dispose();
    atualizarAfiliadoProdutoModel.dispose();
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
