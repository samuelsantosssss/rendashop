import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoRecord extends FirestoreRecord {
  ProdutoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "imagens" field.
  List<String>? _imagens;
  List<String> get imagens => _imagens ?? const [];
  bool hasImagens() => _imagens != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "estoque" field.
  int? _estoque;
  int get estoque => _estoque ?? 0;
  bool hasEstoque() => _estoque != null;

  // "vendas" field.
  int? _vendas;
  int get vendas => _vendas ?? 0;
  bool hasVendas() => _vendas != null;

  // "lojaRef" field.
  DocumentReference? _lojaRef;
  DocumentReference? get lojaRef => _lojaRef;
  bool hasLojaRef() => _lojaRef != null;

  // "precoRevenda" field.
  double? _precoRevenda;
  double get precoRevenda => _precoRevenda ?? 0.0;
  bool hasPrecoRevenda() => _precoRevenda != null;

  // "frete" field.
  double? _frete;
  double get frete => _frete ?? 0.0;
  bool hasFrete() => _frete != null;

  // "preco_antes" field.
  double? _precoAntes;
  double get precoAntes => _precoAntes ?? 0.0;
  bool hasPrecoAntes() => _precoAntes != null;

  // "variante_imgList" field.
  List<String>? _varianteImgList;
  List<String> get varianteImgList => _varianteImgList ?? const [];
  bool hasVarianteImgList() => _varianteImgList != null;

  // "variante_titulo1List" field.
  List<String>? _varianteTitulo1List;
  List<String> get varianteTitulo1List => _varianteTitulo1List ?? const [];
  bool hasVarianteTitulo1List() => _varianteTitulo1List != null;

  // "variante_titulo2List" field.
  List<String>? _varianteTitulo2List;
  List<String> get varianteTitulo2List => _varianteTitulo2List ?? const [];
  bool hasVarianteTitulo2List() => _varianteTitulo2List != null;

  // "titulo1" field.
  String? _titulo1;
  String get titulo1 => _titulo1 ?? '';
  bool hasTitulo1() => _titulo1 != null;

  // "titulo2" field.
  String? _titulo2;
  String get titulo2 => _titulo2 ?? '';
  bool hasTitulo2() => _titulo2 != null;

  // "menorPrecoRevenda" field.
  double? _menorPrecoRevenda;
  double get menorPrecoRevenda => _menorPrecoRevenda ?? 0.0;
  bool hasMenorPrecoRevenda() => _menorPrecoRevenda != null;

  // "listFrete" field.
  List<String>? _listFrete;
  List<String> get listFrete => _listFrete ?? const [];
  bool hasListFrete() => _listFrete != null;

  // "freteSP" field.
  double? _freteSP;
  double get freteSP => _freteSP ?? 0.0;
  bool hasFreteSP() => _freteSP != null;

  // "envioNaciona" field.
  bool? _envioNaciona;
  bool get envioNaciona => _envioNaciona ?? false;
  bool hasEnvioNaciona() => _envioNaciona != null;

  // "comentarioAtivo" field.
  bool? _comentarioAtivo;
  bool get comentarioAtivo => _comentarioAtivo ?? false;
  bool hasComentarioAtivo() => _comentarioAtivo != null;

  // "lider1" field.
  String? _lider1;
  String get lider1 => _lider1 ?? '';
  bool hasLider1() => _lider1 != null;

  // "lider2" field.
  String? _lider2;
  String get lider2 => _lider2 ?? '';
  bool hasLider2() => _lider2 != null;

  // "lider3" field.
  String? _lider3;
  String get lider3 => _lider3 ?? '';
  bool hasLider3() => _lider3 != null;

  // "lider4" field.
  String? _lider4;
  String get lider4 => _lider4 ?? '';
  bool hasLider4() => _lider4 != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "freteRapido" field.
  bool? _freteRapido;
  bool get freteRapido => _freteRapido ?? false;
  bool hasFreteRapido() => _freteRapido != null;

  // "totalPedido" field.
  double? _totalPedido;
  double get totalPedido => _totalPedido ?? 0.0;
  bool hasTotalPedido() => _totalPedido != null;

  // "comissao_afiliado" field.
  int? _comissaoAfiliado;
  int get comissaoAfiliado => _comissaoAfiliado ?? 0;
  bool hasComissaoAfiliado() => _comissaoAfiliado != null;

  // "freteRJ" field.
  double? _freteRJ;
  double get freteRJ => _freteRJ ?? 0.0;
  bool hasFreteRJ() => _freteRJ != null;

  // "palavras_chaveList" field.
  List<String>? _palavrasChaveList;
  List<String> get palavrasChaveList => _palavrasChaveList ?? const [];
  bool hasPalavrasChaveList() => _palavrasChaveList != null;

  // "lojaOficial" field.
  bool? _lojaOficial;
  bool get lojaOficial => _lojaOficial ?? false;
  bool hasLojaOficial() => _lojaOficial != null;

  // "margem" field.
  String? _margem;
  String get margem => _margem ?? '';
  bool hasMargem() => _margem != null;

  // "promoRelampagoAtivo" field.
  bool? _promoRelampagoAtivo;
  bool get promoRelampagoAtivo => _promoRelampagoAtivo ?? false;
  bool hasPromoRelampagoAtivo() => _promoRelampagoAtivo != null;

  // "promoRelampagoLimiteCompra" field.
  int? _promoRelampagoLimiteCompra;
  int get promoRelampagoLimiteCompra => _promoRelampagoLimiteCompra ?? 0;
  bool hasPromoRelampagoLimiteCompra() => _promoRelampagoLimiteCompra != null;

  // "promoRelampagoEstoque" field.
  int? _promoRelampagoEstoque;
  int get promoRelampagoEstoque => _promoRelampagoEstoque ?? 0;
  bool hasPromoRelampagoEstoque() => _promoRelampagoEstoque != null;

  // "promoRelampagoMenorValor" field.
  double? _promoRelampagoMenorValor;
  double get promoRelampagoMenorValor => _promoRelampagoMenorValor ?? 0.0;
  bool hasPromoRelampagoMenorValor() => _promoRelampagoMenorValor != null;

  // "promoRelampagoDiaHora" field.
  String? _promoRelampagoDiaHora;
  String get promoRelampagoDiaHora => _promoRelampagoDiaHora ?? '';
  bool hasPromoRelampagoDiaHora() => _promoRelampagoDiaHora != null;

  // "promoRelampagoAgendado" field.
  bool? _promoRelampagoAgendado;
  bool get promoRelampagoAgendado => _promoRelampagoAgendado ?? false;
  bool hasPromoRelampagoAgendado() => _promoRelampagoAgendado != null;

  // "promoRelampagoValorAntes" field.
  double? _promoRelampagoValorAntes;
  double get promoRelampagoValorAntes => _promoRelampagoValorAntes ?? 0.0;
  bool hasPromoRelampagoValorAntes() => _promoRelampagoValorAntes != null;

  // "promoRelampagoValor" field.
  double? _promoRelampagoValor;
  double get promoRelampagoValor => _promoRelampagoValor ?? 0.0;
  bool hasPromoRelampagoValor() => _promoRelampagoValor != null;

  // "promoRelampagoJaCriado" field.
  bool? _promoRelampagoJaCriado;
  bool get promoRelampagoJaCriado => _promoRelampagoJaCriado ?? false;
  bool hasPromoRelampagoJaCriado() => _promoRelampagoJaCriado != null;

  // "capsula1" field.
  String? _capsula1;
  String get capsula1 => _capsula1 ?? '';
  bool hasCapsula1() => _capsula1 != null;

  // "capsula2" field.
  String? _capsula2;
  String get capsula2 => _capsula2 ?? '';
  bool hasCapsula2() => _capsula2 != null;

  // "capsula3" field.
  String? _capsula3;
  String get capsula3 => _capsula3 ?? '';
  bool hasCapsula3() => _capsula3 != null;

  // "capsulaExtra" field.
  String? _capsulaExtra;
  String get capsulaExtra => _capsulaExtra ?? '';
  bool hasCapsulaExtra() => _capsulaExtra != null;

  // "produtoRef" field.
  DocumentReference? _produtoRef;
  DocumentReference? get produtoRef => _produtoRef;
  bool hasProdutoRef() => _produtoRef != null;

  // "ultimaAtualizacao" field.
  DateTime? _ultimaAtualizacao;
  DateTime? get ultimaAtualizacao => _ultimaAtualizacao;
  bool hasUltimaAtualizacao() => _ultimaAtualizacao != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _imagens = getDataList(snapshotData['imagens']);
    _video = snapshotData['video'] as String?;
    _preco = castToType<double>(snapshotData['preco']);
    _categoria = snapshotData['categoria'] as String?;
    _estoque = castToType<int>(snapshotData['estoque']);
    _vendas = castToType<int>(snapshotData['vendas']);
    _lojaRef = snapshotData['lojaRef'] as DocumentReference?;
    _precoRevenda = castToType<double>(snapshotData['precoRevenda']);
    _frete = castToType<double>(snapshotData['frete']);
    _precoAntes = castToType<double>(snapshotData['preco_antes']);
    _varianteImgList = getDataList(snapshotData['variante_imgList']);
    _varianteTitulo1List = getDataList(snapshotData['variante_titulo1List']);
    _varianteTitulo2List = getDataList(snapshotData['variante_titulo2List']);
    _titulo1 = snapshotData['titulo1'] as String?;
    _titulo2 = snapshotData['titulo2'] as String?;
    _menorPrecoRevenda = castToType<double>(snapshotData['menorPrecoRevenda']);
    _listFrete = getDataList(snapshotData['listFrete']);
    _freteSP = castToType<double>(snapshotData['freteSP']);
    _envioNaciona = snapshotData['envioNaciona'] as bool?;
    _comentarioAtivo = snapshotData['comentarioAtivo'] as bool?;
    _lider1 = snapshotData['lider1'] as String?;
    _lider2 = snapshotData['lider2'] as String?;
    _lider3 = snapshotData['lider3'] as String?;
    _lider4 = snapshotData['lider4'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _freteRapido = snapshotData['freteRapido'] as bool?;
    _totalPedido = castToType<double>(snapshotData['totalPedido']);
    _comissaoAfiliado = castToType<int>(snapshotData['comissao_afiliado']);
    _freteRJ = castToType<double>(snapshotData['freteRJ']);
    _palavrasChaveList = getDataList(snapshotData['palavras_chaveList']);
    _lojaOficial = snapshotData['lojaOficial'] as bool?;
    _margem = snapshotData['margem'] as String?;
    _promoRelampagoAtivo = snapshotData['promoRelampagoAtivo'] as bool?;
    _promoRelampagoLimiteCompra =
        castToType<int>(snapshotData['promoRelampagoLimiteCompra']);
    _promoRelampagoEstoque =
        castToType<int>(snapshotData['promoRelampagoEstoque']);
    _promoRelampagoMenorValor =
        castToType<double>(snapshotData['promoRelampagoMenorValor']);
    _promoRelampagoDiaHora = snapshotData['promoRelampagoDiaHora'] as String?;
    _promoRelampagoAgendado = snapshotData['promoRelampagoAgendado'] as bool?;
    _promoRelampagoValorAntes =
        castToType<double>(snapshotData['promoRelampagoValorAntes']);
    _promoRelampagoValor =
        castToType<double>(snapshotData['promoRelampagoValor']);
    _promoRelampagoJaCriado = snapshotData['promoRelampagoJaCriado'] as bool?;
    _capsula1 = snapshotData['capsula1'] as String?;
    _capsula2 = snapshotData['capsula2'] as String?;
    _capsula3 = snapshotData['capsula3'] as String?;
    _capsulaExtra = snapshotData['capsulaExtra'] as String?;
    _produtoRef = snapshotData['produtoRef'] as DocumentReference?;
    _ultimaAtualizacao = snapshotData['ultimaAtualizacao'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produto');

  static Stream<ProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoRecord.fromSnapshot(s));

  static Future<ProdutoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoRecord.fromSnapshot(s));

  static ProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoRecordData({
  String? nome,
  String? descricao,
  String? video,
  double? preco,
  String? categoria,
  int? estoque,
  int? vendas,
  DocumentReference? lojaRef,
  double? precoRevenda,
  double? frete,
  double? precoAntes,
  String? titulo1,
  String? titulo2,
  double? menorPrecoRevenda,
  double? freteSP,
  bool? envioNaciona,
  bool? comentarioAtivo,
  String? lider1,
  String? lider2,
  String? lider3,
  String? lider4,
  DateTime? data,
  bool? freteRapido,
  double? totalPedido,
  int? comissaoAfiliado,
  double? freteRJ,
  bool? lojaOficial,
  String? margem,
  bool? promoRelampagoAtivo,
  int? promoRelampagoLimiteCompra,
  int? promoRelampagoEstoque,
  double? promoRelampagoMenorValor,
  String? promoRelampagoDiaHora,
  bool? promoRelampagoAgendado,
  double? promoRelampagoValorAntes,
  double? promoRelampagoValor,
  bool? promoRelampagoJaCriado,
  String? capsula1,
  String? capsula2,
  String? capsula3,
  String? capsulaExtra,
  DocumentReference? produtoRef,
  DateTime? ultimaAtualizacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'video': video,
      'preco': preco,
      'categoria': categoria,
      'estoque': estoque,
      'vendas': vendas,
      'lojaRef': lojaRef,
      'precoRevenda': precoRevenda,
      'frete': frete,
      'preco_antes': precoAntes,
      'titulo1': titulo1,
      'titulo2': titulo2,
      'menorPrecoRevenda': menorPrecoRevenda,
      'freteSP': freteSP,
      'envioNaciona': envioNaciona,
      'comentarioAtivo': comentarioAtivo,
      'lider1': lider1,
      'lider2': lider2,
      'lider3': lider3,
      'lider4': lider4,
      'data': data,
      'freteRapido': freteRapido,
      'totalPedido': totalPedido,
      'comissao_afiliado': comissaoAfiliado,
      'freteRJ': freteRJ,
      'lojaOficial': lojaOficial,
      'margem': margem,
      'promoRelampagoAtivo': promoRelampagoAtivo,
      'promoRelampagoLimiteCompra': promoRelampagoLimiteCompra,
      'promoRelampagoEstoque': promoRelampagoEstoque,
      'promoRelampagoMenorValor': promoRelampagoMenorValor,
      'promoRelampagoDiaHora': promoRelampagoDiaHora,
      'promoRelampagoAgendado': promoRelampagoAgendado,
      'promoRelampagoValorAntes': promoRelampagoValorAntes,
      'promoRelampagoValor': promoRelampagoValor,
      'promoRelampagoJaCriado': promoRelampagoJaCriado,
      'capsula1': capsula1,
      'capsula2': capsula2,
      'capsula3': capsula3,
      'capsulaExtra': capsulaExtra,
      'produtoRef': produtoRef,
      'ultimaAtualizacao': ultimaAtualizacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoRecordDocumentEquality implements Equality<ProdutoRecord> {
  const ProdutoRecordDocumentEquality();

  @override
  bool equals(ProdutoRecord? e1, ProdutoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        listEquality.equals(e1?.imagens, e2?.imagens) &&
        e1?.video == e2?.video &&
        e1?.preco == e2?.preco &&
        e1?.categoria == e2?.categoria &&
        e1?.estoque == e2?.estoque &&
        e1?.vendas == e2?.vendas &&
        e1?.lojaRef == e2?.lojaRef &&
        e1?.precoRevenda == e2?.precoRevenda &&
        e1?.frete == e2?.frete &&
        e1?.precoAntes == e2?.precoAntes &&
        listEquality.equals(e1?.varianteImgList, e2?.varianteImgList) &&
        listEquality.equals(e1?.varianteTitulo1List, e2?.varianteTitulo1List) &&
        listEquality.equals(e1?.varianteTitulo2List, e2?.varianteTitulo2List) &&
        e1?.titulo1 == e2?.titulo1 &&
        e1?.titulo2 == e2?.titulo2 &&
        e1?.menorPrecoRevenda == e2?.menorPrecoRevenda &&
        listEquality.equals(e1?.listFrete, e2?.listFrete) &&
        e1?.freteSP == e2?.freteSP &&
        e1?.envioNaciona == e2?.envioNaciona &&
        e1?.comentarioAtivo == e2?.comentarioAtivo &&
        e1?.lider1 == e2?.lider1 &&
        e1?.lider2 == e2?.lider2 &&
        e1?.lider3 == e2?.lider3 &&
        e1?.lider4 == e2?.lider4 &&
        e1?.data == e2?.data &&
        e1?.freteRapido == e2?.freteRapido &&
        e1?.totalPedido == e2?.totalPedido &&
        e1?.comissaoAfiliado == e2?.comissaoAfiliado &&
        e1?.freteRJ == e2?.freteRJ &&
        listEquality.equals(e1?.palavrasChaveList, e2?.palavrasChaveList) &&
        e1?.lojaOficial == e2?.lojaOficial &&
        e1?.margem == e2?.margem &&
        e1?.promoRelampagoAtivo == e2?.promoRelampagoAtivo &&
        e1?.promoRelampagoLimiteCompra == e2?.promoRelampagoLimiteCompra &&
        e1?.promoRelampagoEstoque == e2?.promoRelampagoEstoque &&
        e1?.promoRelampagoMenorValor == e2?.promoRelampagoMenorValor &&
        e1?.promoRelampagoDiaHora == e2?.promoRelampagoDiaHora &&
        e1?.promoRelampagoAgendado == e2?.promoRelampagoAgendado &&
        e1?.promoRelampagoValorAntes == e2?.promoRelampagoValorAntes &&
        e1?.promoRelampagoValor == e2?.promoRelampagoValor &&
        e1?.promoRelampagoJaCriado == e2?.promoRelampagoJaCriado &&
        e1?.capsula1 == e2?.capsula1 &&
        e1?.capsula2 == e2?.capsula2 &&
        e1?.capsula3 == e2?.capsula3 &&
        e1?.capsulaExtra == e2?.capsulaExtra &&
        e1?.produtoRef == e2?.produtoRef &&
        e1?.ultimaAtualizacao == e2?.ultimaAtualizacao;
  }

  @override
  int hash(ProdutoRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.descricao,
        e?.imagens,
        e?.video,
        e?.preco,
        e?.categoria,
        e?.estoque,
        e?.vendas,
        e?.lojaRef,
        e?.precoRevenda,
        e?.frete,
        e?.precoAntes,
        e?.varianteImgList,
        e?.varianteTitulo1List,
        e?.varianteTitulo2List,
        e?.titulo1,
        e?.titulo2,
        e?.menorPrecoRevenda,
        e?.listFrete,
        e?.freteSP,
        e?.envioNaciona,
        e?.comentarioAtivo,
        e?.lider1,
        e?.lider2,
        e?.lider3,
        e?.lider4,
        e?.data,
        e?.freteRapido,
        e?.totalPedido,
        e?.comissaoAfiliado,
        e?.freteRJ,
        e?.palavrasChaveList,
        e?.lojaOficial,
        e?.margem,
        e?.promoRelampagoAtivo,
        e?.promoRelampagoLimiteCompra,
        e?.promoRelampagoEstoque,
        e?.promoRelampagoMenorValor,
        e?.promoRelampagoDiaHora,
        e?.promoRelampagoAgendado,
        e?.promoRelampagoValorAntes,
        e?.promoRelampagoValor,
        e?.promoRelampagoJaCriado,
        e?.capsula1,
        e?.capsula2,
        e?.capsula3,
        e?.capsulaExtra,
        e?.produtoRef,
        e?.ultimaAtualizacao
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutoRecord;
}
