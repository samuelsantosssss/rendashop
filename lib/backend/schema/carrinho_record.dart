import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrinhoRecord extends FirestoreRecord {
  CarrinhoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "itens" field.
  DocumentReference? _itens;
  DocumentReference? get itens => _itens;
  bool hasItens() => _itens != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  bool hasQuantidade() => _quantidade != null;

  // "data_adicao" field.
  DateTime? _dataAdicao;
  DateTime? get dataAdicao => _dataAdicao;
  bool hasDataAdicao() => _dataAdicao != null;

  // "selecionado" field.
  bool? _selecionado;
  bool get selecionado => _selecionado ?? false;
  bool hasSelecionado() => _selecionado != null;

  // "variacao" field.
  String? _variacao;
  String get variacao => _variacao ?? '';
  bool hasVariacao() => _variacao != null;

  // "foto_capa" field.
  String? _fotoCapa;
  String get fotoCapa => _fotoCapa ?? '';
  bool hasFotoCapa() => _fotoCapa != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "lojaRef" field.
  DocumentReference? _lojaRef;
  DocumentReference? get lojaRef => _lojaRef;
  bool hasLojaRef() => _lojaRef != null;

  // "frete" field.
  double? _frete;
  double get frete => _frete ?? 0.0;
  bool hasFrete() => _frete != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  // "preco_antes" field.
  double? _precoAntes;
  double get precoAntes => _precoAntes ?? 0.0;
  bool hasPrecoAntes() => _precoAntes != null;

  // "frete_antes" field.
  double? _freteAntes;
  double get freteAntes => _freteAntes ?? 0.0;
  bool hasFreteAntes() => _freteAntes != null;

  // "selecionar_todos" field.
  bool? _selecionarTodos;
  bool get selecionarTodos => _selecionarTodos ?? false;
  bool hasSelecionarTodos() => _selecionarTodos != null;

  // "statusCupom" field.
  bool? _statusCupom;
  bool get statusCupom => _statusCupom ?? false;
  bool hasStatusCupom() => _statusCupom != null;

  // "nacional" field.
  bool? _nacional;
  bool get nacional => _nacional ?? false;
  bool hasNacional() => _nacional != null;

  // "icms" field.
  double? _icms;
  double get icms => _icms ?? 0.0;
  bool hasIcms() => _icms != null;

  // "impostoImportacao" field.
  double? _impostoImportacao;
  double get impostoImportacao => _impostoImportacao ?? 0.0;
  bool hasImpostoImportacao() => _impostoImportacao != null;

  // "afiliadoComissao" field.
  double? _afiliadoComissao;
  double get afiliadoComissao => _afiliadoComissao ?? 0.0;
  bool hasAfiliadoComissao() => _afiliadoComissao != null;

  // "afiliadoRef" field.
  DocumentReference? _afiliadoRef;
  DocumentReference? get afiliadoRef => _afiliadoRef;
  bool hasAfiliadoRef() => _afiliadoRef != null;

  // "varianteRef" field.
  DocumentReference? _varianteRef;
  DocumentReference? get varianteRef => _varianteRef;
  bool hasVarianteRef() => _varianteRef != null;

  // "utimaAtializacaoCarrinho" field.
  DateTime? _utimaAtializacaoCarrinho;
  DateTime? get utimaAtializacaoCarrinho => _utimaAtializacaoCarrinho;
  bool hasUtimaAtializacaoCarrinho() => _utimaAtializacaoCarrinho != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _itens = snapshotData['itens'] as DocumentReference?;
    _quantidade = castToType<int>(snapshotData['quantidade']);
    _dataAdicao = snapshotData['data_adicao'] as DateTime?;
    _selecionado = snapshotData['selecionado'] as bool?;
    _variacao = snapshotData['variacao'] as String?;
    _fotoCapa = snapshotData['foto_capa'] as String?;
    _titulo = snapshotData['titulo'] as String?;
    _endereco = snapshotData['endereco'] as String?;
    _lojaRef = snapshotData['lojaRef'] as DocumentReference?;
    _frete = castToType<double>(snapshotData['frete']);
    _preco = castToType<double>(snapshotData['preco']);
    _precoAntes = castToType<double>(snapshotData['preco_antes']);
    _freteAntes = castToType<double>(snapshotData['frete_antes']);
    _selecionarTodos = snapshotData['selecionar_todos'] as bool?;
    _statusCupom = snapshotData['statusCupom'] as bool?;
    _nacional = snapshotData['nacional'] as bool?;
    _icms = castToType<double>(snapshotData['icms']);
    _impostoImportacao = castToType<double>(snapshotData['impostoImportacao']);
    _afiliadoComissao = castToType<double>(snapshotData['afiliadoComissao']);
    _afiliadoRef = snapshotData['afiliadoRef'] as DocumentReference?;
    _varianteRef = snapshotData['varianteRef'] as DocumentReference?;
    _utimaAtializacaoCarrinho =
        snapshotData['utimaAtializacaoCarrinho'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('carrinho')
          : FirebaseFirestore.instance.collectionGroup('carrinho');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('carrinho').doc(id);

  static Stream<CarrinhoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarrinhoRecord.fromSnapshot(s));

  static Future<CarrinhoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarrinhoRecord.fromSnapshot(s));

  static CarrinhoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarrinhoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarrinhoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarrinhoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarrinhoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarrinhoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarrinhoRecordData({
  DocumentReference? userRef,
  DocumentReference? itens,
  int? quantidade,
  DateTime? dataAdicao,
  bool? selecionado,
  String? variacao,
  String? fotoCapa,
  String? titulo,
  String? endereco,
  DocumentReference? lojaRef,
  double? frete,
  double? preco,
  double? precoAntes,
  double? freteAntes,
  bool? selecionarTodos,
  bool? statusCupom,
  bool? nacional,
  double? icms,
  double? impostoImportacao,
  double? afiliadoComissao,
  DocumentReference? afiliadoRef,
  DocumentReference? varianteRef,
  DateTime? utimaAtializacaoCarrinho,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'itens': itens,
      'quantidade': quantidade,
      'data_adicao': dataAdicao,
      'selecionado': selecionado,
      'variacao': variacao,
      'foto_capa': fotoCapa,
      'titulo': titulo,
      'endereco': endereco,
      'lojaRef': lojaRef,
      'frete': frete,
      'preco': preco,
      'preco_antes': precoAntes,
      'frete_antes': freteAntes,
      'selecionar_todos': selecionarTodos,
      'statusCupom': statusCupom,
      'nacional': nacional,
      'icms': icms,
      'impostoImportacao': impostoImportacao,
      'afiliadoComissao': afiliadoComissao,
      'afiliadoRef': afiliadoRef,
      'varianteRef': varianteRef,
      'utimaAtializacaoCarrinho': utimaAtializacaoCarrinho,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarrinhoRecordDocumentEquality implements Equality<CarrinhoRecord> {
  const CarrinhoRecordDocumentEquality();

  @override
  bool equals(CarrinhoRecord? e1, CarrinhoRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.itens == e2?.itens &&
        e1?.quantidade == e2?.quantidade &&
        e1?.dataAdicao == e2?.dataAdicao &&
        e1?.selecionado == e2?.selecionado &&
        e1?.variacao == e2?.variacao &&
        e1?.fotoCapa == e2?.fotoCapa &&
        e1?.titulo == e2?.titulo &&
        e1?.endereco == e2?.endereco &&
        e1?.lojaRef == e2?.lojaRef &&
        e1?.frete == e2?.frete &&
        e1?.preco == e2?.preco &&
        e1?.precoAntes == e2?.precoAntes &&
        e1?.freteAntes == e2?.freteAntes &&
        e1?.selecionarTodos == e2?.selecionarTodos &&
        e1?.statusCupom == e2?.statusCupom &&
        e1?.nacional == e2?.nacional &&
        e1?.icms == e2?.icms &&
        e1?.impostoImportacao == e2?.impostoImportacao &&
        e1?.afiliadoComissao == e2?.afiliadoComissao &&
        e1?.afiliadoRef == e2?.afiliadoRef &&
        e1?.varianteRef == e2?.varianteRef &&
        e1?.utimaAtializacaoCarrinho == e2?.utimaAtializacaoCarrinho;
  }

  @override
  int hash(CarrinhoRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.itens,
        e?.quantidade,
        e?.dataAdicao,
        e?.selecionado,
        e?.variacao,
        e?.fotoCapa,
        e?.titulo,
        e?.endereco,
        e?.lojaRef,
        e?.frete,
        e?.preco,
        e?.precoAntes,
        e?.freteAntes,
        e?.selecionarTodos,
        e?.statusCupom,
        e?.nacional,
        e?.icms,
        e?.impostoImportacao,
        e?.afiliadoComissao,
        e?.afiliadoRef,
        e?.varianteRef,
        e?.utimaAtializacaoCarrinho
      ]);

  @override
  bool isValidKey(Object? o) => o is CarrinhoRecord;
}
