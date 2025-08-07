import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinkRecord extends FirestoreRecord {
  LinkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  void _initializeFields() {
    _link = snapshotData['link'] as String?;
    _tipo = snapshotData['tipo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('link');

  static Stream<LinkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LinkRecord.fromSnapshot(s));

  static Future<LinkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LinkRecord.fromSnapshot(s));

  static LinkRecord fromSnapshot(DocumentSnapshot snapshot) => LinkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LinkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LinkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LinkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LinkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLinkRecordData({
  String? link,
  String? tipo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'link': link,
      'tipo': tipo,
    }.withoutNulls,
  );

  return firestoreData;
}

class LinkRecordDocumentEquality implements Equality<LinkRecord> {
  const LinkRecordDocumentEquality();

  @override
  bool equals(LinkRecord? e1, LinkRecord? e2) {
    return e1?.link == e2?.link && e1?.tipo == e2?.tipo;
  }

  @override
  int hash(LinkRecord? e) => const ListEquality().hash([e?.link, e?.tipo]);

  @override
  bool isValidKey(Object? o) => o is LinkRecord;
}
