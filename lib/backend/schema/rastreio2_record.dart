import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Rastreio2Record extends FirestoreRecord {
  Rastreio2Record._(
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
    _pedidoRef2 = snapshotData['pedidoRef2'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rastreio2')
          : FirebaseFirestore.instance.collectionGroup('rastreio2');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('rastreio2').doc(id);

  static Stream<Rastreio2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Rastreio2Record.fromSnapshot(s));

  static Future<Rastreio2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Rastreio2Record.fromSnapshot(s));

  static Rastreio2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Rastreio2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Rastreio2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Rastreio2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Rastreio2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Rastreio2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRastreio2RecordData({
  String? codigoRastreio,
  DocumentReference? userRef,
  DateTime? data,
  String? mensagem,
  DocumentReference? pedidoRef2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigo_rastreio': codigoRastreio,
      'UserRef': userRef,
      'data': data,
      'mensagem': mensagem,
      'pedidoRef2': pedidoRef2,
    }.withoutNulls,
  );

  return firestoreData;
}

class Rastreio2RecordDocumentEquality implements Equality<Rastreio2Record> {
  const Rastreio2RecordDocumentEquality();

  @override
  bool equals(Rastreio2Record? e1, Rastreio2Record? e2) {
    return e1?.codigoRastreio == e2?.codigoRastreio &&
        e1?.userRef == e2?.userRef &&
        e1?.data == e2?.data &&
        e1?.mensagem == e2?.mensagem &&
        e1?.pedidoRef2 == e2?.pedidoRef2;
  }

  @override
  int hash(Rastreio2Record? e) => const ListEquality().hash(
      [e?.codigoRastreio, e?.userRef, e?.data, e?.mensagem, e?.pedidoRef2]);

  @override
  bool isValidKey(Object? o) => o is Rastreio2Record;
}
