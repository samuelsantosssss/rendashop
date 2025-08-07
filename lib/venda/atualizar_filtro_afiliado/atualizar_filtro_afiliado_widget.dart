import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'atualizar_filtro_afiliado_model.dart';
export 'atualizar_filtro_afiliado_model.dart';

class AtualizarFiltroAfiliadoWidget extends StatefulWidget {
  const AtualizarFiltroAfiliadoWidget({
    super.key,
    required this.documentList,
  });

  final List<PedidosTotalRecord>? documentList;

  @override
  State<AtualizarFiltroAfiliadoWidget> createState() =>
      _AtualizarFiltroAfiliadoWidgetState();
}

class _AtualizarFiltroAfiliadoWidgetState
    extends State<AtualizarFiltroAfiliadoWidget> {
  late AtualizarFiltroAfiliadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AtualizarFiltroAfiliadoModel());

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
