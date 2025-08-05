import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannerRecord extends FirestoreRecord {
  BannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "listaBanner" field.
  List<String>? _listaBanner;
  List<String> get listaBanner => _listaBanner ?? const [];
  bool hasListaBanner() => _listaBanner != null;

  // "local" field.
  String? _local;
  String get local => _local ?? '';
  bool hasLocal() => _local != null;

  void _initializeFields() {
    _listaBanner = getDataList(snapshotData['listaBanner']);
    _local = snapshotData['local'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banner');

  static Stream<BannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannerRecord.fromSnapshot(s));

  static Future<BannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannerRecord.fromSnapshot(s));

  static BannerRecord fromSnapshot(DocumentSnapshot snapshot) => BannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannerRecordData({
  String? local,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'local': local,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannerRecordDocumentEquality implements Equality<BannerRecord> {
  const BannerRecordDocumentEquality();

  @override
  bool equals(BannerRecord? e1, BannerRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.listaBanner, e2?.listaBanner) &&
        e1?.local == e2?.local;
  }

  @override
  int hash(BannerRecord? e) =>
      const ListEquality().hash([e?.listaBanner, e?.local]);

  @override
  bool isValidKey(Object? o) => o is BannerRecord;
}
