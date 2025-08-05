import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'apagar_produto_nao_existe_afiliado_model.dart';
export 'apagar_produto_nao_existe_afiliado_model.dart';

class ApagarProdutoNaoExisteAfiliadoWidget extends StatefulWidget {
  const ApagarProdutoNaoExisteAfiliadoWidget({
    super.key,
    required this.produtoAfiliadoRef,
    required this.excluir,
  });

  final DocumentReference? produtoAfiliadoRef;
  final DocumentReference? excluir;

  @override
  State<ApagarProdutoNaoExisteAfiliadoWidget> createState() =>
      _ApagarProdutoNaoExisteAfiliadoWidgetState();
}

class _ApagarProdutoNaoExisteAfiliadoWidgetState
    extends State<ApagarProdutoNaoExisteAfiliadoWidget> {
  late ApagarProdutoNaoExisteAfiliadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApagarProdutoNaoExisteAfiliadoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.respota = await queryProdutoRecordOnce(
        queryBuilder: (produtoRecord) => produtoRecord.where(
          'produtoRef',
          isEqualTo: widget.produtoAfiliadoRef,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!(_model.respota?.reference != null)) {
        await widget.excluir!.delete();
      }
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
