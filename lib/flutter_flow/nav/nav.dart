import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeLojaWidget() : HomeLojaWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeLojaWidget() : HomeLojaWidget(),
        ),
        FFRoute(
          name: HomeLojaWidget.routeName,
          path: HomeLojaWidget.routePath,
          builder: (context, params) => HomeLojaWidget(),
        ),
        FFRoute(
          name: PaginaProdutoWidget.routeName,
          path: PaginaProdutoWidget.routePath,
          builder: (context, params) => PaginaProdutoWidget(
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        ),
        FFRoute(
          name: CompartilharLucrarWidget.routeName,
          path: CompartilharLucrarWidget.routePath,
          builder: (context, params) => CompartilharLucrarWidget(
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
            maiorValorAfiliado: params.getParam(
              'maiorValorAfiliado',
              ParamType.double,
            ),
            menorValorAfiliado: params.getParam(
              'menorValorAfiliado',
              ParamType.double,
            ),
            variante: params.getParam(
              'variante',
              ParamType.bool,
            ),
            ultimaAtualizacao: params.getParam(
              'ultimaAtualizacao',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: CarrinhoWidget.routeName,
          path: CarrinhoWidget.routePath,
          builder: (context, params) => CarrinhoWidget(),
        ),
        FFRoute(
          name: ComprarWidget.routeName,
          path: ComprarWidget.routePath,
          builder: (context, params) => ComprarWidget(),
        ),
        FFRoute(
          name: HomeVendasWidget.routeName,
          path: HomeVendasWidget.routePath,
          builder: (context, params) => HomeVendasWidget(),
        ),
        FFRoute(
          name: SaqueWidget.routeName,
          path: SaqueWidget.routePath,
          builder: (context, params) => SaqueWidget(),
        ),
        FFRoute(
          name: CadastrarProdutoWidget.routeName,
          path: CadastrarProdutoWidget.routePath,
          builder: (context, params) => CadastrarProdutoWidget(
            lojaRef: params.getParam(
              'lojaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
          ),
        ),
        FFRoute(
          name: HomeLojaVendedor1Widget.routeName,
          path: HomeLojaVendedor1Widget.routePath,
          builder: (context, params) => HomeLojaVendedor1Widget(),
        ),
        FFRoute(
          name: ProdutosWidget.routeName,
          path: ProdutosWidget.routePath,
          builder: (context, params) => ProdutosWidget(
            lojaref: params.getParam(
              'lojaref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
          ),
        ),
        FFRoute(
          name: HomeLojaVendedor2Widget.routeName,
          path: HomeLojaVendedor2Widget.routePath,
          builder: (context, params) => HomeLojaVendedor2Widget(
            lojaRef: params.getParam(
              'lojaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
          ),
        ),
        FFRoute(
          name: StatusPedidoWidget.routeName,
          path: StatusPedidoWidget.routePath,
          builder: (context, params) => StatusPedidoWidget(),
        ),
        FFRoute(
          name: VendaLojistaWidget.routeName,
          path: VendaLojistaWidget.routePath,
          builder: (context, params) => VendaLojistaWidget(),
        ),
        FFRoute(
          name: CadastrarLojaWidget.routeName,
          path: CadastrarLojaWidget.routePath,
          builder: (context, params) => CadastrarLojaWidget(),
        ),
        FFRoute(
          name: ADMHomeWidget.routeName,
          path: ADMHomeWidget.routePath,
          builder: (context, params) => ADMHomeWidget(),
        ),
        FFRoute(
          name: ADMSaldoWidget.routeName,
          path: ADMSaldoWidget.routePath,
          builder: (context, params) => ADMSaldoWidget(),
        ),
        FFRoute(
          name: CadastrarEnderecoWidget.routeName,
          path: CadastrarEnderecoWidget.routePath,
          asyncParams: {
            'queryCarrinhoList':
                getDocList(['user', 'carrinho'], CarrinhoRecord.fromSnapshot),
          },
          builder: (context, params) => CadastrarEnderecoWidget(
            queryCarrinhoList: params.getParam<CarrinhoRecord>(
              'queryCarrinhoList',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: EnderecoListWidget.routeName,
          path: EnderecoListWidget.routePath,
          asyncParams: {
            'queryCarrinhoList':
                getDocList(['user', 'carrinho'], CarrinhoRecord.fromSnapshot),
          },
          builder: (context, params) => EnderecoListWidget(
            queryCarrinhoList: params.getParam<CarrinhoRecord>(
              'queryCarrinhoList',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: EditarEnderecoWidget.routeName,
          path: EditarEnderecoWidget.routePath,
          asyncParams: {
            'queryCarrinhoList':
                getDocList(['user', 'carrinho'], CarrinhoRecord.fromSnapshot),
          },
          builder: (context, params) => EditarEnderecoWidget(
            enderecoRef: params.getParam(
              'enderecoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user', 'enderecos'],
            ),
            queryCarrinhoList: params.getParam<CarrinhoRecord>(
              'queryCarrinhoList',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: AdicionarVariante2Widget.routeName,
          path: AdicionarVariante2Widget.routePath,
          builder: (context, params) => AdicionarVariante2Widget(
            lojaRef: params.getParam(
              'lojaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
          ),
        ),
        FFRoute(
          name: AdicionarVariante11Widget.routeName,
          path: AdicionarVariante11Widget.routePath,
          builder: (context, params) => AdicionarVariante11Widget(
            lojaRef: params.getParam(
              'lojaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
          ),
        ),
        FFRoute(
          name: SegurancaWidget.routeName,
          path: SegurancaWidget.routePath,
          builder: (context, params) => SegurancaWidget(),
        ),
        FFRoute(
          name: MinhasAvaliacaoWidget.routeName,
          path: MinhasAvaliacaoWidget.routePath,
          builder: (context, params) => MinhasAvaliacaoWidget(),
        ),
        FFRoute(
          name: CriarAvaliacaoWidget.routeName,
          path: CriarAvaliacaoWidget.routePath,
          builder: (context, params) => CriarAvaliacaoWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: TodasAvaliacaoWidget.routeName,
          path: TodasAvaliacaoWidget.routePath,
          builder: (context, params) => TodasAvaliacaoWidget(
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        ),
        FFRoute(
          name: ImagemAvaliacaoWidget.routeName,
          path: ImagemAvaliacaoWidget.routePath,
          builder: (context, params) => ImagemAvaliacaoWidget(
            index: params.getParam(
              'index',
              ParamType.int,
            ),
            avaliacaoref: params.getParam(
              'avaliacaoref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto', 'avaliacao'],
            ),
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        ),
        FFRoute(
          name: CriarcupomWidget.routeName,
          path: CriarcupomWidget.routePath,
          builder: (context, params) => CriarcupomWidget(),
        ),
        FFRoute(
          name: CadastrarCategoriaWidget.routeName,
          path: CadastrarCategoriaWidget.routePath,
          builder: (context, params) => CadastrarCategoriaWidget(),
        ),
        FFRoute(
          name: DetalhesDoPedidoWidget.routeName,
          path: DetalhesDoPedidoWidget.routePath,
          builder: (context, params) => DetalhesDoPedidoWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: VideoProdutoWidget.routeName,
          path: VideoProdutoWidget.routePath,
          builder: (context, params) => VideoProdutoWidget(
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        ),
        FFRoute(
          name: MaisVendidoWidget.routeName,
          path: MaisVendidoWidget.routePath,
          builder: (context, params) => MaisVendidoWidget(
            categoria: params.getParam(
              'categoria',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CadastrarCartaoWidget.routeName,
          path: CadastrarCartaoWidget.routePath,
          builder: (context, params) => CadastrarCartaoWidget(),
        ),
        FFRoute(
          name: SelecionarCartaoWidget.routeName,
          path: SelecionarCartaoWidget.routePath,
          builder: (context, params) => SelecionarCartaoWidget(
            valor: params.getParam(
              'valor',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: StatusPedidoLogistaWidget.routeName,
          path: StatusPedidoLogistaWidget.routePath,
          builder: (context, params) => StatusPedidoLogistaWidget(
            lojaRef: params.getParam(
              'lojaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
          ),
        ),
        FFRoute(
          name: DetalhesDoPedidoLogistaWidget.routeName,
          path: DetalhesDoPedidoLogistaWidget.routePath,
          builder: (context, params) => DetalhesDoPedidoLogistaWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: RastreadorPedidoLojistaWidget.routeName,
          path: RastreadorPedidoLojistaWidget.routePath,
          builder: (context, params) => RastreadorPedidoLojistaWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: RastreadorPedido2Widget.routeName,
          path: RastreadorPedido2Widget.routePath,
          builder: (context, params) => RastreadorPedido2Widget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: ValorFinaldoPedidoWidget.routeName,
          path: ValorFinaldoPedidoWidget.routePath,
          builder: (context, params) => ValorFinaldoPedidoWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: DetalhesReembolsoWidget.routeName,
          path: DetalhesReembolsoWidget.routePath,
          builder: (context, params) => DetalhesReembolsoWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: DetalhesCancelamentoWidget.routeName,
          path: DetalhesCancelamentoWidget.routePath,
          builder: (context, params) => DetalhesCancelamentoWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: AtualizarProdutoWidget.routeName,
          path: AtualizarProdutoWidget.routePath,
          builder: (context, params) => AtualizarProdutoWidget(
            lojaRef: params.getParam(
              'lojaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        ),
        FFRoute(
          name: AaaaaaaaaaaaaaaWidget.routeName,
          path: AaaaaaaaaaaaaaaWidget.routePath,
          builder: (context, params) => AaaaaaaaaaaaaaaWidget(),
        ),
        FFRoute(
          name: AtualizarCategoriaWidget.routeName,
          path: AtualizarCategoriaWidget.routePath,
          builder: (context, params) => AtualizarCategoriaWidget(),
        ),
        FFRoute(
          name: CompraAprovadaWidget.routeName,
          path: CompraAprovadaWidget.routePath,
          builder: (context, params) => CompraAprovadaWidget(),
        ),
        FFRoute(
          name: PixWidget.routeName,
          path: PixWidget.routePath,
          builder: (context, params) => PixWidget(),
        ),
        FFRoute(
          name: PagamentoPendenteWidget.routeName,
          path: PagamentoPendenteWidget.routePath,
          builder: (context, params) => PagamentoPendenteWidget(),
        ),
        FFRoute(
          name: Pix2Widget.routeName,
          path: Pix2Widget.routePath,
          builder: (context, params) => Pix2Widget(
            pedidoRef: params.getParam(
              'pedidoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
            doc: params.getParam<DocumentReference>(
              'doc',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: PagamentoReprovadoWidget.routeName,
          path: PagamentoReprovadoWidget.routePath,
          builder: (context, params) => PagamentoReprovadoWidget(),
        ),
        FFRoute(
          name: PagamentoReprovado2Widget.routeName,
          path: PagamentoReprovado2Widget.routePath,
          builder: (context, params) => PagamentoReprovado2Widget(
            pedidoList: params.getParam<DocumentReference>(
              'pedidoList',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: UpdateMetodoPagamentoWidget.routeName,
          path: UpdateMetodoPagamentoWidget.routePath,
          builder: (context, params) => UpdateMetodoPagamentoWidget(
            pagamentoList: params.getParam<DocumentReference>(
              'pagamentoList',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: Pix3Widget.routeName,
          path: Pix3Widget.routePath,
          builder: (context, params) => Pix3Widget(),
        ),
        FFRoute(
          name: Perfil2Widget.routeName,
          path: Perfil2Widget.routePath,
          builder: (context, params) => Perfil2Widget(),
        ),
        FFRoute(
          name: ConfiguracaoContaWidget.routeName,
          path: ConfiguracaoContaWidget.routePath,
          builder: (context, params) => ConfiguracaoContaWidget(),
        ),
        FFRoute(
          name: ContaSegurancaWidget.routeName,
          path: ContaSegurancaWidget.routePath,
          builder: (context, params) => ContaSegurancaWidget(),
        ),
        FFRoute(
          name: EditarPerfilWidget.routeName,
          path: EditarPerfilWidget.routePath,
          builder: (context, params) => EditarPerfilWidget(),
        ),
        FFRoute(
          name: MudarTelefoneWidget.routeName,
          path: MudarTelefoneWidget.routePath,
          builder: (context, params) => MudarTelefoneWidget(),
        ),
        FFRoute(
          name: MeusEnderecosWidget.routeName,
          path: MeusEnderecosWidget.routePath,
          builder: (context, params) => MeusEnderecosWidget(),
        ),
        FFRoute(
          name: EditarEndereco2Widget.routeName,
          path: EditarEndereco2Widget.routePath,
          builder: (context, params) => EditarEndereco2Widget(
            enderecoRef: params.getParam(
              'enderecoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user', 'enderecos'],
            ),
          ),
        ),
        FFRoute(
          name: CadastrarEndereco2Widget.routeName,
          path: CadastrarEndereco2Widget.routePath,
          builder: (context, params) => CadastrarEndereco2Widget(),
        ),
        FFRoute(
          name: CartaoDeCreditoDeleteWidget.routeName,
          path: CartaoDeCreditoDeleteWidget.routePath,
          builder: (context, params) => CartaoDeCreditoDeleteWidget(
            cardRef: params.getParam(
              'cardRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user', 'cartao'],
            ),
          ),
        ),
        FFRoute(
          name: CartaoDeCreditoConfigWidget.routeName,
          path: CartaoDeCreditoConfigWidget.routePath,
          builder: (context, params) => CartaoDeCreditoConfigWidget(),
        ),
        FFRoute(
          name: PesquisaWidget.routeName,
          path: PesquisaWidget.routePath,
          asyncParams: {
            'documentList': getDocList(['produto'], ProdutoRecord.fromSnapshot),
          },
          builder: (context, params) => PesquisaWidget(
            documentList: params.getParam<ProdutoRecord>(
              'documentList',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: PesquisaGaleriaWidget.routeName,
          path: PesquisaGaleriaWidget.routePath,
          builder: (context, params) => PesquisaGaleriaWidget(),
        ),
        FFRoute(
          name: CategoriaWidget.routeName,
          path: CategoriaWidget.routePath,
          builder: (context, params) => CategoriaWidget(),
        ),
        FFRoute(
          name: Comprar3Widget.routeName,
          path: Comprar3Widget.routePath,
          builder: (context, params) => Comprar3Widget(),
        ),
        FFRoute(
          name: HomePromoRelampagoWidget.routeName,
          path: HomePromoRelampagoWidget.routePath,
          builder: (context, params) => HomePromoRelampagoWidget(),
        ),
        FFRoute(
          name: CriarPromoRelampago1Widget.routeName,
          path: CriarPromoRelampago1Widget.routePath,
          builder: (context, params) => CriarPromoRelampago1Widget(),
        ),
        FFRoute(
          name: CriarPromoRelampago2Widget.routeName,
          path: CriarPromoRelampago2Widget.routePath,
          builder: (context, params) => CriarPromoRelampago2Widget(),
        ),
        FFRoute(
          name: CriarPromoRelampago3Widget.routeName,
          path: CriarPromoRelampago3Widget.routePath,
          builder: (context, params) => CriarPromoRelampago3Widget(),
        ),
        FFRoute(
          name: CriarPromoRelampago0Widget.routeName,
          path: CriarPromoRelampago0Widget.routePath,
          builder: (context, params) => CriarPromoRelampago0Widget(),
        ),
        FFRoute(
          name: DetalhesPromoWidget.routeName,
          path: DetalhesPromoWidget.routePath,
          builder: (context, params) => DetalhesPromoWidget(
            promoRef: params.getParam(
              'promoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas', 'promoRelampago'],
            ),
          ),
        ),
        FFRoute(
          name: EditarPromoWidget.routeName,
          path: EditarPromoWidget.routePath,
          builder: (context, params) => EditarPromoWidget(
            promoRef: params.getParam(
              'promoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas', 'promoRelampago'],
            ),
          ),
        ),
        FFRoute(
          name: MaterialDivulgacaoWidget.routeName,
          path: MaterialDivulgacaoWidget.routePath,
          builder: (context, params) => MaterialDivulgacaoWidget(
            afiliadoref: params.getParam(
              'afiliadoref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user', 'produtoAfiliado'],
            ),
          ),
        ),
        FFRoute(
          name: PaginaProdutoAfiliadoWidget.routeName,
          path: PaginaProdutoAfiliadoWidget.routePath,
          builder: (context, params) => PaginaProdutoAfiliadoWidget(
            produtoRef2: params.getParam(
              'produtoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user', 'produtoAfiliado'],
            ),
          ),
        ),
        FFRoute(
          name: CarrinhoNaoLogadoVendaWidget.routeName,
          path: CarrinhoNaoLogadoVendaWidget.routePath,
          builder: (context, params) => CarrinhoNaoLogadoVendaWidget(),
        ),
        FFRoute(
          name: LoginAfiliadoCardWidget.routeName,
          path: LoginAfiliadoCardWidget.routePath,
          builder: (context, params) => LoginAfiliadoCardWidget(),
        ),
        FFRoute(
          name: CadastrarEnderecoRecenLoginWidget.routeName,
          path: CadastrarEnderecoRecenLoginWidget.routePath,
          asyncParams: {
            'queryCarrinhoList':
                getDocList(['user', 'carrinho'], CarrinhoRecord.fromSnapshot),
          },
          builder: (context, params) => CadastrarEnderecoRecenLoginWidget(
            queryCarrinhoList: params.getParam<CarrinhoRecord>(
              'queryCarrinhoList',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: LoginAfiliadoCardTemGoogleWidget.routeName,
          path: LoginAfiliadoCardTemGoogleWidget.routePath,
          builder: (context, params) => LoginAfiliadoCardTemGoogleWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: MeusProdutosAfiliadoWidget.routeName,
          path: MeusProdutosAfiliadoWidget.routePath,
          builder: (context, params) => MeusProdutosAfiliadoWidget(),
        ),
        FFRoute(
          name: MinhasVendasWidget.routeName,
          path: MinhasVendasWidget.routePath,
          builder: (context, params) => MinhasVendasWidget(),
        ),
        FFRoute(
          name: ADMPagamentoAfiliadoWidget.routeName,
          path: ADMPagamentoAfiliadoWidget.routePath,
          builder: (context, params) => ADMPagamentoAfiliadoWidget(),
        ),
        FFRoute(
          name: EsqueceuSenhaaWidget.routeName,
          path: EsqueceuSenhaaWidget.routePath,
          builder: (context, params) => EsqueceuSenhaaWidget(),
        ),
        FFRoute(
          name: LoginPrincipalWidget.routeName,
          path: LoginPrincipalWidget.routePath,
          builder: (context, params) => LoginPrincipalWidget(),
        ),
        FFRoute(
          name: AtualizarVarianteProdutoWidget.routeName,
          path: AtualizarVarianteProdutoWidget.routePath,
          builder: (context, params) => AtualizarVarianteProdutoWidget(
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        ),
        FFRoute(
          name: DdddddddddddddWidget.routeName,
          path: DdddddddddddddWidget.routePath,
          builder: (context, params) => DdddddddddddddWidget(),
        ),
        FFRoute(
          name: CompatilharCodigoWidget.routeName,
          path: CompatilharCodigoWidget.routePath,
          builder: (context, params) => CompatilharCodigoWidget(
            afiliadoref: params.getParam(
              'afiliadoref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user', 'produtoAfiliado'],
            ),
          ),
        ),
        FFRoute(
          name: MudarNomeWidget.routeName,
          path: MudarNomeWidget.routePath,
          builder: (context, params) => MudarNomeWidget(),
        ),
        FFRoute(
          name: ChatClienteWidget.routeName,
          path: ChatClienteWidget.routePath,
          builder: (context, params) => ChatClienteWidget(
            idLogista: params.getParam(
              'idLogista',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: ChatHomeClienteWidget.routeName,
          path: ChatHomeClienteWidget.routePath,
          builder: (context, params) => ChatHomeClienteWidget(),
        ),
        FFRoute(
          name: ChatHomeLojistaWidget.routeName,
          path: ChatHomeLojistaWidget.routePath,
          builder: (context, params) => ChatHomeLojistaWidget(),
        ),
        FFRoute(
          name: ChatLojistaWidget.routeName,
          path: ChatLojistaWidget.routePath,
          builder: (context, params) => ChatLojistaWidget(
            idCliente: params.getParam(
              'idCliente',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: CompatilharCodigoIMGWidget.routeName,
          path: CompatilharCodigoIMGWidget.routePath,
          builder: (context, params) => CompatilharCodigoIMGWidget(
            imgRef: params.getParam(
              'imgRef',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SobreNosWidget.routeName,
          path: SobreNosWidget.routePath,
          builder: (context, params) => SobreNosWidget(),
        ),
        FFRoute(
          name: AjudaWidget.routeName,
          path: AjudaWidget.routePath,
          builder: (context, params) => AjudaWidget(),
        ),
        FFRoute(
          name: ComprarNovamenteWidget.routeName,
          path: ComprarNovamenteWidget.routePath,
          builder: (context, params) => ComprarNovamenteWidget(),
        ),
        FFRoute(
          name: VistoRecenteWidget.routeName,
          path: VistoRecenteWidget.routePath,
          builder: (context, params) => VistoRecenteWidget(),
        ),
        FFRoute(
          name: FavoritosWidget.routeName,
          path: FavoritosWidget.routePath,
          builder: (context, params) => FavoritosWidget(),
        ),
        FFRoute(
          name: HomePCWidget.routeName,
          path: HomePCWidget.routePath,
          builder: (context, params) => HomePCWidget(),
        ),
        FFRoute(
          name: NotificacaoWidget.routeName,
          path: NotificacaoWidget.routePath,
          builder: (context, params) => NotificacaoWidget(),
        ),
        FFRoute(
          name: PedidosEnvioWidget.routeName,
          path: PedidosEnvioWidget.routePath,
          builder: (context, params) => PedidosEnvioWidget(),
        ),
        FFRoute(
          name: PromocoesWidget.routeName,
          path: PromocoesWidget.routePath,
          builder: (context, params) => PromocoesWidget(),
        ),
        FFRoute(
          name: LoginCardTemGoogleWidget.routeName,
          path: LoginCardTemGoogleWidget.routePath,
          builder: (context, params) => LoginCardTemGoogleWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: PaginaProdutoPCWidget.routeName,
          path: PaginaProdutoPCWidget.routePath,
          builder: (context, params) => PaginaProdutoPCWidget(
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        ),
        FFRoute(
          name: ExcluircontaWidget.routeName,
          path: ExcluircontaWidget.routePath,
          builder: (context, params) => ExcluircontaWidget(),
        ),
        FFRoute(
          name: PoliticaPrivacidadeWidget.routeName,
          path: PoliticaPrivacidadeWidget.routePath,
          builder: (context, params) => PoliticaPrivacidadeWidget(),
        ),
        FFRoute(
          name: CarrinhoPCNaoLogadoWidget.routeName,
          path: CarrinhoPCNaoLogadoWidget.routePath,
          builder: (context, params) => CarrinhoPCNaoLogadoWidget(),
        ),
        FFRoute(
          name: ComprarPCWidget.routeName,
          path: ComprarPCWidget.routePath,
          builder: (context, params) => ComprarPCWidget(),
        ),
        FFRoute(
          name: PixPCWidget.routeName,
          path: PixPCWidget.routePath,
          builder: (context, params) => PixPCWidget(),
        ),
        FFRoute(
          name: PerfilPCWidget.routeName,
          path: PerfilPCWidget.routePath,
          builder: (context, params) => PerfilPCWidget(),
        ),
        FFRoute(
          name: PixPagamentoPendentePCWidget.routeName,
          path: PixPagamentoPendentePCWidget.routePath,
          builder: (context, params) => PixPagamentoPendentePCWidget(
            pedidoRef: params.getParam(
              'pedidoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
            doc: params.getParam<DocumentReference>(
              'doc',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: RastreadorPedidoPCWidget.routeName,
          path: RastreadorPedidoPCWidget.routePath,
          builder: (context, params) => RastreadorPedidoPCWidget(
            pedidoRef2: params.getParam(
              'pedidoRef2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pedidos_total'],
            ),
          ),
        ),
        FFRoute(
          name: PcCategoriaWidget.routeName,
          path: PcCategoriaWidget.routePath,
          builder: (context, params) => PcCategoriaWidget(),
        ),
        FFRoute(
          name: CarrinhoPCWidget.routeName,
          path: CarrinhoPCWidget.routePath,
          builder: (context, params) => CarrinhoPCWidget(),
        ),
        FFRoute(
          name: HomeLogistaPCWidget.routeName,
          path: HomeLogistaPCWidget.routePath,
          builder: (context, params) => HomeLogistaPCWidget(),
        ),
        FFRoute(
          name: CadastrarProdutoPCWidget.routeName,
          path: CadastrarProdutoPCWidget.routePath,
          builder: (context, params) => CadastrarProdutoPCWidget(
            lojaRef: params.getParam(
              'lojaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['lojas'],
            ),
          ),
        ),
        FFRoute(
          name: HomeLojaCopyWidget.routeName,
          path: HomeLojaCopyWidget.routePath,
          builder: (context, params) => HomeLojaCopyWidget(),
        ),
        FFRoute(
          name: PaginaProdutoCopyWidget.routeName,
          path: PaginaProdutoCopyWidget.routePath,
          builder: (context, params) => PaginaProdutoCopyWidget(
            produtoRef: params.getParam(
              'produtoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['produto'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/homeLoja';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
