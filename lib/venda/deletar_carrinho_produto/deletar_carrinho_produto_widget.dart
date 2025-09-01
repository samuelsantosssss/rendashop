import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'deletar_carrinho_produto_model.dart';
export 'deletar_carrinho_produto_model.dart';

class DeletarCarrinhoProdutoWidget extends StatefulWidget {
  const DeletarCarrinhoProdutoWidget({
    super.key,
    required this.produtoRef,
    required this.carrinhoRef,
  });

  final DocumentReference? produtoRef;
  final DocumentReference? carrinhoRef;

  @override
  State<DeletarCarrinhoProdutoWidget> createState() =>
      _DeletarCarrinhoProdutoWidgetState();
}

class _DeletarCarrinhoProdutoWidgetState
    extends State<DeletarCarrinhoProdutoWidget> {
  late DeletarCarrinhoProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletarCarrinhoProdutoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.repsota = await queryProdutoRecordOnce(
        queryBuilder: (produtoRecord) => produtoRecord.where(
          'produtoRef',
          isEqualTo: widget.produtoRef,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.repsota?.reference != null) {
        return;
      }

      await widget.carrinhoRef!.delete();
      return;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: 1.0,
      decoration: BoxDecoration(),
    );
  }
}
