import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'deletar_comprar_novamente_model.dart';
export 'deletar_comprar_novamente_model.dart';

class DeletarComprarNovamenteWidget extends StatefulWidget {
  const DeletarComprarNovamenteWidget({
    super.key,
    required this.pedidoRef,
    required this.produtoRef,
  });

  final DocumentReference? pedidoRef;
  final DocumentReference? produtoRef;

  @override
  State<DeletarComprarNovamenteWidget> createState() =>
      _DeletarComprarNovamenteWidgetState();
}

class _DeletarComprarNovamenteWidgetState
    extends State<DeletarComprarNovamenteWidget> {
  late DeletarComprarNovamenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletarComprarNovamenteModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.repsotaa = await queryProdutoRecordOnce(
        queryBuilder: (produtoRecord) => produtoRecord.where(
          'produtoRef',
          isEqualTo: widget.produtoRef,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.repsotaa?.reference != null) {
        return;
      }

      await widget.pedidoRef!.update(createPedidosTotalRecordData(
        produtoExcluido: true,
      ));
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
