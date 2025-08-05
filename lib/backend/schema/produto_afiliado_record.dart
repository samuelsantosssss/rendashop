import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoAfiliadoRecord extends FirestoreRecord {
  ProdutoAfiliadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "produtoRef" field.
  DocumentReference? _produtoRef;
  DocumentReference? get produtoRef => _produtoRef;
  bool hasProdutoRef() => _produtoRef != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "idAfiliado" field.
  String? _idAfiliado;
  String get idAfiliado => _idAfiliado ?? '';
  bool hasIdAfiliado() => _idAfiliado != null;

  // "linkProduto" field.
  String? _linkProduto;
  String get linkProduto => _linkProduto ?? '';
  bool hasLinkProduto() => _linkProduto != null;

  // "comissao" field.
  double? _comissao;
  double get comissao => _comissao ?? 0.0;
  bool hasComissao() => _comissao != null;

  // "valorComRef" field.
  List<String>? _valorComRef;
  List<String> get valorComRef => _valorComRef ?? const [];
  bool hasValorComRef() => _valorComRef != null;

  // "menorPreco" field.
  double? _menorPreco;
  double get menorPreco => _menorPreco ?? 0.0;
  bool hasMenorPreco() => _menorPreco != null;

  // "ultimaAtualizacao" field.
  DateTime? _ultimaAtualizacao;
  DateTime? get ultimaAtualizacao => _ultimaAtualizacao;
  bool hasUltimaAtualizacao() => _ultimaAtualizacao != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _produtoRef = snapshotData['produtoRef'] as DocumentReference?;
    _valor = castToType<double>(snapshotData['valor']);
    _idAfiliado = snapshotData['idAfiliado'] as String?;
    _linkProduto = snapshotData['linkProduto'] as String?;
    _comissao = castToType<double>(snapshotData['comissao']);
    _valorComRef = getDataList(snapshotData['valorComRef']);
    _menorPreco = castToType<double>(snapshotData['menorPreco']);
    _ultimaAtualizacao = snapshotData['ultimaAtualizacao'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('produtoAfiliado')
          : FirebaseFirestore.instance.collectionGroup('produtoAfiliado');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('produtoAfiliado').doc(id);

  static Stream<ProdutoAfiliadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoAfiliadoRecord.fromSnapshot(s));

  static Future<ProdutoAfiliadoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoAfiliadoRecord.fromSnapshot(s));

  static ProdutoAfiliadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoAfiliadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoAfiliadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoAfiliadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoAfiliadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoAfiliadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoAfiliadoRecordData({
  DocumentReference? produtoRef,
  double? valor,
  String? idAfiliado,
  String? linkProduto,
  double? comissao,
  double? menorPreco,
  DateTime? ultimaAtualizacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'produtoRef': produtoRef,
      'valor': valor,
      'idAfiliado': idAfiliado,
      'linkProduto': linkProduto,
      'comissao': comissao,
      'menorPreco': menorPreco,
      'ultimaAtualizacao': ultimaAtualizacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoAfiliadoRecordDocumentEquality
    implements Equality<ProdutoAfiliadoRecord> {
  const ProdutoAfiliadoRecordDocumentEquality();

  @override
  bool equals(ProdutoAfiliadoRecord? e1, ProdutoAfiliadoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.produtoRef == e2?.produtoRef &&
        e1?.valor == e2?.valor &&
        e1?.idAfiliado == e2?.idAfiliado &&
        e1?.linkProduto == e2?.linkProduto &&
        e1?.comissao == e2?.comissao &&
        listEquality.equals(e1?.valorComRef, e2?.valorComRef) &&
        e1?.menorPreco == e2?.menorPreco &&
        e1?.ultimaAtualizacao == e2?.ultimaAtualizacao;
  }

  @override
  int hash(ProdutoAfiliadoRecord? e) => const ListEquality().hash([
        e?.produtoRef,
        e?.valor,
        e?.idAfiliado,
        e?.linkProduto,
        e?.comissao,
        e?.valorComRef,
        e?.menorPreco,
        e?.ultimaAtualizacao
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutoAfiliadoRecord;
}
