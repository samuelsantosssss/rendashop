import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'atualizar_afiliado_produto_model.dart';
export 'atualizar_afiliado_produto_model.dart';

class AtualizarAfiliadoProdutoWidget extends StatefulWidget {
  const AtualizarAfiliadoProdutoWidget({
    super.key,
    required this.produtoRef,
    required this.afiliadoProRef,
    this.dataAtualizacaoProduto,
    this.dataAtualizacaoAfiliado,
    required this.exiteVariante,
  });

  final DocumentReference? produtoRef;
  final DocumentReference? afiliadoProRef;
  final DateTime? dataAtualizacaoProduto;
  final DateTime? dataAtualizacaoAfiliado;
  final bool? exiteVariante;

  @override
  State<AtualizarAfiliadoProdutoWidget> createState() =>
      _AtualizarAfiliadoProdutoWidgetState();
}

class _AtualizarAfiliadoProdutoWidgetState
    extends State<AtualizarAfiliadoProdutoWidget> {
  late AtualizarAfiliadoProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AtualizarAfiliadoProdutoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.dataAtualizacaoProduto != null) {
        if (widget.dataAtualizacaoProduto == widget.dataAtualizacaoAfiliado) {
          return;
        }

        _model.query = await queryProdutoRecordOnce(
          queryBuilder: (produtoRecord) => produtoRecord.where(
            'produtoRef',
            isEqualTo: widget.produtoRef,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (widget.exiteVariante == true) {
          _model.listVariante = await queryVarianteRecordOnce(
            parent: widget.produtoRef,
          );

          await widget.afiliadoProRef!.update({
            ...createProdutoAfiliadoRecordData(
              ultimaAtualizacao: widget.dataAtualizacaoProduto,
              menorPreco:
                  functions.menorValorVatiente(_model.listVariante!.toList()),
              comissao: _model.query?.comissaoAfiliado.toDouble(),
            ),
            ...mapToFirestore(
              {
                'valorComRef': functions.listaVarianteAfiliado(
                    _model.listVariante!.toList(), 0.0),
              },
            ),
          });
          return;
        } else {
          await widget.afiliadoProRef!.update(createProdutoAfiliadoRecordData(
            valor: _model.query?.preco,
            comissao: _model.query?.comissaoAfiliado.toDouble(),
            ultimaAtualizacao: widget.dataAtualizacaoProduto,
          ));
          return;
        }
      } else {
        return;
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
