import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromoRelampagoRecord extends FirestoreRecord {
  PromoRelampagoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "desconto" field.
  double? _desconto;
  double get desconto => _desconto ?? 0.0;
  bool hasDesconto() => _desconto != null;

  // "fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  bool hasFotos() => _fotos != null;

  // "produtos" field.
  List<DocumentReference>? _produtos;
  List<DocumentReference> get produtos => _produtos ?? const [];
  bool hasProdutos() => _produtos != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  bool hasData() => _data != null;

  // "estoque" field.
  String? _estoque;
  String get estoque => _estoque ?? '';
  bool hasEstoque() => _estoque != null;

  // "limite_compra" field.
  String? _limiteCompra;
  String get limiteCompra => _limiteCompra ?? '';
  bool hasLimiteCompra() => _limiteCompra != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _desconto = castToType<double>(snapshotData['desconto']);
    _fotos = getDataList(snapshotData['fotos']);
    _produtos = getDataList(snapshotData['produtos']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _status = snapshotData['status'] as bool?;
    _data = snapshotData['data'] as String?;
    _estoque = snapshotData['estoque'] as String?;
    _limiteCompra = snapshotData['limite_compra'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promoRelampago')
          : FirebaseFirestore.instance.collectionGroup('promoRelampago');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('promoRelampago').doc(id);

  static Stream<PromoRelampagoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromoRelampagoRecord.fromSnapshot(s));

  static Future<PromoRelampagoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromoRelampagoRecord.fromSnapshot(s));

  static PromoRelampagoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromoRelampagoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromoRelampagoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromoRelampagoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromoRelampagoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromoRelampagoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromoRelampagoRecordData({
  double? desconto,
  DocumentReference? userRef,
  bool? status,
  String? data,
  String? estoque,
  String? limiteCompra,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'desconto': desconto,
      'userRef': userRef,
      'status': status,
      'data': data,
      'estoque': estoque,
      'limite_compra': limiteCompra,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromoRelampagoRecordDocumentEquality
    implements Equality<PromoRelampagoRecord> {
  const PromoRelampagoRecordDocumentEquality();

  @override
  bool equals(PromoRelampagoRecord? e1, PromoRelampagoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.desconto == e2?.desconto &&
        listEquality.equals(e1?.fotos, e2?.fotos) &&
        listEquality.equals(e1?.produtos, e2?.produtos) &&
        e1?.userRef == e2?.userRef &&
        e1?.status == e2?.status &&
        e1?.data == e2?.data &&
        e1?.estoque == e2?.estoque &&
        e1?.limiteCompra == e2?.limiteCompra;
  }

  @override
  int hash(PromoRelampagoRecord? e) => const ListEquality().hash([
        e?.desconto,
        e?.fotos,
        e?.produtos,
        e?.userRef,
        e?.status,
        e?.data,
        e?.estoque,
        e?.limiteCompra
      ]);

  @override
  bool isValidKey(Object? o) => o is PromoRelampagoRecord;
}
