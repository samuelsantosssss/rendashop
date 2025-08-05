import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RastreioRecord extends FirestoreRecord {
  RastreioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "codigo_rastreio" field.
  String? _codigoRastreio;
  String get codigoRastreio => _codigoRastreio ?? '';
  bool hasCodigoRastreio() => _codigoRastreio != null;

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "mensagem" field.
  String? _mensagem;
  String get mensagem => _mensagem ?? '';
  bool hasMensagem() => _mensagem != null;

  // "entregue" field.
  double? _entregue;
  double get entregue => _entregue ?? 0.0;
  bool hasEntregue() => _entregue != null;

  // "data_entregue" field.
  DateTime? _dataEntregue;
  DateTime? get dataEntregue => _dataEntregue;
  bool hasDataEntregue() => _dataEntregue != null;

  // "pedidoRef2" field.
  DocumentReference? _pedidoRef2;
  DocumentReference? get pedidoRef2 => _pedidoRef2;
  bool hasPedidoRef2() => _pedidoRef2 != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _codigoRastreio = snapshotData['codigo_rastreio'] as String?;
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _data = snapshotData['data'] as DateTime?;
    _mensagem = snapshotData['mensagem'] as String?;
    _entregue = castToType<double>(snapshotData['entregue']);
    _dataEntregue = snapshotData['data_entregue'] as DateTime?;
    _pedidoRef2 = snapshotData['pedidoRef2'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rastreio')
          : FirebaseFirestore.instance.collectionGroup('rastreio');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('rastreio').doc(id);

  static Stream<RastreioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RastreioRecord.fromSnapshot(s));

  static Future<RastreioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RastreioRecord.fromSnapshot(s));

  static RastreioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RastreioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RastreioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RastreioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RastreioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RastreioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRastreioRecordData({
  String? codigoRastreio,
  DocumentReference? userRef,
  DateTime? data,
  String? mensagem,
  double? entregue,
  DateTime? dataEntregue,
  DocumentReference? pedidoRef2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigo_rastreio': codigoRastreio,
      'UserRef': userRef,
      'data': data,
      'mensagem': mensagem,
      'entregue': entregue,
      'data_entregue': dataEntregue,
      'pedidoRef2': pedidoRef2,
    }.withoutNulls,
  );

  return firestoreData;
}

class RastreioRecordDocumentEquality implements Equality<RastreioRecord> {
  const RastreioRecordDocumentEquality();

  @override
  bool equals(RastreioRecord? e1, RastreioRecord? e2) {
    return e1?.codigoRastreio == e2?.codigoRastreio &&
        e1?.userRef == e2?.userRef &&
        e1?.data == e2?.data &&
        e1?.mensagem == e2?.mensagem &&
        e1?.entregue == e2?.entregue &&
        e1?.dataEntregue == e2?.dataEntregue &&
        e1?.pedidoRef2 == e2?.pedidoRef2;
  }

  @override
  int hash(RastreioRecord? e) => const ListEquality().hash([
        e?.codigoRastreio,
        e?.userRef,
        e?.data,
        e?.mensagem,
        e?.entregue,
        e?.dataEntregue,
        e?.pedidoRef2
      ]);

  @override
  bool isValidKey(Object? o) => o is RastreioRecord;
}
