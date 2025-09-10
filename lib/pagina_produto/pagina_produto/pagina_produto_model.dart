import '/backend/backend.dart';
import '/components/limite_inicial_scroll_feed_widget.dart';
import '/components/limpa_cache2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pagina_produto_widget.dart' show PaginaProdutoWidget;
import 'package:flutter/material.dart';

class PaginaProdutoModel extends FlutterFlowModel<PaginaProdutoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for limiteInicialScrollFeed component.
  late LimiteInicialScrollFeedModel limiteInicialScrollFeedModel;
  // Model for limpaCache2 component.
  late LimpaCache2Model limpaCache2Model;
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
    limiteInicialScrollFeedModel =
        createModel(context, () => LimiteInicialScrollFeedModel());
    limpaCache2Model = createModel(context, () => LimpaCache2Model());
  }

  @override
  void dispose() {
    limiteInicialScrollFeedModel.dispose();
    limpaCache2Model.dispose();
  }
}
