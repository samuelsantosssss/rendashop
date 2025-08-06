import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvaliacaoLojaRecord extends FirestoreRecord {
  AvaliacaoLojaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "nota" field.
  int? _nota;
  int get nota => _nota ?? 0;
  bool hasNota() => _nota != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _nota = castToType<int>(snapshotData['nota']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('avaliacao_loja')
          : FirebaseFirestore.instance.collectionGroup('avaliacao_loja');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('avaliacao_loja').doc(id);

  static Stream<AvaliacaoLojaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvaliacaoLojaRecord.fromSnapshot(s));

  static Future<AvaliacaoLojaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvaliacaoLojaRecord.fromSnapshot(s));

  static AvaliacaoLojaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvaliacaoLojaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvaliacaoLojaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvaliacaoLojaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvaliacaoLojaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvaliacaoLojaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvaliacaoLojaRecordData({
  DocumentReference? userRef,
  int? nota,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'nota': nota,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvaliacaoLojaRecordDocumentEquality
    implements Equality<AvaliacaoLojaRecord> {
  const AvaliacaoLojaRecordDocumentEquality();

  @override
  bool equals(AvaliacaoLojaRecord? e1, AvaliacaoLojaRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.nota == e2?.nota;
  }

  @override
  int hash(AvaliacaoLojaRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.nota]);

  @override
  bool isValidKey(Object? o) => o is AvaliacaoLojaRecord;
}
