import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _listCarrinho =
          prefs.getStringList('ff_listCarrinho')?.map(double.parse).toList() ??
              _listCarrinho;
    });
    _safeInit(() {
      _afiliadoid = prefs.getString('ff_afiliadoid') ?? _afiliadoid;
    });
    _safeInit(() {
      _LoginPrimeiraVez =
          prefs.getBool('ff_LoginPrimeiraVez') ?? _LoginPrimeiraVez;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<double> _listapagar2 = [];
  List<double> get listapagar2 => _listapagar2;
  set listapagar2(List<double> value) {
    _listapagar2 = value;
  }

  void addToListapagar2(double value) {
    listapagar2.add(value);
  }

  void removeFromListapagar2(double value) {
    listapagar2.remove(value);
  }

  void removeAtIndexFromListapagar2(int index) {
    listapagar2.removeAt(index);
  }

  void updateListapagar2AtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    listapagar2[index] = updateFn(_listapagar2[index]);
  }

  void insertAtIndexInListapagar2(int index, double value) {
    listapagar2.insert(index, value);
  }

  List<double> _listApagar = [];
  List<double> get listApagar => _listApagar;
  set listApagar(List<double> value) {
    _listApagar = value;
  }

  void addToListApagar(double value) {
    listApagar.add(value);
  }

  void removeFromListApagar(double value) {
    listApagar.remove(value);
  }

  void removeAtIndexFromListApagar(int index) {
    listApagar.removeAt(index);
  }

  void updateListApagarAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    listApagar[index] = updateFn(_listApagar[index]);
  }

  void insertAtIndexInListApagar(int index, double value) {
    listApagar.insert(index, value);
  }

  String _apagarMidia = '';
  String get apagarMidia => _apagarMidia;
  set apagarMidia(String value) {
    _apagarMidia = value;
  }

  List<String> _fotoProduto = [];
  List<String> get fotoProduto => _fotoProduto;
  set fotoProduto(List<String> value) {
    _fotoProduto = value;
  }

  void addToFotoProduto(String value) {
    fotoProduto.add(value);
  }

  void removeFromFotoProduto(String value) {
    fotoProduto.remove(value);
  }

  void removeAtIndexFromFotoProduto(int index) {
    fotoProduto.removeAt(index);
  }

  void updateFotoProdutoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fotoProduto[index] = updateFn(_fotoProduto[index]);
  }

  void insertAtIndexInFotoProduto(int index, String value) {
    fotoProduto.insert(index, value);
  }

  double _propPrice = 0.0;
  double get propPrice => _propPrice;
  set propPrice(double value) {
    _propPrice = value;
  }

  int _quantidadeCarrinho = 0;
  int get quantidadeCarrinho => _quantidadeCarrinho;
  set quantidadeCarrinho(int value) {
    _quantidadeCarrinho = value;
  }

  int _quantidadeProduto = 0;
  int get quantidadeProduto => _quantidadeProduto;
  set quantidadeProduto(int value) {
    _quantidadeProduto = value;
  }

  bool _carrinhoLoading = false;
  bool get carrinhoLoading => _carrinhoLoading;
  set carrinhoLoading(bool value) {
    _carrinhoLoading = value;
  }

  double _totalCarrinho = 0.0;
  double get totalCarrinho => _totalCarrinho;
  set totalCarrinho(double value) {
    _totalCarrinho = value;
  }

  List<double> _listCarrinho = [];
  List<double> get listCarrinho => _listCarrinho;
  set listCarrinho(List<double> value) {
    _listCarrinho = value;
    prefs.setStringList(
        'ff_listCarrinho', value.map((x) => x.toString()).toList());
  }

  void addToListCarrinho(double value) {
    listCarrinho.add(value);
    prefs.setStringList(
        'ff_listCarrinho', _listCarrinho.map((x) => x.toString()).toList());
  }

  void removeFromListCarrinho(double value) {
    listCarrinho.remove(value);
    prefs.setStringList(
        'ff_listCarrinho', _listCarrinho.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListCarrinho(int index) {
    listCarrinho.removeAt(index);
    prefs.setStringList(
        'ff_listCarrinho', _listCarrinho.map((x) => x.toString()).toList());
  }

  void updateListCarrinhoAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    listCarrinho[index] = updateFn(_listCarrinho[index]);
    prefs.setStringList(
        'ff_listCarrinho', _listCarrinho.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListCarrinho(int index, double value) {
    listCarrinho.insert(index, value);
    prefs.setStringList(
        'ff_listCarrinho', _listCarrinho.map((x) => x.toString()).toList());
  }

  bool _statusNaopago = false;
  bool get statusNaopago => _statusNaopago;
  set statusNaopago(bool value) {
    _statusNaopago = value;
  }

  bool _statusPreparando = false;
  bool get statusPreparando => _statusPreparando;
  set statusPreparando(bool value) {
    _statusPreparando = value;
  }

  bool _statusEnviado = false;
  bool get statusEnviado => _statusEnviado;
  set statusEnviado(bool value) {
    _statusEnviado = value;
  }

  bool _statusReembolso = false;
  bool get statusReembolso => _statusReembolso;
  set statusReembolso(bool value) {
    _statusReembolso = value;
  }

  bool _statusFinalizado = false;
  bool get statusFinalizado => _statusFinalizado;
  set statusFinalizado(bool value) {
    _statusFinalizado = value;
  }

  String _videoProduto = '';
  String get videoProduto => _videoProduto;
  set videoProduto(String value) {
    _videoProduto = value;
  }

  String _urlAfiliado = '';
  String get urlAfiliado => _urlAfiliado;
  set urlAfiliado(String value) {
    _urlAfiliado = value;
  }

  String _afiliadoid = '';
  String get afiliadoid => _afiliadoid;
  set afiliadoid(String value) {
    _afiliadoid = value;
    prefs.setString('ff_afiliadoid', value);
  }

  String _rua = '';
  String get rua => _rua;
  set rua(String value) {
    _rua = value;
  }

  String _estado = '';
  String get estado => _estado;
  set estado(String value) {
    _estado = value;
  }

  String _cidade = '';
  String get cidade => _cidade;
  set cidade(String value) {
    _cidade = value;
  }

  String _bairro = '';
  String get bairro => _bairro;
  set bairro(String value) {
    _bairro = value;
  }

  String _enderecoCer = '';
  String get enderecoCer => _enderecoCer;
  set enderecoCer(String value) {
    _enderecoCer = value;
  }

  String _cep = '';
  String get cep => _cep;
  set cep(String value) {
    _cep = value;
  }

  String _varianteTitulo = '';
  String get varianteTitulo => _varianteTitulo;
  set varianteTitulo(String value) {
    _varianteTitulo = value;
  }

  int _variacaoQuantidade = 0;
  int get variacaoQuantidade => _variacaoQuantidade;
  set variacaoQuantidade(int value) {
    _variacaoQuantidade = value;
  }

  bool _verImagem = false;
  bool get verImagem => _verImagem;
  set verImagem(bool value) {
    _verImagem = value;
  }

  int _quanridadeVariante = 0;
  int get quanridadeVariante => _quanridadeVariante;
  set quanridadeVariante(int value) {
    _quanridadeVariante = value;
  }

  String _titulo1 = '';
  String get titulo1 => _titulo1;
  set titulo1(String value) {
    _titulo1 = value;
  }

  String _titulo2 = '';
  String get titulo2 => _titulo2;
  set titulo2(String value) {
    _titulo2 = value;
  }

  String _opcao1titulo1 = '';
  String get opcao1titulo1 => _opcao1titulo1;
  set opcao1titulo1(String value) {
    _opcao1titulo1 = value;
  }

  String _foto1titulo1 = '';
  String get foto1titulo1 => _foto1titulo1;
  set foto1titulo1(String value) {
    _foto1titulo1 = value;
  }

  String _opcao2titulo1 = '';
  String get opcao2titulo1 => _opcao2titulo1;
  set opcao2titulo1(String value) {
    _opcao2titulo1 = value;
  }

  String _foto2titulo1 = '';
  String get foto2titulo1 => _foto2titulo1;
  set foto2titulo1(String value) {
    _foto2titulo1 = value;
  }

  bool _fotoAtivoTitulo1 = false;
  bool get fotoAtivoTitulo1 => _fotoAtivoTitulo1;
  set fotoAtivoTitulo1(bool value) {
    _fotoAtivoTitulo1 = value;
  }

  bool _fotoAtivoTitulo2 = false;
  bool get fotoAtivoTitulo2 => _fotoAtivoTitulo2;
  set fotoAtivoTitulo2(bool value) {
    _fotoAtivoTitulo2 = value;
  }

  String _opcao3titulo1 = '';
  String get opcao3titulo1 => _opcao3titulo1;
  set opcao3titulo1(String value) {
    _opcao3titulo1 = value;
  }

  String _foto3titulo1 = '';
  String get foto3titulo1 => _foto3titulo1;
  set foto3titulo1(String value) {
    _foto3titulo1 = value;
  }

  String _opcao4titulo1 = '';
  String get opcao4titulo1 => _opcao4titulo1;
  set opcao4titulo1(String value) {
    _opcao4titulo1 = value;
  }

  String _foto4titulo1 = '';
  String get foto4titulo1 => _foto4titulo1;
  set foto4titulo1(String value) {
    _foto4titulo1 = value;
  }

  String _opcao5titulo1 = '';
  String get opcao5titulo1 => _opcao5titulo1;
  set opcao5titulo1(String value) {
    _opcao5titulo1 = value;
  }

  String _foto5titulo1 = '';
  String get foto5titulo1 => _foto5titulo1;
  set foto5titulo1(String value) {
    _foto5titulo1 = value;
  }

  String _opcao6titulo1 = '';
  String get opcao6titulo1 => _opcao6titulo1;
  set opcao6titulo1(String value) {
    _opcao6titulo1 = value;
  }

  String _foto6titulo1 = '';
  String get foto6titulo1 => _foto6titulo1;
  set foto6titulo1(String value) {
    _foto6titulo1 = value;
  }

  String _opcao7titulo1 = '';
  String get opcao7titulo1 => _opcao7titulo1;
  set opcao7titulo1(String value) {
    _opcao7titulo1 = value;
  }

  String _foto7titulo1 = '';
  String get foto7titulo1 => _foto7titulo1;
  set foto7titulo1(String value) {
    _foto7titulo1 = value;
  }

  String _opcao8titulo1 = '';
  String get opcao8titulo1 => _opcao8titulo1;
  set opcao8titulo1(String value) {
    _opcao8titulo1 = value;
  }

  String _foto8titulo1 = '';
  String get foto8titulo1 => _foto8titulo1;
  set foto8titulo1(String value) {
    _foto8titulo1 = value;
  }

  String _opcao9titulo1 = '';
  String get opcao9titulo1 => _opcao9titulo1;
  set opcao9titulo1(String value) {
    _opcao9titulo1 = value;
  }

  String _foto9titulo1 = '';
  String get foto9titulo1 => _foto9titulo1;
  set foto9titulo1(String value) {
    _foto9titulo1 = value;
  }

  String _opcao10titulo1 = '';
  String get opcao10titulo1 => _opcao10titulo1;
  set opcao10titulo1(String value) {
    _opcao10titulo1 = value;
  }

  String _foto10titulo1 = '';
  String get foto10titulo1 => _foto10titulo1;
  set foto10titulo1(String value) {
    _foto10titulo1 = value;
  }

  String _opcao1titulo2 = '';
  String get opcao1titulo2 => _opcao1titulo2;
  set opcao1titulo2(String value) {
    _opcao1titulo2 = value;
  }

  String _opcao2titulo2 = '';
  String get opcao2titulo2 => _opcao2titulo2;
  set opcao2titulo2(String value) {
    _opcao2titulo2 = value;
  }

  String _opcao3titulo2 = '';
  String get opcao3titulo2 => _opcao3titulo2;
  set opcao3titulo2(String value) {
    _opcao3titulo2 = value;
  }

  String _opcao4titulo2 = '';
  String get opcao4titulo2 => _opcao4titulo2;
  set opcao4titulo2(String value) {
    _opcao4titulo2 = value;
  }

  String _opcao5titulo2 = '';
  String get opcao5titulo2 => _opcao5titulo2;
  set opcao5titulo2(String value) {
    _opcao5titulo2 = value;
  }

  String _opcao6titulo2 = '';
  String get opcao6titulo2 => _opcao6titulo2;
  set opcao6titulo2(String value) {
    _opcao6titulo2 = value;
  }

  String _opcao7titulo2 = '';
  String get opcao7titulo2 => _opcao7titulo2;
  set opcao7titulo2(String value) {
    _opcao7titulo2 = value;
  }

  String _opcao8titulo2 = '';
  String get opcao8titulo2 => _opcao8titulo2;
  set opcao8titulo2(String value) {
    _opcao8titulo2 = value;
  }

  String _opcao9titulo2 = '';
  String get opcao9titulo2 => _opcao9titulo2;
  set opcao9titulo2(String value) {
    _opcao9titulo2 = value;
  }

  String _opcao10titulo2 = '';
  String get opcao10titulo2 => _opcao10titulo2;
  set opcao10titulo2(String value) {
    _opcao10titulo2 = value;
  }

  bool _opcao1selecionado = false;
  bool get opcao1selecionado => _opcao1selecionado;
  set opcao1selecionado(bool value) {
    _opcao1selecionado = value;
  }

  bool _opcao2selecionado = false;
  bool get opcao2selecionado => _opcao2selecionado;
  set opcao2selecionado(bool value) {
    _opcao2selecionado = value;
  }

  String _opcao1preco = '';
  String get opcao1preco => _opcao1preco;
  set opcao1preco(String value) {
    _opcao1preco = value;
  }

  String _opcao1estoque = '';
  String get opcao1estoque => _opcao1estoque;
  set opcao1estoque(String value) {
    _opcao1estoque = value;
  }

  String _opcao12preco = '';
  String get opcao12preco => _opcao12preco;
  set opcao12preco(String value) {
    _opcao12preco = value;
  }

  String _opcao12estoque = '';
  String get opcao12estoque => _opcao12estoque;
  set opcao12estoque(String value) {
    _opcao12estoque = value;
  }

  String _opcao13preco = '';
  String get opcao13preco => _opcao13preco;
  set opcao13preco(String value) {
    _opcao13preco = value;
  }

  String _opcao13estoque = '';
  String get opcao13estoque => _opcao13estoque;
  set opcao13estoque(String value) {
    _opcao13estoque = value;
  }

  String _opcao14preco = '';
  String get opcao14preco => _opcao14preco;
  set opcao14preco(String value) {
    _opcao14preco = value;
  }

  String _opcao14estoque = '';
  String get opcao14estoque => _opcao14estoque;
  set opcao14estoque(String value) {
    _opcao14estoque = value;
  }

  String _opcao15preco = '';
  String get opcao15preco => _opcao15preco;
  set opcao15preco(String value) {
    _opcao15preco = value;
  }

  String _opcao15estoque = '';
  String get opcao15estoque => _opcao15estoque;
  set opcao15estoque(String value) {
    _opcao15estoque = value;
  }

  String _opcao16preco = '';
  String get opcao16preco => _opcao16preco;
  set opcao16preco(String value) {
    _opcao16preco = value;
  }

  String _opcao16estoque = '';
  String get opcao16estoque => _opcao16estoque;
  set opcao16estoque(String value) {
    _opcao16estoque = value;
  }

  String _opcao17preco = '';
  String get opcao17preco => _opcao17preco;
  set opcao17preco(String value) {
    _opcao17preco = value;
  }

  String _opcao17estoque = '';
  String get opcao17estoque => _opcao17estoque;
  set opcao17estoque(String value) {
    _opcao17estoque = value;
  }

  String _opcao18preco = '';
  String get opcao18preco => _opcao18preco;
  set opcao18preco(String value) {
    _opcao18preco = value;
  }

  String _opcao18estoque = '';
  String get opcao18estoque => _opcao18estoque;
  set opcao18estoque(String value) {
    _opcao18estoque = value;
  }

  String _opcao19preco = '';
  String get opcao19preco => _opcao19preco;
  set opcao19preco(String value) {
    _opcao19preco = value;
  }

  String _opcao19estoque = '';
  String get opcao19estoque => _opcao19estoque;
  set opcao19estoque(String value) {
    _opcao19estoque = value;
  }

  String _opcao110preco = '';
  String get opcao110preco => _opcao110preco;
  set opcao110preco(String value) {
    _opcao110preco = value;
  }

  String _opcao110estoque = '';
  String get opcao110estoque => _opcao110estoque;
  set opcao110estoque(String value) {
    _opcao110estoque = value;
  }

  bool _naoliberar = false;
  bool get naoliberar => _naoliberar;
  set naoliberar(bool value) {
    _naoliberar = value;
  }

  bool _opcao3selecionado = false;
  bool get opcao3selecionado => _opcao3selecionado;
  set opcao3selecionado(bool value) {
    _opcao3selecionado = value;
  }

  bool _opcao4selecionado = false;
  bool get opcao4selecionado => _opcao4selecionado;
  set opcao4selecionado(bool value) {
    _opcao4selecionado = value;
  }

  bool _opcao5selecionado = false;
  bool get opcao5selecionado => _opcao5selecionado;
  set opcao5selecionado(bool value) {
    _opcao5selecionado = value;
  }

  bool _opcao6selecionado = false;
  bool get opcao6selecionado => _opcao6selecionado;
  set opcao6selecionado(bool value) {
    _opcao6selecionado = value;
  }

  bool _opcao7selecionado = false;
  bool get opcao7selecionado => _opcao7selecionado;
  set opcao7selecionado(bool value) {
    _opcao7selecionado = value;
  }

  bool _opcao8selecionado = false;
  bool get opcao8selecionado => _opcao8selecionado;
  set opcao8selecionado(bool value) {
    _opcao8selecionado = value;
  }

  bool _opcao9selecionado = false;
  bool get opcao9selecionado => _opcao9selecionado;
  set opcao9selecionado(bool value) {
    _opcao9selecionado = value;
  }

  bool _opcao10selecionado = false;
  bool get opcao10selecionado => _opcao10selecionado;
  set opcao10selecionado(bool value) {
    _opcao10selecionado = value;
  }

  String _opcao21preco = '';
  String get opcao21preco => _opcao21preco;
  set opcao21preco(String value) {
    _opcao21preco = value;
  }

  String _opcao21estoque = '';
  String get opcao21estoque => _opcao21estoque;
  set opcao21estoque(String value) {
    _opcao21estoque = value;
  }

  String _opcao22preco = '';
  String get opcao22preco => _opcao22preco;
  set opcao22preco(String value) {
    _opcao22preco = value;
  }

  String _opcao22estoque = '';
  String get opcao22estoque => _opcao22estoque;
  set opcao22estoque(String value) {
    _opcao22estoque = value;
  }

  String _opcao23preco = '';
  String get opcao23preco => _opcao23preco;
  set opcao23preco(String value) {
    _opcao23preco = value;
  }

  String _opcao23estoque = '';
  String get opcao23estoque => _opcao23estoque;
  set opcao23estoque(String value) {
    _opcao23estoque = value;
  }

  String _opcao24preco = '';
  String get opcao24preco => _opcao24preco;
  set opcao24preco(String value) {
    _opcao24preco = value;
  }

  String _opcao24estoque = '';
  String get opcao24estoque => _opcao24estoque;
  set opcao24estoque(String value) {
    _opcao24estoque = value;
  }

  String _opcao25preco = '';
  String get opcao25preco => _opcao25preco;
  set opcao25preco(String value) {
    _opcao25preco = value;
  }

  String _opcao25estoque = '';
  String get opcao25estoque => _opcao25estoque;
  set opcao25estoque(String value) {
    _opcao25estoque = value;
  }

  String _opcao26preco = '';
  String get opcao26preco => _opcao26preco;
  set opcao26preco(String value) {
    _opcao26preco = value;
  }

  String _opcao26estoque = '';
  String get opcao26estoque => _opcao26estoque;
  set opcao26estoque(String value) {
    _opcao26estoque = value;
  }

  String _opcao27preco = '';
  String get opcao27preco => _opcao27preco;
  set opcao27preco(String value) {
    _opcao27preco = value;
  }

  String _opcao27estoque = '';
  String get opcao27estoque => _opcao27estoque;
  set opcao27estoque(String value) {
    _opcao27estoque = value;
  }

  String _opcao28preco = '';
  String get opcao28preco => _opcao28preco;
  set opcao28preco(String value) {
    _opcao28preco = value;
  }

  String _opcao28estoque = '';
  String get opcao28estoque => _opcao28estoque;
  set opcao28estoque(String value) {
    _opcao28estoque = value;
  }

  String _opcao29preco = '';
  String get opcao29preco => _opcao29preco;
  set opcao29preco(String value) {
    _opcao29preco = value;
  }

  String _opcao29estoque = '';
  String get opcao29estoque => _opcao29estoque;
  set opcao29estoque(String value) {
    _opcao29estoque = value;
  }

  String _opcao210preco = '';
  String get opcao210preco => _opcao210preco;
  set opcao210preco(String value) {
    _opcao210preco = value;
  }

  String _opcao210estoque = '';
  String get opcao210estoque => _opcao210estoque;
  set opcao210estoque(String value) {
    _opcao210estoque = value;
  }

  String _opcao31preco = '';
  String get opcao31preco => _opcao31preco;
  set opcao31preco(String value) {
    _opcao31preco = value;
  }

  String _opcao31estoque = '';
  String get opcao31estoque => _opcao31estoque;
  set opcao31estoque(String value) {
    _opcao31estoque = value;
  }

  String _opcao32preco = '';
  String get opcao32preco => _opcao32preco;
  set opcao32preco(String value) {
    _opcao32preco = value;
  }

  String _opcao32estoque = '';
  String get opcao32estoque => _opcao32estoque;
  set opcao32estoque(String value) {
    _opcao32estoque = value;
  }

  String _opcao33preco = '';
  String get opcao33preco => _opcao33preco;
  set opcao33preco(String value) {
    _opcao33preco = value;
  }

  String _opcao33estoque = '';
  String get opcao33estoque => _opcao33estoque;
  set opcao33estoque(String value) {
    _opcao33estoque = value;
  }

  String _opcao34preco = '';
  String get opcao34preco => _opcao34preco;
  set opcao34preco(String value) {
    _opcao34preco = value;
  }

  String _opcao34estoque = '';
  String get opcao34estoque => _opcao34estoque;
  set opcao34estoque(String value) {
    _opcao34estoque = value;
  }

  String _opcao35preco = '';
  String get opcao35preco => _opcao35preco;
  set opcao35preco(String value) {
    _opcao35preco = value;
  }

  String _opcao35estoque = '';
  String get opcao35estoque => _opcao35estoque;
  set opcao35estoque(String value) {
    _opcao35estoque = value;
  }

  String _opcao36preco = '';
  String get opcao36preco => _opcao36preco;
  set opcao36preco(String value) {
    _opcao36preco = value;
  }

  String _opcao37estoque = '';
  String get opcao37estoque => _opcao37estoque;
  set opcao37estoque(String value) {
    _opcao37estoque = value;
  }

  String _opcao38preco = '';
  String get opcao38preco => _opcao38preco;
  set opcao38preco(String value) {
    _opcao38preco = value;
  }

  String _opcao38estoque = '';
  String get opcao38estoque => _opcao38estoque;
  set opcao38estoque(String value) {
    _opcao38estoque = value;
  }

  String _opcao39preco = '';
  String get opcao39preco => _opcao39preco;
  set opcao39preco(String value) {
    _opcao39preco = value;
  }

  String _opcao39estoque = '';
  String get opcao39estoque => _opcao39estoque;
  set opcao39estoque(String value) {
    _opcao39estoque = value;
  }

  String _opcao310preco = '';
  String get opcao310preco => _opcao310preco;
  set opcao310preco(String value) {
    _opcao310preco = value;
  }

  String _opcao310estoque = '';
  String get opcao310estoque => _opcao310estoque;
  set opcao310estoque(String value) {
    _opcao310estoque = value;
  }

  String _opcao36estoque = '';
  String get opcao36estoque => _opcao36estoque;
  set opcao36estoque(String value) {
    _opcao36estoque = value;
  }

  String _opcao37preco = '';
  String get opcao37preco => _opcao37preco;
  set opcao37preco(String value) {
    _opcao37preco = value;
  }

  String _opcao41preco = '';
  String get opcao41preco => _opcao41preco;
  set opcao41preco(String value) {
    _opcao41preco = value;
  }

  String _opcao41estoque = '';
  String get opcao41estoque => _opcao41estoque;
  set opcao41estoque(String value) {
    _opcao41estoque = value;
  }

  String _opcao42preco = '';
  String get opcao42preco => _opcao42preco;
  set opcao42preco(String value) {
    _opcao42preco = value;
  }

  String _opcao42estoque = '';
  String get opcao42estoque => _opcao42estoque;
  set opcao42estoque(String value) {
    _opcao42estoque = value;
  }

  String _opcao43preco = '';
  String get opcao43preco => _opcao43preco;
  set opcao43preco(String value) {
    _opcao43preco = value;
  }

  String _opcao43estoque = '';
  String get opcao43estoque => _opcao43estoque;
  set opcao43estoque(String value) {
    _opcao43estoque = value;
  }

  String _opcao44preco = '';
  String get opcao44preco => _opcao44preco;
  set opcao44preco(String value) {
    _opcao44preco = value;
  }

  String _opcao44estoque = '';
  String get opcao44estoque => _opcao44estoque;
  set opcao44estoque(String value) {
    _opcao44estoque = value;
  }

  String _opcao45preco = '';
  String get opcao45preco => _opcao45preco;
  set opcao45preco(String value) {
    _opcao45preco = value;
  }

  String _opcao45estoque = '';
  String get opcao45estoque => _opcao45estoque;
  set opcao45estoque(String value) {
    _opcao45estoque = value;
  }

  String _opcao46preco = '';
  String get opcao46preco => _opcao46preco;
  set opcao46preco(String value) {
    _opcao46preco = value;
  }

  String _opcao46estoque = '';
  String get opcao46estoque => _opcao46estoque;
  set opcao46estoque(String value) {
    _opcao46estoque = value;
  }

  String _opcao47preco = '';
  String get opcao47preco => _opcao47preco;
  set opcao47preco(String value) {
    _opcao47preco = value;
  }

  String _opcao47estoque = '';
  String get opcao47estoque => _opcao47estoque;
  set opcao47estoque(String value) {
    _opcao47estoque = value;
  }

  String _opcao48preco = '';
  String get opcao48preco => _opcao48preco;
  set opcao48preco(String value) {
    _opcao48preco = value;
  }

  String _opcao48estoque = '';
  String get opcao48estoque => _opcao48estoque;
  set opcao48estoque(String value) {
    _opcao48estoque = value;
  }

  String _opcao49preco = '';
  String get opcao49preco => _opcao49preco;
  set opcao49preco(String value) {
    _opcao49preco = value;
  }

  String _opcao49estoque = '';
  String get opcao49estoque => _opcao49estoque;
  set opcao49estoque(String value) {
    _opcao49estoque = value;
  }

  String _opcao410preco = '';
  String get opcao410preco => _opcao410preco;
  set opcao410preco(String value) {
    _opcao410preco = value;
  }

  String _opcao410estoque = '';
  String get opcao410estoque => _opcao410estoque;
  set opcao410estoque(String value) {
    _opcao410estoque = value;
  }

  String _opcao51preco = '';
  String get opcao51preco => _opcao51preco;
  set opcao51preco(String value) {
    _opcao51preco = value;
  }

  String _opcao51estoque = '';
  String get opcao51estoque => _opcao51estoque;
  set opcao51estoque(String value) {
    _opcao51estoque = value;
  }

  String _opcao52preco = '';
  String get opcao52preco => _opcao52preco;
  set opcao52preco(String value) {
    _opcao52preco = value;
  }

  String _opcao52estoque = '';
  String get opcao52estoque => _opcao52estoque;
  set opcao52estoque(String value) {
    _opcao52estoque = value;
  }

  String _opcao53preco = '';
  String get opcao53preco => _opcao53preco;
  set opcao53preco(String value) {
    _opcao53preco = value;
  }

  String _opcao53estoque = '';
  String get opcao53estoque => _opcao53estoque;
  set opcao53estoque(String value) {
    _opcao53estoque = value;
  }

  String _opcao54preco = '';
  String get opcao54preco => _opcao54preco;
  set opcao54preco(String value) {
    _opcao54preco = value;
  }

  String _opcao54estoque = '';
  String get opcao54estoque => _opcao54estoque;
  set opcao54estoque(String value) {
    _opcao54estoque = value;
  }

  String _opcao55preco = '';
  String get opcao55preco => _opcao55preco;
  set opcao55preco(String value) {
    _opcao55preco = value;
  }

  String _opcao55estoque = '';
  String get opcao55estoque => _opcao55estoque;
  set opcao55estoque(String value) {
    _opcao55estoque = value;
  }

  String _opcao56preco = '';
  String get opcao56preco => _opcao56preco;
  set opcao56preco(String value) {
    _opcao56preco = value;
  }

  String _opcao56estoque = '';
  String get opcao56estoque => _opcao56estoque;
  set opcao56estoque(String value) {
    _opcao56estoque = value;
  }

  String _opcao57preco = '';
  String get opcao57preco => _opcao57preco;
  set opcao57preco(String value) {
    _opcao57preco = value;
  }

  String _opcao57estoque = '';
  String get opcao57estoque => _opcao57estoque;
  set opcao57estoque(String value) {
    _opcao57estoque = value;
  }

  String _opcao58preco = '';
  String get opcao58preco => _opcao58preco;
  set opcao58preco(String value) {
    _opcao58preco = value;
  }

  String _opcao58estoque = '';
  String get opcao58estoque => _opcao58estoque;
  set opcao58estoque(String value) {
    _opcao58estoque = value;
  }

  String _opcao59preco = '';
  String get opcao59preco => _opcao59preco;
  set opcao59preco(String value) {
    _opcao59preco = value;
  }

  String _opcao59estoque = '';
  String get opcao59estoque => _opcao59estoque;
  set opcao59estoque(String value) {
    _opcao59estoque = value;
  }

  String _opcao510preco = '';
  String get opcao510preco => _opcao510preco;
  set opcao510preco(String value) {
    _opcao510preco = value;
  }

  String _opcao510estoque = '';
  String get opcao510estoque => _opcao510estoque;
  set opcao510estoque(String value) {
    _opcao510estoque = value;
  }

  String _opcao61preco = '';
  String get opcao61preco => _opcao61preco;
  set opcao61preco(String value) {
    _opcao61preco = value;
  }

  String _opcao61estoque = '';
  String get opcao61estoque => _opcao61estoque;
  set opcao61estoque(String value) {
    _opcao61estoque = value;
  }

  String _opcao62preco = '';
  String get opcao62preco => _opcao62preco;
  set opcao62preco(String value) {
    _opcao62preco = value;
  }

  String _opcao62estoque = '';
  String get opcao62estoque => _opcao62estoque;
  set opcao62estoque(String value) {
    _opcao62estoque = value;
  }

  String _opcao63preco = '';
  String get opcao63preco => _opcao63preco;
  set opcao63preco(String value) {
    _opcao63preco = value;
  }

  String _opcao63estoque = '';
  String get opcao63estoque => _opcao63estoque;
  set opcao63estoque(String value) {
    _opcao63estoque = value;
  }

  String _opcao64preco = '';
  String get opcao64preco => _opcao64preco;
  set opcao64preco(String value) {
    _opcao64preco = value;
  }

  String _opcao65estoque = '';
  String get opcao65estoque => _opcao65estoque;
  set opcao65estoque(String value) {
    _opcao65estoque = value;
  }

  String _opcao65preco = '';
  String get opcao65preco => _opcao65preco;
  set opcao65preco(String value) {
    _opcao65preco = value;
  }

  String _opcao66preco = '';
  String get opcao66preco => _opcao66preco;
  set opcao66preco(String value) {
    _opcao66preco = value;
  }

  String _opcao67estoque = '';
  String get opcao67estoque => _opcao67estoque;
  set opcao67estoque(String value) {
    _opcao67estoque = value;
  }

  String _opcao68preco = '';
  String get opcao68preco => _opcao68preco;
  set opcao68preco(String value) {
    _opcao68preco = value;
  }

  String _opcao68estoque = '';
  String get opcao68estoque => _opcao68estoque;
  set opcao68estoque(String value) {
    _opcao68estoque = value;
  }

  String _opcao69preco = '';
  String get opcao69preco => _opcao69preco;
  set opcao69preco(String value) {
    _opcao69preco = value;
  }

  String _opcao69estoque = '';
  String get opcao69estoque => _opcao69estoque;
  set opcao69estoque(String value) {
    _opcao69estoque = value;
  }

  String _opcao610preco = '';
  String get opcao610preco => _opcao610preco;
  set opcao610preco(String value) {
    _opcao610preco = value;
  }

  String _opcao610estoque = '';
  String get opcao610estoque => _opcao610estoque;
  set opcao610estoque(String value) {
    _opcao610estoque = value;
  }

  String _opcao64estoque = '';
  String get opcao64estoque => _opcao64estoque;
  set opcao64estoque(String value) {
    _opcao64estoque = value;
  }

  String _opcao66estoque = '';
  String get opcao66estoque => _opcao66estoque;
  set opcao66estoque(String value) {
    _opcao66estoque = value;
  }

  String _opcao67preco = '';
  String get opcao67preco => _opcao67preco;
  set opcao67preco(String value) {
    _opcao67preco = value;
  }

  String _opcao71preco = '';
  String get opcao71preco => _opcao71preco;
  set opcao71preco(String value) {
    _opcao71preco = value;
  }

  String _opcao71estoque = '';
  String get opcao71estoque => _opcao71estoque;
  set opcao71estoque(String value) {
    _opcao71estoque = value;
  }

  String _opcao72preco = '';
  String get opcao72preco => _opcao72preco;
  set opcao72preco(String value) {
    _opcao72preco = value;
  }

  String _opcao72estoque = '';
  String get opcao72estoque => _opcao72estoque;
  set opcao72estoque(String value) {
    _opcao72estoque = value;
  }

  String _opcao73preco = '';
  String get opcao73preco => _opcao73preco;
  set opcao73preco(String value) {
    _opcao73preco = value;
  }

  String _opcao73estoque = '';
  String get opcao73estoque => _opcao73estoque;
  set opcao73estoque(String value) {
    _opcao73estoque = value;
  }

  String _opcao74preco = '';
  String get opcao74preco => _opcao74preco;
  set opcao74preco(String value) {
    _opcao74preco = value;
  }

  String _opcao74estoque = '';
  String get opcao74estoque => _opcao74estoque;
  set opcao74estoque(String value) {
    _opcao74estoque = value;
  }

  String _opcao75preco = '';
  String get opcao75preco => _opcao75preco;
  set opcao75preco(String value) {
    _opcao75preco = value;
  }

  String _opcao75estoque = '';
  String get opcao75estoque => _opcao75estoque;
  set opcao75estoque(String value) {
    _opcao75estoque = value;
  }

  String _opcao76preco = '';
  String get opcao76preco => _opcao76preco;
  set opcao76preco(String value) {
    _opcao76preco = value;
  }

  String _opcao76estoque = '';
  String get opcao76estoque => _opcao76estoque;
  set opcao76estoque(String value) {
    _opcao76estoque = value;
  }

  String _opcao77preco = '';
  String get opcao77preco => _opcao77preco;
  set opcao77preco(String value) {
    _opcao77preco = value;
  }

  String _opcao77estoque = '';
  String get opcao77estoque => _opcao77estoque;
  set opcao77estoque(String value) {
    _opcao77estoque = value;
  }

  String _opcao78preco = '';
  String get opcao78preco => _opcao78preco;
  set opcao78preco(String value) {
    _opcao78preco = value;
  }

  String _opcao78estoque = '';
  String get opcao78estoque => _opcao78estoque;
  set opcao78estoque(String value) {
    _opcao78estoque = value;
  }

  String _opcao79preco = '';
  String get opcao79preco => _opcao79preco;
  set opcao79preco(String value) {
    _opcao79preco = value;
  }

  String _opcao79estoque = '';
  String get opcao79estoque => _opcao79estoque;
  set opcao79estoque(String value) {
    _opcao79estoque = value;
  }

  String _opcao710preco = '';
  String get opcao710preco => _opcao710preco;
  set opcao710preco(String value) {
    _opcao710preco = value;
  }

  String _opcao710estoque = '';
  String get opcao710estoque => _opcao710estoque;
  set opcao710estoque(String value) {
    _opcao710estoque = value;
  }

  String _opcao81preco = '';
  String get opcao81preco => _opcao81preco;
  set opcao81preco(String value) {
    _opcao81preco = value;
  }

  String _opcao81estoque = '';
  String get opcao81estoque => _opcao81estoque;
  set opcao81estoque(String value) {
    _opcao81estoque = value;
  }

  String _opcao82preco = '';
  String get opcao82preco => _opcao82preco;
  set opcao82preco(String value) {
    _opcao82preco = value;
  }

  String _opcao82estoque = '';
  String get opcao82estoque => _opcao82estoque;
  set opcao82estoque(String value) {
    _opcao82estoque = value;
  }

  String _opcao83preco = '';
  String get opcao83preco => _opcao83preco;
  set opcao83preco(String value) {
    _opcao83preco = value;
  }

  String _opcao83estoque = '';
  String get opcao83estoque => _opcao83estoque;
  set opcao83estoque(String value) {
    _opcao83estoque = value;
  }

  String _opcao84preco = '';
  String get opcao84preco => _opcao84preco;
  set opcao84preco(String value) {
    _opcao84preco = value;
  }

  String _opcao84estoque = '';
  String get opcao84estoque => _opcao84estoque;
  set opcao84estoque(String value) {
    _opcao84estoque = value;
  }

  String _opcao85preco = '';
  String get opcao85preco => _opcao85preco;
  set opcao85preco(String value) {
    _opcao85preco = value;
  }

  String _opcao85estoque = '';
  String get opcao85estoque => _opcao85estoque;
  set opcao85estoque(String value) {
    _opcao85estoque = value;
  }

  String _opcao86preco = '';
  String get opcao86preco => _opcao86preco;
  set opcao86preco(String value) {
    _opcao86preco = value;
  }

  String _opcao86estoque = '';
  String get opcao86estoque => _opcao86estoque;
  set opcao86estoque(String value) {
    _opcao86estoque = value;
  }

  String _opcao87preco = '';
  String get opcao87preco => _opcao87preco;
  set opcao87preco(String value) {
    _opcao87preco = value;
  }

  String _opcao87estoque = '';
  String get opcao87estoque => _opcao87estoque;
  set opcao87estoque(String value) {
    _opcao87estoque = value;
  }

  String _opcao88preco = '';
  String get opcao88preco => _opcao88preco;
  set opcao88preco(String value) {
    _opcao88preco = value;
  }

  String _opcao88estoque = '';
  String get opcao88estoque => _opcao88estoque;
  set opcao88estoque(String value) {
    _opcao88estoque = value;
  }

  String _opcao89preco = '';
  String get opcao89preco => _opcao89preco;
  set opcao89preco(String value) {
    _opcao89preco = value;
  }

  String _opcao89estoque = '';
  String get opcao89estoque => _opcao89estoque;
  set opcao89estoque(String value) {
    _opcao89estoque = value;
  }

  String _opcao810preco = '';
  String get opcao810preco => _opcao810preco;
  set opcao810preco(String value) {
    _opcao810preco = value;
  }

  String _opcao810estoque = '';
  String get opcao810estoque => _opcao810estoque;
  set opcao810estoque(String value) {
    _opcao810estoque = value;
  }

  String _opcao91preco = '';
  String get opcao91preco => _opcao91preco;
  set opcao91preco(String value) {
    _opcao91preco = value;
  }

  String _opcao91estoque = '';
  String get opcao91estoque => _opcao91estoque;
  set opcao91estoque(String value) {
    _opcao91estoque = value;
  }

  String _opcao92preco = '';
  String get opcao92preco => _opcao92preco;
  set opcao92preco(String value) {
    _opcao92preco = value;
  }

  String _opcao92estoque = '';
  String get opcao92estoque => _opcao92estoque;
  set opcao92estoque(String value) {
    _opcao92estoque = value;
  }

  String _opcao93preco = '';
  String get opcao93preco => _opcao93preco;
  set opcao93preco(String value) {
    _opcao93preco = value;
  }

  String _opcao93estoque = '';
  String get opcao93estoque => _opcao93estoque;
  set opcao93estoque(String value) {
    _opcao93estoque = value;
  }

  String _opcao94preco = '';
  String get opcao94preco => _opcao94preco;
  set opcao94preco(String value) {
    _opcao94preco = value;
  }

  String _opcao94estoque = '';
  String get opcao94estoque => _opcao94estoque;
  set opcao94estoque(String value) {
    _opcao94estoque = value;
  }

  String _opcao95preco = '';
  String get opcao95preco => _opcao95preco;
  set opcao95preco(String value) {
    _opcao95preco = value;
  }

  String _opcao95estoque = '';
  String get opcao95estoque => _opcao95estoque;
  set opcao95estoque(String value) {
    _opcao95estoque = value;
  }

  String _opcao96preco = '';
  String get opcao96preco => _opcao96preco;
  set opcao96preco(String value) {
    _opcao96preco = value;
  }

  String _opcao96estoque = '';
  String get opcao96estoque => _opcao96estoque;
  set opcao96estoque(String value) {
    _opcao96estoque = value;
  }

  String _opcao97preco = '';
  String get opcao97preco => _opcao97preco;
  set opcao97preco(String value) {
    _opcao97preco = value;
  }

  String _opcao97estoque = '';
  String get opcao97estoque => _opcao97estoque;
  set opcao97estoque(String value) {
    _opcao97estoque = value;
  }

  String _opcao98preco = '';
  String get opcao98preco => _opcao98preco;
  set opcao98preco(String value) {
    _opcao98preco = value;
  }

  String _opcao98estoque = '';
  String get opcao98estoque => _opcao98estoque;
  set opcao98estoque(String value) {
    _opcao98estoque = value;
  }

  String _opcao99preco = '';
  String get opcao99preco => _opcao99preco;
  set opcao99preco(String value) {
    _opcao99preco = value;
  }

  String _opcao99estoque = '';
  String get opcao99estoque => _opcao99estoque;
  set opcao99estoque(String value) {
    _opcao99estoque = value;
  }

  String _opcao910preco = '';
  String get opcao910preco => _opcao910preco;
  set opcao910preco(String value) {
    _opcao910preco = value;
  }

  String _opcao910estoque = '';
  String get opcao910estoque => _opcao910estoque;
  set opcao910estoque(String value) {
    _opcao910estoque = value;
  }

  String _opcao101preco = '';
  String get opcao101preco => _opcao101preco;
  set opcao101preco(String value) {
    _opcao101preco = value;
  }

  String _opcao101estoque = '';
  String get opcao101estoque => _opcao101estoque;
  set opcao101estoque(String value) {
    _opcao101estoque = value;
  }

  String _opcao102preco = '';
  String get opcao102preco => _opcao102preco;
  set opcao102preco(String value) {
    _opcao102preco = value;
  }

  String _opcao102estoque = '';
  String get opcao102estoque => _opcao102estoque;
  set opcao102estoque(String value) {
    _opcao102estoque = value;
  }

  String _opcao103preco = '';
  String get opcao103preco => _opcao103preco;
  set opcao103preco(String value) {
    _opcao103preco = value;
  }

  String _opcao103estoque = '';
  String get opcao103estoque => _opcao103estoque;
  set opcao103estoque(String value) {
    _opcao103estoque = value;
  }

  String _opcao104preco = '';
  String get opcao104preco => _opcao104preco;
  set opcao104preco(String value) {
    _opcao104preco = value;
  }

  String _opcao104estoque = '';
  String get opcao104estoque => _opcao104estoque;
  set opcao104estoque(String value) {
    _opcao104estoque = value;
  }

  String _opcao105preco = '';
  String get opcao105preco => _opcao105preco;
  set opcao105preco(String value) {
    _opcao105preco = value;
  }

  String _opcao105estoque = '';
  String get opcao105estoque => _opcao105estoque;
  set opcao105estoque(String value) {
    _opcao105estoque = value;
  }

  String _opcao106preco = '';
  String get opcao106preco => _opcao106preco;
  set opcao106preco(String value) {
    _opcao106preco = value;
  }

  String _opcao106estoque = '';
  String get opcao106estoque => _opcao106estoque;
  set opcao106estoque(String value) {
    _opcao106estoque = value;
  }

  String _opcao107preco = '';
  String get opcao107preco => _opcao107preco;
  set opcao107preco(String value) {
    _opcao107preco = value;
  }

  String _opcao107estoque = '';
  String get opcao107estoque => _opcao107estoque;
  set opcao107estoque(String value) {
    _opcao107estoque = value;
  }

  String _opcao108preco = '';
  String get opcao108preco => _opcao108preco;
  set opcao108preco(String value) {
    _opcao108preco = value;
  }

  String _opcao108estoque = '';
  String get opcao108estoque => _opcao108estoque;
  set opcao108estoque(String value) {
    _opcao108estoque = value;
  }

  String _opcao109preco = '';
  String get opcao109preco => _opcao109preco;
  set opcao109preco(String value) {
    _opcao109preco = value;
  }

  String _opcao109estoque = '';
  String get opcao109estoque => _opcao109estoque;
  set opcao109estoque(String value) {
    _opcao109estoque = value;
  }

  String _opcao1010preco = '';
  String get opcao1010preco => _opcao1010preco;
  set opcao1010preco(String value) {
    _opcao1010preco = value;
  }

  String _opcao1010estoque = '';
  String get opcao1010estoque => _opcao1010estoque;
  set opcao1010estoque(String value) {
    _opcao1010estoque = value;
  }

  String _selecionarVariante1 = '';
  String get selecionarVariante1 => _selecionarVariante1;
  set selecionarVariante1(String value) {
    _selecionarVariante1 = value;
  }

  String _selecionarVariante2 = '';
  String get selecionarVariante2 => _selecionarVariante2;
  set selecionarVariante2(String value) {
    _selecionarVariante2 = value;
  }

  String _selecionarVariante1foto = '';
  String get selecionarVariante1foto => _selecionarVariante1foto;
  set selecionarVariante1foto(String value) {
    _selecionarVariante1foto = value;
  }

  double _menorValor = 0.0;
  double get menorValor => _menorValor;
  set menorValor(double value) {
    _menorValor = value;
  }

  bool _valorDiferente = false;
  bool get valorDiferente => _valorDiferente;
  set valorDiferente(bool value) {
    _valorDiferente = value;
  }

  bool _bennerBaixarAPP = false;
  bool get bennerBaixarAPP => _bennerBaixarAPP;
  set bennerBaixarAPP(bool value) {
    _bennerBaixarAPP = value;
  }

  bool _selecionarOpcao1 = false;
  bool get selecionarOpcao1 => _selecionarOpcao1;
  set selecionarOpcao1(bool value) {
    _selecionarOpcao1 = value;
  }

  bool _selecionarOpcao2 = false;
  bool get selecionarOpcao2 => _selecionarOpcao2;
  set selecionarOpcao2(bool value) {
    _selecionarOpcao2 = value;
  }

  bool _nada = false;
  bool get nada => _nada;
  set nada(bool value) {
    _nada = value;
  }

  String _garantia = '';
  String get garantia => _garantia;
  set garantia(String value) {
    _garantia = value;
  }

  bool _verTudo = false;
  bool get verTudo => _verTudo;
  set verTudo(bool value) {
    _verTudo = value;
  }

  bool _verFrete = false;
  bool get verFrete => _verFrete;
  set verFrete(bool value) {
    _verFrete = value;
  }

  String _freterj = '';
  String get freterj => _freterj;
  set freterj(String value) {
    _freterj = value;
  }

  String _fretesp = '';
  String get fretesp => _fretesp;
  set fretesp(String value) {
    _fretesp = value;
  }

  String _enderecoTemporario = '';
  String get enderecoTemporario => _enderecoTemporario;
  set enderecoTemporario(String value) {
    _enderecoTemporario = value;
  }

  bool _errofrete = false;
  bool get errofrete => _errofrete;
  set errofrete(bool value) {
    _errofrete = value;
  }

  bool _freteAchado = false;
  bool get freteAchado => _freteAchado;
  set freteAchado(bool value) {
    _freteAchado = value;
  }

  bool _adicionarCarrinho = false;
  bool get adicionarCarrinho => _adicionarCarrinho;
  set adicionarCarrinho(bool value) {
    _adicionarCarrinho = value;
  }

  String _tituloProduto = '';
  String get tituloProduto => _tituloProduto;
  set tituloProduto(String value) {
    _tituloProduto = value;
  }

  String _descicaoProduto = '';
  String get descicaoProduto => _descicaoProduto;
  set descicaoProduto(String value) {
    _descicaoProduto = value;
  }

  DocumentReference? _cupomSelecionadoRef;
  DocumentReference? get cupomSelecionadoRef => _cupomSelecionadoRef;
  set cupomSelecionadoRef(DocumentReference? value) {
    _cupomSelecionadoRef = value;
  }

  double _cupomFrete = 0.0;
  double get cupomFrete => _cupomFrete;
  set cupomFrete(double value) {
    _cupomFrete = value;
  }

  String _totalPedido = '';
  String get totalPedido => _totalPedido;
  set totalPedido(String value) {
    _totalPedido = value;
  }

  bool _freteAtualizar = false;
  bool get freteAtualizar => _freteAtualizar;
  set freteAtualizar(bool value) {
    _freteAtualizar = value;
  }

  bool _cupomMais10 = false;
  bool get cupomMais10 => _cupomMais10;
  set cupomMais10(bool value) {
    _cupomMais10 = value;
  }

  bool _cupomMais19 = false;
  bool get cupomMais19 => _cupomMais19;
  set cupomMais19(bool value) {
    _cupomMais19 = value;
  }

  String _lider1 = '';
  String get lider1 => _lider1;
  set lider1(String value) {
    _lider1 = value;
  }

  String _lider2 = '';
  String get lider2 => _lider2;
  set lider2(String value) {
    _lider2 = value;
  }

  String _lider3 = '';
  String get lider3 => _lider3;
  set lider3(String value) {
    _lider3 = value;
  }

  String _lider4 = '';
  String get lider4 => _lider4;
  set lider4(String value) {
    _lider4 = value;
  }

  bool _selecionardoLider1 = false;
  bool get selecionardoLider1 => _selecionardoLider1;
  set selecionardoLider1(bool value) {
    _selecionardoLider1 = value;
  }

  bool _selecionardoLider2 = false;
  bool get selecionardoLider2 => _selecionardoLider2;
  set selecionardoLider2(bool value) {
    _selecionardoLider2 = value;
  }

  bool _selecionardoLider3 = false;
  bool get selecionardoLider3 => _selecionardoLider3;
  set selecionardoLider3(bool value) {
    _selecionardoLider3 = value;
  }

  bool _selecionardoLider4 = false;
  bool get selecionardoLider4 => _selecionardoLider4;
  set selecionardoLider4(bool value) {
    _selecionardoLider4 = value;
  }

  String _categoriasGeral = '';
  String get categoriasGeral => _categoriasGeral;
  set categoriasGeral(String value) {
    _categoriasGeral = value;
  }

  String _fotoCapa = '';
  String get fotoCapa => _fotoCapa;
  set fotoCapa(String value) {
    _fotoCapa = value;
  }

  String _palavraChave = '';
  String get palavraChave => _palavraChave;
  set palavraChave(String value) {
    _palavraChave = value;
  }

  String _filtroPerfilLoja = '';
  String get filtroPerfilLoja => _filtroPerfilLoja;
  set filtroPerfilLoja(String value) {
    _filtroPerfilLoja = value;
  }

  String _filtroPerfilLoja2 = '';
  String get filtroPerfilLoja2 => _filtroPerfilLoja2;
  set filtroPerfilLoja2(String value) {
    _filtroPerfilLoja2 = value;
  }

  String _tipoDeCupom = '';
  String get tipoDeCupom => _tipoDeCupom;
  set tipoDeCupom(String value) {
    _tipoDeCupom = value;
  }

  bool _abrirPedidos = false;
  bool get abrirPedidos => _abrirPedidos;
  set abrirPedidos(bool value) {
    _abrirPedidos = value;
  }

  int _comissaoAfiliadooo = 1;
  int get comissaoAfiliadooo => _comissaoAfiliadooo;
  set comissaoAfiliadooo(int value) {
    _comissaoAfiliadooo = value;
  }

  String _rastreio = '';
  String get rastreio => _rastreio;
  set rastreio(String value) {
    _rastreio = value;
  }

  bool _statusCancelado = false;
  bool get statusCancelado => _statusCancelado;
  set statusCancelado(bool value) {
    _statusCancelado = value;
  }

  String _parceladoApagagar = '';
  String get parceladoApagagar => _parceladoApagagar;
  set parceladoApagagar(String value) {
    _parceladoApagagar = value;
  }

  DocumentReference? _cartaoRef;
  DocumentReference? get cartaoRef => _cartaoRef;
  set cartaoRef(DocumentReference? value) {
    _cartaoRef = value;
  }

  String _metodoPagamento = '';
  String get metodoPagamento => _metodoPagamento;
  set metodoPagamento(String value) {
    _metodoPagamento = value;
  }

  String _taxaProcessamento = '';
  String get taxaProcessamento => _taxaProcessamento;
  set taxaProcessamento(String value) {
    _taxaProcessamento = value;
  }

  String _ccv = '';
  String get ccv => _ccv;
  set ccv(String value) {
    _ccv = value;
  }

  String _IP = '';
  String get IP => _IP;
  set IP(String value) {
    _IP = value;
  }

  String _alertaCVV = '';
  String get alertaCVV => _alertaCVV;
  set alertaCVV(String value) {
    _alertaCVV = value;
  }

  String _IDasaas = '';
  String get IDasaas => _IDasaas;
  set IDasaas(String value) {
    _IDasaas = value;
  }

  String _statusPagamento = '';
  String get statusPagamento => _statusPagamento;
  set statusPagamento(String value) {
    _statusPagamento = value;
  }

  int _idPix = 0;
  int get idPix => _idPix;
  set idPix(int value) {
    _idPix = value;
  }

  String _status = '';
  String get status => _status;
  set status(String value) {
    _status = value;
  }

  String _chavePix = '';
  String get chavePix => _chavePix;
  set chavePix(String value) {
    _chavePix = value;
  }

  DateTime? _vencimentoPix;
  DateTime? get vencimentoPix => _vencimentoPix;
  set vencimentoPix(DateTime? value) {
    _vencimentoPix = value;
  }

  String _pixTimeLimite = '';
  String get pixTimeLimite => _pixTimeLimite;
  set pixTimeLimite(String value) {
    _pixTimeLimite = value;
  }

  List<DocumentReference> _listRefPedido = [];
  List<DocumentReference> get listRefPedido => _listRefPedido;
  set listRefPedido(List<DocumentReference> value) {
    _listRefPedido = value;
  }

  void addToListRefPedido(DocumentReference value) {
    listRefPedido.add(value);
  }

  void removeFromListRefPedido(DocumentReference value) {
    listRefPedido.remove(value);
  }

  void removeAtIndexFromListRefPedido(int index) {
    listRefPedido.removeAt(index);
  }

  void updateListRefPedidoAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    listRefPedido[index] = updateFn(_listRefPedido[index]);
  }

  void insertAtIndexInListRefPedido(int index, DocumentReference value) {
    listRefPedido.insert(index, value);
  }

  double _freteCartaoErro = 0.0;
  double get freteCartaoErro => _freteCartaoErro;
  set freteCartaoErro(double value) {
    _freteCartaoErro = value;
  }

  double _produtosCartaoErro = 0.0;
  double get produtosCartaoErro => _produtosCartaoErro;
  set produtosCartaoErro(double value) {
    _produtosCartaoErro = value;
  }

  double _totalPedidoCartao = 0.0;
  double get totalPedidoCartao => _totalPedidoCartao;
  set totalPedidoCartao(double value) {
    _totalPedidoCartao = value;
  }

  double _taxaCartaoDouble = 0.0;
  double get taxaCartaoDouble => _taxaCartaoDouble;
  set taxaCartaoDouble(double value) {
    _taxaCartaoDouble = value;
  }

  int _quantidadeCarrinhoTrue = 0;
  int get quantidadeCarrinhoTrue => _quantidadeCarrinhoTrue;
  set quantidadeCarrinhoTrue(int value) {
    _quantidadeCarrinhoTrue = value;
  }

  double _moeda = 0.0;
  double get moeda => _moeda;
  set moeda(double value) {
    _moeda = value;
  }

  double _freteantes = 0.0;
  double get freteantes => _freteantes;
  set freteantes(double value) {
    _freteantes = value;
  }

  double _totalPedido2 = 0.0;
  double get totalPedido2 => _totalPedido2;
  set totalPedido2(double value) {
    _totalPedido2 = value;
  }

  double _icms = 0.0;
  double get icms => _icms;
  set icms(double value) {
    _icms = value;
  }

  bool _gerarICSM = false;
  bool get gerarICSM => _gerarICSM;
  set gerarICSM(bool value) {
    _gerarICSM = value;
  }

  double _icmsCartaoErro = 0.0;
  double get icmsCartaoErro => _icmsCartaoErro;
  set icmsCartaoErro(double value) {
    _icmsCartaoErro = value;
  }

  double _impostoImportacaoCartaoErro = 0.0;
  double get impostoImportacaoCartaoErro => _impostoImportacaoCartaoErro;
  set impostoImportacaoCartaoErro(double value) {
    _impostoImportacaoCartaoErro = value;
  }

  bool _pesquisaMostrarMais = false;
  bool get pesquisaMostrarMais => _pesquisaMostrarMais;
  set pesquisaMostrarMais(bool value) {
    _pesquisaMostrarMais = value;
  }

  bool _pesquisaApagarHistorico = false;
  bool get pesquisaApagarHistorico => _pesquisaApagarHistorico;
  set pesquisaApagarHistorico(bool value) {
    _pesquisaApagarHistorico = value;
  }

  List<String> _testeeeeeeeee = [];
  List<String> get testeeeeeeeee => _testeeeeeeeee;
  set testeeeeeeeee(List<String> value) {
    _testeeeeeeeee = value;
  }

  void addToTesteeeeeeeee(String value) {
    testeeeeeeeee.add(value);
  }

  void removeFromTesteeeeeeeee(String value) {
    testeeeeeeeee.remove(value);
  }

  void removeAtIndexFromTesteeeeeeeee(int index) {
    testeeeeeeeee.removeAt(index);
  }

  void updateTesteeeeeeeeeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    testeeeeeeeee[index] = updateFn(_testeeeeeeeee[index]);
  }

  void insertAtIndexInTesteeeeeeeee(int index, String value) {
    testeeeeeeeee.insert(index, value);
  }

  bool _filtroEntregaRapida = false;
  bool get filtroEntregaRapida => _filtroEntregaRapida;
  set filtroEntregaRapida(bool value) {
    _filtroEntregaRapida = value;
  }

  bool _filtroNacional = false;
  bool get filtroNacional => _filtroNacional;
  set filtroNacional(bool value) {
    _filtroNacional = value;
  }

  bool _filtroLojaOficial = false;
  bool get filtroLojaOficial => _filtroLojaOficial;
  set filtroLojaOficial(bool value) {
    _filtroLojaOficial = value;
  }

  bool _filtroInternacional = false;
  bool get filtroInternacional => _filtroInternacional;
  set filtroInternacional(bool value) {
    _filtroInternacional = value;
  }

  bool _filtroRelevencia = false;
  bool get filtroRelevencia => _filtroRelevencia;
  set filtroRelevencia(bool value) {
    _filtroRelevencia = value;
  }

  bool _FiltroDestaque = false;
  bool get FiltroDestaque => _FiltroDestaque;
  set FiltroDestaque(bool value) {
    _FiltroDestaque = value;
  }

  bool _filtroRecente = false;
  bool get filtroRecente => _filtroRecente;
  set filtroRecente(bool value) {
    _filtroRecente = value;
  }

  List<String> _palavraChavePesquisa = [];
  List<String> get palavraChavePesquisa => _palavraChavePesquisa;
  set palavraChavePesquisa(List<String> value) {
    _palavraChavePesquisa = value;
  }

  void addToPalavraChavePesquisa(String value) {
    palavraChavePesquisa.add(value);
  }

  void removeFromPalavraChavePesquisa(String value) {
    palavraChavePesquisa.remove(value);
  }

  void removeAtIndexFromPalavraChavePesquisa(int index) {
    palavraChavePesquisa.removeAt(index);
  }

  void updatePalavraChavePesquisaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    palavraChavePesquisa[index] = updateFn(_palavraChavePesquisa[index]);
  }

  void insertAtIndexInPalavraChavePesquisa(int index, String value) {
    palavraChavePesquisa.insert(index, value);
  }

  String _filtroPreco = '';
  String get filtroPreco => _filtroPreco;
  set filtroPreco(String value) {
    _filtroPreco = value;
  }

  int _liberarMais = 0;
  int get liberarMais => _liberarMais;
  set liberarMais(int value) {
    _liberarMais = value;
  }

  bool _apagarVisto = false;
  bool get apagarVisto => _apagarVisto;
  set apagarVisto(bool value) {
    _apagarVisto = value;
  }

  String _feedDocumentoAntes = '';
  String get feedDocumentoAntes => _feedDocumentoAntes;
  set feedDocumentoAntes(String value) {
    _feedDocumentoAntes = value;
  }

  String _feedDocumentoDepois = '';
  String get feedDocumentoDepois => _feedDocumentoDepois;
  set feedDocumentoDepois(String value) {
    _feedDocumentoDepois = value;
  }

  bool _feedCheio = false;
  bool get feedCheio => _feedCheio;
  set feedCheio(bool value) {
    _feedCheio = value;
  }

  bool _verComissao = false;
  bool get verComissao => _verComissao;
  set verComissao(bool value) {
    _verComissao = value;
  }

  bool _editarCapa = false;
  bool get editarCapa => _editarCapa;
  set editarCapa(bool value) {
    _editarCapa = value;
  }

  String _categoria = '';
  String get categoria => _categoria;
  set categoria(String value) {
    _categoria = value;
  }

  bool _cupomFreteAplicado = false;
  bool get cupomFreteAplicado => _cupomFreteAplicado;
  set cupomFreteAplicado(bool value) {
    _cupomFreteAplicado = value;
  }

  bool _selecionadoTodosNacional = false;
  bool get selecionadoTodosNacional => _selecionadoTodosNacional;
  set selecionadoTodosNacional(bool value) {
    _selecionadoTodosNacional = value;
  }

  bool _selecionadoTodosInternacional = false;
  bool get selecionadoTodosInternacional => _selecionadoTodosInternacional;
  set selecionadoTodosInternacional(bool value) {
    _selecionadoTodosInternacional = value;
  }

  double _descontoFreteAplicado = 0.0;
  double get descontoFreteAplicado => _descontoFreteAplicado;
  set descontoFreteAplicado(double value) {
    _descontoFreteAplicado = value;
  }

  bool _frete50Desconto = false;
  bool get frete50Desconto => _frete50Desconto;
  set frete50Desconto(bool value) {
    _frete50Desconto = value;
  }

  String _horaPromo = '';
  String get horaPromo => _horaPromo;
  set horaPromo(String value) {
    _horaPromo = value;
  }

  String _promoCor = '';
  String get promoCor => _promoCor;
  set promoCor(String value) {
    _promoCor = value;
  }

  bool _abrirCalendario = false;
  bool get abrirCalendario => _abrirCalendario;
  set abrirCalendario(bool value) {
    _abrirCalendario = value;
  }

  String _promoRelampagoHorario = '';
  String get promoRelampagoHorario => _promoRelampagoHorario;
  set promoRelampagoHorario(String value) {
    _promoRelampagoHorario = value;
  }

  DateTime? _promoRelampagoDia;
  DateTime? get promoRelampagoDia => _promoRelampagoDia;
  set promoRelampagoDia(DateTime? value) {
    _promoRelampagoDia = value;
  }

  List<DocumentReference> _promoRelampagoListRef = [];
  List<DocumentReference> get promoRelampagoListRef => _promoRelampagoListRef;
  set promoRelampagoListRef(List<DocumentReference> value) {
    _promoRelampagoListRef = value;
  }

  void addToPromoRelampagoListRef(DocumentReference value) {
    promoRelampagoListRef.add(value);
  }

  void removeFromPromoRelampagoListRef(DocumentReference value) {
    promoRelampagoListRef.remove(value);
  }

  void removeAtIndexFromPromoRelampagoListRef(int index) {
    promoRelampagoListRef.removeAt(index);
  }

  void updatePromoRelampagoListRefAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    promoRelampagoListRef[index] = updateFn(_promoRelampagoListRef[index]);
  }

  void insertAtIndexInPromoRelampagoListRef(
      int index, DocumentReference value) {
    promoRelampagoListRef.insert(index, value);
  }

  List<String> _promoRelampagoFoto = [];
  List<String> get promoRelampagoFoto => _promoRelampagoFoto;
  set promoRelampagoFoto(List<String> value) {
    _promoRelampagoFoto = value;
  }

  void addToPromoRelampagoFoto(String value) {
    promoRelampagoFoto.add(value);
  }

  void removeFromPromoRelampagoFoto(String value) {
    promoRelampagoFoto.remove(value);
  }

  void removeAtIndexFromPromoRelampagoFoto(int index) {
    promoRelampagoFoto.removeAt(index);
  }

  void updatePromoRelampagoFotoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    promoRelampagoFoto[index] = updateFn(_promoRelampagoFoto[index]);
  }

  void insertAtIndexInPromoRelampagoFoto(int index, String value) {
    promoRelampagoFoto.insert(index, value);
  }

  bool _promoRelampago9hVisto = false;
  bool get promoRelampago9hVisto => _promoRelampago9hVisto;
  set promoRelampago9hVisto(bool value) {
    _promoRelampago9hVisto = value;
  }

  bool _promoRelampago0hVisto = false;
  bool get promoRelampago0hVisto => _promoRelampago0hVisto;
  set promoRelampago0hVisto(bool value) {
    _promoRelampago0hVisto = value;
  }

  bool _promoRelampago12hVisto = false;
  bool get promoRelampago12hVisto => _promoRelampago12hVisto;
  set promoRelampago12hVisto(bool value) {
    _promoRelampago12hVisto = value;
  }

  bool _promoRelampago18hVisto = false;
  bool get promoRelampago18hVisto => _promoRelampago18hVisto;
  set promoRelampago18hVisto(bool value) {
    _promoRelampago18hVisto = value;
  }

  bool _promoRelampago21hVisto = false;
  bool get promoRelampago21hVisto => _promoRelampago21hVisto;
  set promoRelampago21hVisto(bool value) {
    _promoRelampago21hVisto = value;
  }

  bool _promoRelampagoVistoAmanha = false;
  bool get promoRelampagoVistoAmanha => _promoRelampagoVistoAmanha;
  set promoRelampagoVistoAmanha(bool value) {
    _promoRelampagoVistoAmanha = value;
  }

  List<DocumentReference> _promoRelampagoLisLembrete = [];
  List<DocumentReference> get promoRelampagoLisLembrete =>
      _promoRelampagoLisLembrete;
  set promoRelampagoLisLembrete(List<DocumentReference> value) {
    _promoRelampagoLisLembrete = value;
  }

  void addToPromoRelampagoLisLembrete(DocumentReference value) {
    promoRelampagoLisLembrete.add(value);
  }

  void removeFromPromoRelampagoLisLembrete(DocumentReference value) {
    promoRelampagoLisLembrete.remove(value);
  }

  void removeAtIndexFromPromoRelampagoLisLembrete(int index) {
    promoRelampagoLisLembrete.removeAt(index);
  }

  void updatePromoRelampagoLisLembreteAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    promoRelampagoLisLembrete[index] =
        updateFn(_promoRelampagoLisLembrete[index]);
  }

  void insertAtIndexInPromoRelampagoLisLembrete(
      int index, DocumentReference value) {
    promoRelampagoLisLembrete.insert(index, value);
  }

  String _cronometoPromo = '';
  String get cronometoPromo => _cronometoPromo;
  set cronometoPromo(String value) {
    _cronometoPromo = value;
  }

  bool _promoRelampagoStatus = false;
  bool get promoRelampagoStatus => _promoRelampagoStatus;
  set promoRelampagoStatus(bool value) {
    _promoRelampagoStatus = value;
  }

  double _comisaoAfiliado2 = 0.0;
  double get comisaoAfiliado2 => _comisaoAfiliado2;
  set comisaoAfiliado2(double value) {
    _comisaoAfiliado2 = value;
  }

  double _valorProduto = 0.0;
  double get valorProduto => _valorProduto;
  set valorProduto(double value) {
    _valorProduto = value;
  }

  List<String> _CarrinhoTemporarioNacional = [];
  List<String> get CarrinhoTemporarioNacional => _CarrinhoTemporarioNacional;
  set CarrinhoTemporarioNacional(List<String> value) {
    _CarrinhoTemporarioNacional = value;
  }

  void addToCarrinhoTemporarioNacional(String value) {
    CarrinhoTemporarioNacional.add(value);
  }

  void removeFromCarrinhoTemporarioNacional(String value) {
    CarrinhoTemporarioNacional.remove(value);
  }

  void removeAtIndexFromCarrinhoTemporarioNacional(int index) {
    CarrinhoTemporarioNacional.removeAt(index);
  }

  void updateCarrinhoTemporarioNacionalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    CarrinhoTemporarioNacional[index] =
        updateFn(_CarrinhoTemporarioNacional[index]);
  }

  void insertAtIndexInCarrinhoTemporarioNacional(int index, String value) {
    CarrinhoTemporarioNacional.insert(index, value);
  }

  List<String> _CarrinhoTemporarioInternacional = [];
  List<String> get CarrinhoTemporarioInternacional =>
      _CarrinhoTemporarioInternacional;
  set CarrinhoTemporarioInternacional(List<String> value) {
    _CarrinhoTemporarioInternacional = value;
  }

  void addToCarrinhoTemporarioInternacional(String value) {
    CarrinhoTemporarioInternacional.add(value);
  }

  void removeFromCarrinhoTemporarioInternacional(String value) {
    CarrinhoTemporarioInternacional.remove(value);
  }

  void removeAtIndexFromCarrinhoTemporarioInternacional(int index) {
    CarrinhoTemporarioInternacional.removeAt(index);
  }

  void updateCarrinhoTemporarioInternacionalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    CarrinhoTemporarioInternacional[index] =
        updateFn(_CarrinhoTemporarioInternacional[index]);
  }

  void insertAtIndexInCarrinhoTemporarioInternacional(int index, String value) {
    CarrinhoTemporarioInternacional.insert(index, value);
  }

  bool _verCarrinhoAfiliado = false;
  bool get verCarrinhoAfiliado => _verCarrinhoAfiliado;
  set verCarrinhoAfiliado(bool value) {
    _verCarrinhoAfiliado = value;
  }

  String _NaoTemConta = '';
  String get NaoTemConta => _NaoTemConta;
  set NaoTemConta(String value) {
    _NaoTemConta = value;
  }

  bool _FezLoginPeloAfiliado = false;
  bool get FezLoginPeloAfiliado => _FezLoginPeloAfiliado;
  set FezLoginPeloAfiliado(bool value) {
    _FezLoginPeloAfiliado = value;
  }

  String _varianteMediaValor = '';
  String get varianteMediaValor => _varianteMediaValor;
  set varianteMediaValor(String value) {
    _varianteMediaValor = value;
  }

  double _addValorVariante = 0.0;
  double get addValorVariante => _addValorVariante;
  set addValorVariante(double value) {
    _addValorVariante = value;
  }

  String _apagar = '';
  String get apagar => _apagar;
  set apagar(String value) {
    _apagar = value;
  }

  bool _verCarrinhoLogado = false;
  bool get verCarrinhoLogado => _verCarrinhoLogado;
  set verCarrinhoLogado(bool value) {
    _verCarrinhoLogado = value;
  }

  DateTime? _dataFiltroAfiliado;
  DateTime? get dataFiltroAfiliado => _dataFiltroAfiliado;
  set dataFiltroAfiliado(DateTime? value) {
    _dataFiltroAfiliado = value;
  }

  List<int> _listaFiltroAfiliado = [];
  List<int> get listaFiltroAfiliado => _listaFiltroAfiliado;
  set listaFiltroAfiliado(List<int> value) {
    _listaFiltroAfiliado = value;
  }

  void addToListaFiltroAfiliado(int value) {
    listaFiltroAfiliado.add(value);
  }

  void removeFromListaFiltroAfiliado(int value) {
    listaFiltroAfiliado.remove(value);
  }

  void removeAtIndexFromListaFiltroAfiliado(int index) {
    listaFiltroAfiliado.removeAt(index);
  }

  void updateListaFiltroAfiliadoAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listaFiltroAfiliado[index] = updateFn(_listaFiltroAfiliado[index]);
  }

  void insertAtIndexInListaFiltroAfiliado(int index, int value) {
    listaFiltroAfiliado.insert(index, value);
  }

  List<double> _filtroGraficoyAfiliado = [];
  List<double> get filtroGraficoyAfiliado => _filtroGraficoyAfiliado;
  set filtroGraficoyAfiliado(List<double> value) {
    _filtroGraficoyAfiliado = value;
  }

  void addToFiltroGraficoyAfiliado(double value) {
    filtroGraficoyAfiliado.add(value);
  }

  void removeFromFiltroGraficoyAfiliado(double value) {
    filtroGraficoyAfiliado.remove(value);
  }

  void removeAtIndexFromFiltroGraficoyAfiliado(int index) {
    filtroGraficoyAfiliado.removeAt(index);
  }

  void updateFiltroGraficoyAfiliadoAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    filtroGraficoyAfiliado[index] = updateFn(_filtroGraficoyAfiliado[index]);
  }

  void insertAtIndexInFiltroGraficoyAfiliado(int index, double value) {
    filtroGraficoyAfiliado.insert(index, value);
  }

  String _corFiltroAfiliado = '';
  String get corFiltroAfiliado => _corFiltroAfiliado;
  set corFiltroAfiliado(String value) {
    _corFiltroAfiliado = value;
  }

  int _limiteVistualizacaoProdutoHomePage = 0;
  int get limiteVistualizacaoProdutoHomePage =>
      _limiteVistualizacaoProdutoHomePage;
  set limiteVistualizacaoProdutoHomePage(int value) {
    _limiteVistualizacaoProdutoHomePage = value;
  }

  String _FeedAntes = '';
  String get FeedAntes => _FeedAntes;
  set FeedAntes(String value) {
    _FeedAntes = value;
  }

  String _FeedDepois = '';
  String get FeedDepois => _FeedDepois;
  set FeedDepois(String value) {
    _FeedDepois = value;
  }

  String _capsula1 = '';
  String get capsula1 => _capsula1;
  set capsula1(String value) {
    _capsula1 = value;
  }

  String _capsula2 = '';
  String get capsula2 => _capsula2;
  set capsula2(String value) {
    _capsula2 = value;
  }

  String _capsula3 = '';
  String get capsula3 => _capsula3;
  set capsula3(String value) {
    _capsula3 = value;
  }

  String _capsulaextra = '';
  String get capsulaextra => _capsulaextra;
  set capsulaextra(String value) {
    _capsulaextra = value;
  }

  String _codigoMidia = '';
  String get codigoMidia => _codigoMidia;
  set codigoMidia(String value) {
    _codigoMidia = value;
  }

  String _midiaFiltroAfiliado = '';
  String get midiaFiltroAfiliado => _midiaFiltroAfiliado;
  set midiaFiltroAfiliado(String value) {
    _midiaFiltroAfiliado = value;
  }

  String _imgUpdateVariante = '';
  String get imgUpdateVariante => _imgUpdateVariante;
  set imgUpdateVariante(String value) {
    _imgUpdateVariante = value;
  }

  String _imgUpdateVariante2 = '';
  String get imgUpdateVariante2 => _imgUpdateVariante2;
  set imgUpdateVariante2(String value) {
    _imgUpdateVariante2 = value;
  }

  String _notificaafiliado = '';
  String get notificaafiliado => _notificaafiliado;
  set notificaafiliado(String value) {
    _notificaafiliado = value;
  }

  String _notificacaoAfiliado = '';
  String get notificacaoAfiliado => _notificacaoAfiliado;
  set notificacaoAfiliado(String value) {
    _notificacaoAfiliado = value;
  }

  bool _abrirFrete = false;
  bool get abrirFrete => _abrirFrete;
  set abrirFrete(bool value) {
    _abrirFrete = value;
  }

  bool _cpfInvalido = false;
  bool get cpfInvalido => _cpfInvalido;
  set cpfInvalido(bool value) {
    _cpfInvalido = value;
  }

  bool _loginGooglePC = false;
  bool get loginGooglePC => _loginGooglePC;
  set loginGooglePC(bool value) {
    _loginGooglePC = value;
  }

  DocumentReference? _loginUserRefPC;
  DocumentReference? get loginUserRefPC => _loginUserRefPC;
  set loginUserRefPC(DocumentReference? value) {
    _loginUserRefPC = value;
  }

  bool _PCSemVarianteSetado = false;
  bool get PCSemVarianteSetado => _PCSemVarianteSetado;
  set PCSemVarianteSetado(bool value) {
    _PCSemVarianteSetado = value;
  }

  String _imgPix = '';
  String get imgPix => _imgPix;
  set imgPix(String value) {
    _imgPix = value;
  }

  DocumentReference? _pedidoRef;
  DocumentReference? get pedidoRef => _pedidoRef;
  set pedidoRef(DocumentReference? value) {
    _pedidoRef = value;
  }

  String _pcPosvendaStatus = '';
  String get pcPosvendaStatus => _pcPosvendaStatus;
  set pcPosvendaStatus(String value) {
    _pcPosvendaStatus = value;
  }

  String _pcEnderecoStatus = '';
  String get pcEnderecoStatus => _pcEnderecoStatus;
  set pcEnderecoStatus(String value) {
    _pcEnderecoStatus = value;
  }

  DocumentReference? _pcEnderecoRef;
  DocumentReference? get pcEnderecoRef => _pcEnderecoRef;
  set pcEnderecoRef(DocumentReference? value) {
    _pcEnderecoRef = value;
  }

  DocumentReference? _afiliadoRef;
  DocumentReference? get afiliadoRef => _afiliadoRef;
  set afiliadoRef(DocumentReference? value) {
    _afiliadoRef = value;
  }

  String _palavraChaveProduto = '';
  String get palavraChaveProduto => _palavraChaveProduto;
  set palavraChaveProduto(String value) {
    _palavraChaveProduto = value;
  }

  bool _LoginPrimeiraVez = false;
  bool get LoginPrimeiraVez => _LoginPrimeiraVez;
  set LoginPrimeiraVez(bool value) {
    _LoginPrimeiraVez = value;
    prefs.setBool('ff_LoginPrimeiraVez', value);
  }

  bool _veropcao1titulo1 = false;
  bool get veropcao1titulo1 => _veropcao1titulo1;
  set veropcao1titulo1(bool value) {
    _veropcao1titulo1 = value;
  }

  bool _veropcao2titulo1 = false;
  bool get veropcao2titulo1 => _veropcao2titulo1;
  set veropcao2titulo1(bool value) {
    _veropcao2titulo1 = value;
  }

  bool _veropcao3titulo1 = false;
  bool get veropcao3titulo1 => _veropcao3titulo1;
  set veropcao3titulo1(bool value) {
    _veropcao3titulo1 = value;
  }

  bool _veropcao4titulo1 = false;
  bool get veropcao4titulo1 => _veropcao4titulo1;
  set veropcao4titulo1(bool value) {
    _veropcao4titulo1 = value;
  }

  bool _veropcao5titulo1 = false;
  bool get veropcao5titulo1 => _veropcao5titulo1;
  set veropcao5titulo1(bool value) {
    _veropcao5titulo1 = value;
  }

  bool _veropcao6titulo1 = false;
  bool get veropcao6titulo1 => _veropcao6titulo1;
  set veropcao6titulo1(bool value) {
    _veropcao6titulo1 = value;
  }

  bool _veropcao7titulo1 = false;
  bool get veropcao7titulo1 => _veropcao7titulo1;
  set veropcao7titulo1(bool value) {
    _veropcao7titulo1 = value;
  }

  bool _veropcao8titulo1 = false;
  bool get veropcao8titulo1 => _veropcao8titulo1;
  set veropcao8titulo1(bool value) {
    _veropcao8titulo1 = value;
  }

  bool _veropcao9titulo1 = false;
  bool get veropcao9titulo1 => _veropcao9titulo1;
  set veropcao9titulo1(bool value) {
    _veropcao9titulo1 = value;
  }

  bool _veropcao10titulo1 = false;
  bool get veropcao10titulo1 => _veropcao10titulo1;
  set veropcao10titulo1(bool value) {
    _veropcao10titulo1 = value;
  }

  bool _veropcao1titulo2 = false;
  bool get veropcao1titulo2 => _veropcao1titulo2;
  set veropcao1titulo2(bool value) {
    _veropcao1titulo2 = value;
  }

  bool _veropcao2titulo2 = false;
  bool get veropcao2titulo2 => _veropcao2titulo2;
  set veropcao2titulo2(bool value) {
    _veropcao2titulo2 = value;
  }

  bool _veropcao3titulo2 = false;
  bool get veropcao3titulo2 => _veropcao3titulo2;
  set veropcao3titulo2(bool value) {
    _veropcao3titulo2 = value;
  }

  bool _veropcao4titulo2 = false;
  bool get veropcao4titulo2 => _veropcao4titulo2;
  set veropcao4titulo2(bool value) {
    _veropcao4titulo2 = value;
  }

  bool _veropcao5titulo2 = false;
  bool get veropcao5titulo2 => _veropcao5titulo2;
  set veropcao5titulo2(bool value) {
    _veropcao5titulo2 = value;
  }

  bool _veropcao6titulo2 = false;
  bool get veropcao6titulo2 => _veropcao6titulo2;
  set veropcao6titulo2(bool value) {
    _veropcao6titulo2 = value;
  }

  bool _veropcao7titulo2 = false;
  bool get veropcao7titulo2 => _veropcao7titulo2;
  set veropcao7titulo2(bool value) {
    _veropcao7titulo2 = value;
  }

  bool _veropcao8titulo2 = false;
  bool get veropcao8titulo2 => _veropcao8titulo2;
  set veropcao8titulo2(bool value) {
    _veropcao8titulo2 = value;
  }

  bool _veropcao9titulo2 = false;
  bool get veropcao9titulo2 => _veropcao9titulo2;
  set veropcao9titulo2(bool value) {
    _veropcao9titulo2 = value;
  }

  bool _veropcao10titulo2 = false;
  bool get veropcao10titulo2 => _veropcao10titulo2;
  set veropcao10titulo2(bool value) {
    _veropcao10titulo2 = value;
  }

  bool _addTitulo2 = false;
  bool get addTitulo2 => _addTitulo2;
  set addTitulo2(bool value) {
    _addTitulo2 = value;
  }

  List<String> _imgListTeste = [];
  List<String> get imgListTeste => _imgListTeste;
  set imgListTeste(List<String> value) {
    _imgListTeste = value;
  }

  void addToImgListTeste(String value) {
    imgListTeste.add(value);
  }

  void removeFromImgListTeste(String value) {
    imgListTeste.remove(value);
  }

  void removeAtIndexFromImgListTeste(int index) {
    imgListTeste.removeAt(index);
  }

  void updateImgListTesteAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imgListTeste[index] = updateFn(_imgListTeste[index]);
  }

  void insertAtIndexInImgListTeste(int index, String value) {
    imgListTeste.insert(index, value);
  }

  String _diagnostico = '';
  String get diagnostico => _diagnostico;
  set diagnostico(String value) {
    _diagnostico = value;
  }

  bool _imageCacheInit = false;
  bool get imageCacheInit => _imageCacheInit;
  set imageCacheInit(bool value) {
    _imageCacheInit = value;
  }

  int _limpaCache2 = 0;
  int get limpaCache2 => _limpaCache2;
  set limpaCache2(int value) {
    _limpaCache2 = value;
  }

  int _limite = 0;
  int get limite => _limite;
  set limite(int value) {
    _limite = value;
  }

  int _limiteInicial = 0;
  int get limiteInicial => _limiteInicial;
  set limiteInicial(int value) {
    _limiteInicial = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  bool _hasMore = false;
  bool get hasMore => _hasMore;
  set hasMore(bool value) {
    _hasMore = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
