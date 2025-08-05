import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PastaTesteRecord extends FirestoreRecord {
  PastaTesteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "numeros" field.
  List<int>? _numeros;
  List<int> get numeros => _numeros ?? const [];
  bool hasNumeros() => _numeros != null;

  void _initializeFields() {
    _numeros = getDataList(snapshotData['numeros']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pastaTeste');

  static Stream<PastaTesteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PastaTesteRecord.fromSnapshot(s));

  static Future<PastaTesteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PastaTesteRecord.fromSnapshot(s));

  static PastaTesteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PastaTesteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PastaTesteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PastaTesteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PastaTesteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PastaTesteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPastaTesteRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PastaTesteRecordDocumentEquality implements Equality<PastaTesteRecord> {
  const PastaTesteRecordDocumentEquality();

  @override
  bool equals(PastaTesteRecord? e1, PastaTesteRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.numeros, e2?.numeros);
  }

  @override
  int hash(PastaTesteRecord? e) => const ListEquality().hash([e?.numeros]);

  @override
  bool isValidKey(Object? o) => o is PastaTesteRecord;
}
