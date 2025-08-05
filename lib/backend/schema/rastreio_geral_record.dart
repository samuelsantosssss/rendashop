import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RastreioGeralRecord extends FirestoreRecord {
  RastreioGeralRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lista_rastreios" field.
  List<String>? _listaRastreios;
  List<String> get listaRastreios => _listaRastreios ?? const [];
  bool hasListaRastreios() => _listaRastreios != null;

  void _initializeFields() {
    _listaRastreios = getDataList(snapshotData['lista_rastreios']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rastreio_geral');

  static Stream<RastreioGeralRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RastreioGeralRecord.fromSnapshot(s));

  static Future<RastreioGeralRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RastreioGeralRecord.fromSnapshot(s));

  static RastreioGeralRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RastreioGeralRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RastreioGeralRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RastreioGeralRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RastreioGeralRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RastreioGeralRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRastreioGeralRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class RastreioGeralRecordDocumentEquality
    implements Equality<RastreioGeralRecord> {
  const RastreioGeralRecordDocumentEquality();

  @override
  bool equals(RastreioGeralRecord? e1, RastreioGeralRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.listaRastreios, e2?.listaRastreios);
  }

  @override
  int hash(RastreioGeralRecord? e) =>
      const ListEquality().hash([e?.listaRastreios]);

  @override
  bool isValidKey(Object? o) => o is RastreioGeralRecord;
}
