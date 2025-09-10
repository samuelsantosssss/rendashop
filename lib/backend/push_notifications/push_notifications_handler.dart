import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? isWeb
          ? Container()
          : Container(
              color: Colors.black,
              child: Center(
                child: Image.asset(
                  'assets/images/Ainda_no_Existem_Pedidos_(31).png',
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Home-loja': ParameterData.none(),
  'Pagina_produto': (data) async => ParameterData(
        allParams: {
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
  'Compartilhar_Lucrar': (data) async => ParameterData(
        allParams: {
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
          'maiorValorAfiliado':
              getParameter<double>(data, 'maiorValorAfiliado'),
          'menorValorAfiliado':
              getParameter<double>(data, 'menorValorAfiliado'),
          'variante': getParameter<bool>(data, 'variante'),
          'ultimaAtualizacao':
              getParameter<DateTime>(data, 'ultimaAtualizacao'),
        },
      ),
  'Carrinho': ParameterData.none(),
  'comprar': ParameterData.none(),
  'home-Vendas': ParameterData.none(),
  'saque': ParameterData.none(),
  'Cadastrar_produto': (data) async => ParameterData(
        allParams: {
          'lojaRef': getParameter<DocumentReference>(data, 'lojaRef'),
        },
      ),
  'home_loja_vendedor-1': ParameterData.none(),
  'produtos': (data) async => ParameterData(
        allParams: {
          'lojaref': getParameter<DocumentReference>(data, 'lojaref'),
        },
      ),
  'home_loja_vendedor-2': (data) async => ParameterData(
        allParams: {
          'lojaRef': getParameter<DocumentReference>(data, 'lojaRef'),
        },
      ),
  'status_pedido': ParameterData.none(),
  'venda-lojista': ParameterData.none(),
  'Cadastrar_loja': ParameterData.none(),
  'ADM_Home': ParameterData.none(),
  'ADM_saldo': ParameterData.none(),
  'Cadastrar_endereco': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'endereco_list': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'Editar_endereco': (data) async => ParameterData(
        allParams: {
          'enderecoRef': getParameter<DocumentReference>(data, 'enderecoRef'),
        },
      ),
  'Adicionar_variante-2': (data) async => ParameterData(
        allParams: {
          'lojaRef': getParameter<DocumentReference>(data, 'lojaRef'),
        },
      ),
  'Adicionar_variante-11': (data) async => ParameterData(
        allParams: {
          'lojaRef': getParameter<DocumentReference>(data, 'lojaRef'),
        },
      ),
  'seguranca': ParameterData.none(),
  'minhas_avaliacao': ParameterData.none(),
  'criar_avaliacao': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'todas_avaliacao': (data) async => ParameterData(
        allParams: {
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
  'imagem_avaliacao': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
          'avaliacaoref': getParameter<DocumentReference>(data, 'avaliacaoref'),
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
  'criarcupom': ParameterData.none(),
  'Cadastrar_categoria': ParameterData.none(),
  'Detalhes_do_pedido': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'video_produto': (data) async => ParameterData(
        allParams: {
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
  'maisVendido': (data) async => ParameterData(
        allParams: {
          'categoria': getParameter<String>(data, 'categoria'),
        },
      ),
  'Cadastrar_cartao': ParameterData.none(),
  'SelecionarCartao': (data) async => ParameterData(
        allParams: {
          'valor': getParameter<double>(data, 'valor'),
        },
      ),
  'status_pedido_logista': (data) async => ParameterData(
        allParams: {
          'lojaRef': getParameter<DocumentReference>(data, 'lojaRef'),
        },
      ),
  'Detalhes_do_pedido_logista': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'Rastreador_Pedido_lojista': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'Rastreador_Pedido2': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'ValorFinaldoPedido': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'Detalhes_reembolso': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'Detalhes_cancelamento': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'Atualizar_produto': (data) async => ParameterData(
        allParams: {
          'lojaRef': getParameter<DocumentReference>(data, 'lojaRef'),
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
  'aaaaaaaaaaaaaaa': ParameterData.none(),
  'Atualizar_categoria': ParameterData.none(),
  'compraAprovada': ParameterData.none(),
  'pix': ParameterData.none(),
  'Pagamento_pendente': ParameterData.none(),
  'pix2': (data) async => ParameterData(
        allParams: {
          'pedidoRef': getParameter<DocumentReference>(data, 'pedidoRef'),
        },
      ),
  'pagamentoReprovado': ParameterData.none(),
  'pagamentoReprovado2': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'update_metodo_pagamento': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'pix3': ParameterData.none(),
  'perfil2': ParameterData.none(),
  'configuracao_conta': ParameterData.none(),
  'contaSeguranca': ParameterData.none(),
  'editarPerfil': ParameterData.none(),
  'MudarTelefone': ParameterData.none(),
  'meusEnderecos': ParameterData.none(),
  'Editar_endereco2': (data) async => ParameterData(
        allParams: {
          'enderecoRef': getParameter<DocumentReference>(data, 'enderecoRef'),
        },
      ),
  'Cadastrar_endereco2': ParameterData.none(),
  'CartaoDeCreditoDelete': (data) async => ParameterData(
        allParams: {
          'cardRef': getParameter<DocumentReference>(data, 'cardRef'),
        },
      ),
  'CartaoDeCreditoConfig': ParameterData.none(),
  'pesquisa': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'pesquisaGaleria': ParameterData.none(),
  'categoria': ParameterData.none(),
  'comprar3': ParameterData.none(),
  'home_promoRelampago': ParameterData.none(),
  'criar_promoRelampago1': ParameterData.none(),
  'criar_promoRelampago2': ParameterData.none(),
  'criar_promoRelampago3': ParameterData.none(),
  'criar_promoRelampago0': ParameterData.none(),
  'detalhesPromo': (data) async => ParameterData(
        allParams: {
          'promoRef': getParameter<DocumentReference>(data, 'promoRef'),
        },
      ),
  'editarPromo': (data) async => ParameterData(
        allParams: {
          'promoRef': getParameter<DocumentReference>(data, 'promoRef'),
        },
      ),
  'material_divulgacao': (data) async => ParameterData(
        allParams: {
          'afiliadoref': getParameter<DocumentReference>(data, 'afiliadoref'),
        },
      ),
  'Pagina_produtoAfiliado': (data) async => ParameterData(
        allParams: {
          'produtoRef2': getParameter<DocumentReference>(data, 'produtoRef2'),
        },
      ),
  'CarrinhoNaoLogadoVenda': ParameterData.none(),
  'loginAfiliadoCard': ParameterData.none(),
  'Cadastrar_enderecoRecenLogin': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'loginAfiliadoCardTemGoogle': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'meusProdutosAfiliado': ParameterData.none(),
  'minhasVendas': ParameterData.none(),
  'ADM_PagamentoAfiliado': ParameterData.none(),
  'esqueceuSenhaa': ParameterData.none(),
  'loginPrincipal': ParameterData.none(),
  'atualizarVarianteProduto': (data) async => ParameterData(
        allParams: {
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
  'dddddddddddddd': ParameterData.none(),
  'compatilhar_codigo': (data) async => ParameterData(
        allParams: {
          'afiliadoref': getParameter<DocumentReference>(data, 'afiliadoref'),
        },
      ),
  'MudarNome': ParameterData.none(),
  'Chat_Cliente': (data) async => ParameterData(
        allParams: {
          'idLogista': getParameter<DocumentReference>(data, 'idLogista'),
        },
      ),
  'chatHomeCliente': ParameterData.none(),
  'chatHomeLojista': ParameterData.none(),
  'Chat_Lojista': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
        },
      ),
  'compatilhar_codigoIMG': (data) async => ParameterData(
        allParams: {
          'imgRef': getParameter<String>(data, 'imgRef'),
        },
      ),
  'SobreNos': ParameterData.none(),
  'ajuda': ParameterData.none(),
  'comprarNovamente': ParameterData.none(),
  'VistoRecente': ParameterData.none(),
  'Favoritos': ParameterData.none(),
  'homePC': ParameterData.none(),
  'notificacao': ParameterData.none(),
  'pedidosEnvio': ParameterData.none(),
  'Promocoes': ParameterData.none(),
  'loginCardTemGoogle': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'PaginaProdutoPC': (data) async => ParameterData(
        allParams: {
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
  'excluirconta': ParameterData.none(),
  'politicaPrivacidade': ParameterData.none(),
  'CarrinhoPCNaoLogado': ParameterData.none(),
  'comprarPC': ParameterData.none(),
  'pixPC': ParameterData.none(),
  'perfilPC': ParameterData.none(),
  'pixPagamentoPendentePC': (data) async => ParameterData(
        allParams: {
          'pedidoRef': getParameter<DocumentReference>(data, 'pedidoRef'),
        },
      ),
  'Rastreador_PedidoPC': (data) async => ParameterData(
        allParams: {
          'pedidoRef2': getParameter<DocumentReference>(data, 'pedidoRef2'),
        },
      ),
  'pcCategoria': ParameterData.none(),
  'CarrinhoPC': ParameterData.none(),
  'homeLogistaPC': ParameterData.none(),
  'cadastrarProdutoPC': (data) async => ParameterData(
        allParams: {
          'lojaRef': getParameter<DocumentReference>(data, 'lojaRef'),
        },
      ),
  'Home-lojaCopy': ParameterData.none(),
  'Pagina_produtoCopy': (data) async => ParameterData(
        allParams: {
          'produtoRef': getParameter<DocumentReference>(data, 'produtoRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
