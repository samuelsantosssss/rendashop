import '/backend/backend.dart';
import '/components/limite_inicial_scroll_feed_widget.dart';
import '/components/limpa_cache2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/venda/atualizar_afiliado_produto/atualizar_afiliado_produto_widget.dart';
import '/index.dart';
import 'pagina_produto_afiliado_widget.dart' show PaginaProdutoAfiliadoWidget;
import 'package:flutter/material.dart';

class PaginaProdutoAfiliadoModel
    extends FlutterFlowModel<PaginaProdutoAfiliadoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for limpaCache2 component.
  late LimpaCache2Model limpaCache2Model;
  // Model for limiteInicialScrollFeed component.
  late LimiteInicialScrollFeedModel limiteInicialScrollFeedModel;
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
    limpaCache2Model = createModel(context, () => LimpaCache2Model());
    limiteInicialScrollFeedModel =
        createModel(context, () => LimiteInicialScrollFeedModel());
    atualizarAfiliadoProdutoModel =
        createModel(context, () => AtualizarAfiliadoProdutoModel());
  }

  @override
  void dispose() {
    limpaCache2Model.dispose();
    limiteInicialScrollFeedModel.dispose();
    atualizarAfiliadoProdutoModel.dispose();
  }
}
