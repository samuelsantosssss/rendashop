import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'atualizar_carrinho_produto_model.dart';
export 'atualizar_carrinho_produto_model.dart';

class AtualizarCarrinhoProdutoWidget extends StatefulWidget {
  const AtualizarCarrinhoProdutoWidget({
    super.key,
    required this.produtoRef,
    this.dataAtualizacaoProduto,
    this.dataAtualizacaoCarrinho,
    required this.exiteVariante,
    required this.carrinhoRef,
    this.preco,
    this.precoVariante,
  });

  final DocumentReference? produtoRef;
  final DateTime? dataAtualizacaoProduto;
  final DateTime? dataAtualizacaoCarrinho;
  final bool? exiteVariante;
  final DocumentReference? carrinhoRef;
  final double? preco;
  final double? precoVariante;

  @override
  State<AtualizarCarrinhoProdutoWidget> createState() =>
      _AtualizarCarrinhoProdutoWidgetState();
}

class _AtualizarCarrinhoProdutoWidgetState
    extends State<AtualizarCarrinhoProdutoWidget> {
  late AtualizarCarrinhoProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AtualizarCarrinhoProdutoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.dataAtualizacaoProduto != null) {
        if (widget.dataAtualizacaoProduto == widget.dataAtualizacaoCarrinho) {
          return;
        }

        if (widget.exiteVariante == true) {
          await widget.carrinhoRef!.update(createCarrinhoRecordData(
            preco: widget.precoVariante,
            utimaAtializacaoCarrinho: widget.dataAtualizacaoProduto,
          ));
        } else {
          await widget.carrinhoRef!.update(createCarrinhoRecordData(
            preco: widget.preco,
            utimaAtializacaoCarrinho: widget.dataAtualizacaoProduto,
          ));
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
