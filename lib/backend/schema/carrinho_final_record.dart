import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrinhoFinalRecord extends FirestoreRecord {
  CarrinhoFinalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeLoja" field.
  String? _nomeLoja;
  String get nomeLoja => _nomeLoja ?? '';
  bool hasNomeLoja() => _nomeLoja != null;

  // "ListProdutos" field.
  List<String>? _listProdutos;
  List<String> get listProdutos => _listProdutos ?? const [];
  bool hasListProdutos() => _listProdutos != null;

  // "frete" field.
  double? _frete;
  double get frete => _frete ?? 0.0;
  bool hasFrete() => _frete != null;

  // "nacional" field.
  bool? _nacional;
  bool get nacional => _nacional ?? false;
  bool hasNacional() => _nacional != null;

  // "fretePromo" field.
  String? _fretePromo;
  String get fretePromo => _fretePromo ?? '';
  bool hasFretePromo() => _fretePromo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeLoja = snapshotData['nomeLoja'] as String?;
    _listProdutos = getDataList(snapshotData['ListProdutos']);
    _frete = castToType<double>(snapshotData['frete']);
    _nacional = snapshotData['nacional'] as bool?;
    _fretePromo = snapshotData['fretePromo'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('carrinhoFinal')
          : FirebaseFirestore.instance.collectionGroup('carrinhoFinal');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('carrinhoFinal').doc(id);

  static Stream<CarrinhoFinalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarrinhoFinalRecord.fromSnapshot(s));

  static Future<CarrinhoFinalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarrinhoFinalRecord.fromSnapshot(s));

  static CarrinhoFinalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarrinhoFinalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarrinhoFinalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarrinhoFinalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarrinhoFinalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarrinhoFinalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarrinhoFinalRecordData({
  String? nomeLoja,
  double? frete,
  bool? nacional,
  String? fretePromo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeLoja': nomeLoja,
      'frete': frete,
      'nacional': nacional,
      'fretePromo': fretePromo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarrinhoFinalRecordDocumentEquality
    implements Equality<CarrinhoFinalRecord> {
  const CarrinhoFinalRecordDocumentEquality();

  @override
  bool equals(CarrinhoFinalRecord? e1, CarrinhoFinalRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeLoja == e2?.nomeLoja &&
        listEquality.equals(e1?.listProdutos, e2?.listProdutos) &&
        e1?.frete == e2?.frete &&
        e1?.nacional == e2?.nacional &&
        e1?.fretePromo == e2?.fretePromo;
  }

  @override
  int hash(CarrinhoFinalRecord? e) => const ListEquality().hash(
      [e?.nomeLoja, e?.listProdutos, e?.frete, e?.nacional, e?.fretePromo]);

  @override
  bool isValidKey(Object? o) => o is CarrinhoFinalRecord;
}
