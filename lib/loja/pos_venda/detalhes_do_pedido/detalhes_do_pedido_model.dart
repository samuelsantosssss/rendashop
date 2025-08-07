import '/flutter_flow/flutter_flow_util.dart';
import '/loja/pos_venda/time_pix4/time_pix4_widget.dart';
import '/index.dart';
import 'detalhes_do_pedido_widget.dart' show DetalhesDoPedidoWidget;
import 'package:flutter/material.dart';

class DetalhesDoPedidoModel extends FlutterFlowModel<DetalhesDoPedidoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for timePix4 component.
  late TimePix4Model timePix4Model;

  @override
  void initState(BuildContext context) {
    timePix4Model = createModel(context, () => TimePix4Model());
  }

  @override
  void dispose() {
    timePix4Model.dispose();
  }
}
