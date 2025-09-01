// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<void> criarPedidos(
  String userId,
  List<CarrinhoRecord> produtosCarrinho,
  List<CarrinhoFinalRecord> listCarrinhoFinal,
) async {
  if (userId.isEmpty) {
    print('ID do usuário não fornecido');
    return;
  }

  if (produtosCarrinho.isEmpty) {
    return;
  }

  String gerarIdUnico() {
    const caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        15, (_) => caracteres.codeUnitAt(random.nextInt(caracteres.length))));
  }

  final userDocRef = FirebaseFirestore.instance.collection('user').doc(userId);
  final userDoc = await userDocRef.get();
  final enderecoCompleto =
      userDoc.data()?['endereco_completo'] as String? ?? '';
  final cpfCliente = userDoc.data()?['CPF'] as String? ?? '';
  final enderecoRef = userDoc.data()?['endereco_ref'] as DocumentReference?;

  List<DocumentReference> pedidosCriados = [];

  int quantidadePedidos = produtosCarrinho.length;
  double taxaProcessamentoPorPedido =
      FFAppState().taxaCartaoDouble / quantidadePedidos;

  double valorMoedaPorPedido = FFAppState().moeda / quantidadePedidos;
  double resto = FFAppState().moeda - valorMoedaPorPedido * quantidadePedidos;
  if (resto != 0) {
    double ajuste = (resto > 0) ? 0.01 : -0.01;
    valorMoedaPorPedido += ajuste;
  }

  // Mapa para armazenar afiliados e suas comissões
  Map<String, List<double>> resumoAfiliadoComissoes = {};

  for (var produto in produtosCarrinho) {
    // Procurar o documento CarrinhoFinal correspondente a esse produto
    CarrinhoFinalRecord? carrinhoFinal;
    try {
      carrinhoFinal = listCarrinhoFinal.firstWhere(
        (c) => c.listProdutos.any((p) => p.contains(produto.itens?.path ?? '')),
      );
    } catch (e) {
      carrinhoFinal = null;
    }

    double frete = 0.0;

    if (carrinhoFinal != null) {
      // Verifica se há frete promocional
      final String fretePromoString = carrinhoFinal.fretePromo ?? '';
      double? fretePromo = double.tryParse(
          fretePromoString.replaceAll('R\$', '').replaceAll(',', '.'));

      double valorFreteOriginal = carrinhoFinal.frete ?? 0.0;

      double freteConsiderado =
          fretePromo != null ? fretePromo : valorFreteOriginal;

      int qtdProdutosNoCarrinhoFinal = carrinhoFinal.listProdutos.length;

      if (qtdProdutosNoCarrinhoFinal > 0) {
        frete = freteConsiderado / qtdProdutosNoCarrinhoFinal;
      }
    }

    final pedidoRef = FirebaseFirestore.instance.collection('pedidos_total');

    double preco = produto.preco ?? 0.0;
    int quantidade = produto.quantidade ?? 0;
    double totalPedido = preco * quantidade + frete;

    double taxaPercentual = 0.13;
    int taxaPorItem = 4;

    double comissaoAfiliado = 0.0;
    DocumentReference? afiliadoRef;

    if (carrinhoFinal != null) {
      for (var produtoStr in carrinhoFinal.listProdutos) {
        if (produtoStr.contains(produto.itens?.path ?? '')) {
          final comissaoMatch =
              RegExp(r'\(afiliadoComissao "([^"]+)"\)').firstMatch(produtoStr);
          if (comissaoMatch != null) {
            comissaoAfiliado =
                double.tryParse(comissaoMatch.group(1) ?? '0') ?? 0.0;
          }

          final refMatch =
              RegExp(r'\(afiliadoRef "([^"]+)"\)').firstMatch(produtoStr);
          if (refMatch != null && refMatch.group(1) != null) {
            afiliadoRef = FirebaseFirestore.instance.doc(refMatch.group(1)!);
          }
          break;
        }
      }
    }

    double totalInicial = preco * quantidade;

    double valorBaseComissoes = totalInicial;
    if (comissaoAfiliado > 0) {
      valorBaseComissoes = totalInicial - comissaoAfiliado;
    }

    double comissaoRendaShop =
        (valorBaseComissoes * taxaPercentual) + (taxaPorItem * quantidade);

    double comissaoLojista = valorBaseComissoes -
        (valorBaseComissoes * taxaPercentual) -
        (taxaPorItem * quantidade);

    if (frete > 0) {
      comissaoRendaShop += frete;
    }

    double totalPedidoSemFrete = preco * quantidade;
    final DateTime time24h = DateTime.now().add(Duration(hours: 24));

    double icms = produto.icms ?? 0.0;
    double impostoImportacao = produto.impostoImportacao ?? 0.0;

    Map<String, dynamic> pedidoData = {
      'status':
          FFAppState().statusPagamento == 'pago' ? 'preparando' : 'naopago',
      'userRef': userDocRef,
      'nome': produto.titulo,
      'imagem': produto.fotoCapa,
      'produtoRef': produto.itens,
      'endereco_completo': enderecoCompleto,
      'CPF_cliente': cpfCliente,
      'quantidade': quantidade,
      'preco': preco,
      'lojaRef': produto.lojaRef,
      'frete': frete,
      'variacao': produto.variacao,
      'id_pedido': gerarIdUnico(),
      'data_pedido': FieldValue.serverTimestamp(),
      'preco_antes': produto.precoAntes ?? 0.0,
      'comissao_lojista': comissaoLojista,
      'comissao_RendaShop': comissaoRendaShop,
      'endereco_ref': enderecoRef,
      'totalPedido': totalPedido,
      'totalPedidoSemFrete': totalPedidoSemFrete,
      'ID_asaas': FFAppState().IDasaas,
      'status_pagamento': FFAppState().statusPagamento,
      'time24h': Timestamp.fromDate(time24h),
      'forma_pagamento': FFAppState().metodoPagamento,
      'taxaProcessamento': taxaProcessamentoPorPedido,
      'icms': icms,
      'impostoImportacao': impostoImportacao,
    };

    if (comissaoAfiliado > 0 && afiliadoRef != null) {
      pedidoData['comissao_afiliado'] = comissaoAfiliado;
      pedidoData['afiliadoRef'] = afiliadoRef;

      // Acrescenta ao resumo
      final pathAfiliado = '/${afiliadoRef.path}';
      resumoAfiliadoComissoes.putIfAbsent(pathAfiliado, () => []);
      resumoAfiliadoComissoes[pathAfiliado]!.add(comissaoAfiliado);
    }

    if (FFAppState().chavePix.isNotEmpty) {
      pedidoData['chavePix'] = FFAppState().chavePix;
    }

    if (FFAppState().idPix != null) {
      pedidoData['idPix'] = FFAppState().idPix;
    }

    DocumentReference novoPedido = await pedidoRef.add(pedidoData);
    pedidosCriados.add(novoPedido);

    final produtoRef = produto.itens;
    if (produtoRef != null) {
      await produtoRef.update({
        'vendas': FieldValue.increment(1),
      });
    }

    await novoPedido.update({
      'moedas': valorMoedaPorPedido,
    });
  }

  for (var pedidoRef in pedidosCriados) {
    await pedidoRef.update({
      'pedidos_list': pedidosCriados,
      'totalGeralPedidos': FFAppState().totalPedido,
    });
  }

  final carrinhoRef = FirebaseFirestore.instance
      .collection('user')
      .doc(userId)
      .collection('carrinho');

  for (var produto in produtosCarrinho) {
    await carrinhoRef.doc(produto.reference.id).delete();
  }

  FFAppState().listRefPedido = pedidosCriados;

  // Construir a string de notificação de afiliado
  String resumoFinal = '';
  resumoAfiliadoComissoes.forEach((usuario, comissoes) {
    final comissoesFormatadas = comissoes
        .map((valor) =>
            '(comissao${comissoes.indexOf(valor) + 1} "R\$${valor.toStringAsFixed(2).replaceAll('.', ',')}")')
        .join(' ');
    resumoFinal += '(usuario "$usuario") $comissoesFormatadas ';
  });

  FFAppState().notificaafiliado = resumoFinal.trim();

  print(
      'Todos os pedidos foram criados com sucesso e os produtos foram removidos do carrinho!');
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
