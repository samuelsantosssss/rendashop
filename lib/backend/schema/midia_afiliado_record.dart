import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MidiaAfiliadoRecord extends FirestoreRecord {
  MidiaAfiliadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  bool hasCapa() => _capa != null;

  // "widget1" field.
  bool? _widget1;
  bool get widget1 => _widget1 ?? false;
  bool hasWidget1() => _widget1 != null;

  // "widget2" field.
  bool? _widget2;
  bool get widget2 => _widget2 ?? false;
  bool hasWidget2() => _widget2 != null;

  // "widget3" field.
  bool? _widget3;
  bool get widget3 => _widget3 ?? false;
  bool hasWidget3() => _widget3 != null;

  // "widget4" field.
  bool? _widget4;
  bool get widget4 => _widget4 ?? false;
  bool hasWidget4() => _widget4 != null;

  // "midia1" field.
  bool? _midia1;
  bool get midia1 => _midia1 ?? false;
  bool hasMidia1() => _midia1 != null;

  // "midia2" field.
  bool? _midia2;
  bool get midia2 => _midia2 ?? false;
  bool hasMidia2() => _midia2 != null;

  // "midia3" field.
  bool? _midia3;
  bool get midia3 => _midia3 ?? false;
  bool hasMidia3() => _midia3 != null;

  // "midia4" field.
  bool? _midia4;
  bool get midia4 => _midia4 ?? false;
  bool hasMidia4() => _midia4 != null;

  // "corPrincipal" field.
  Color? _corPrincipal;
  Color? get corPrincipal => _corPrincipal;
  bool hasCorPrincipal() => _corPrincipal != null;

  void _initializeFields() {
    _capa = snapshotData['capa'] as String?;
    _widget1 = snapshotData['widget1'] as bool?;
    _widget2 = snapshotData['widget2'] as bool?;
    _widget3 = snapshotData['widget3'] as bool?;
    _widget4 = snapshotData['widget4'] as bool?;
    _midia1 = snapshotData['midia1'] as bool?;
    _midia2 = snapshotData['midia2'] as bool?;
    _midia3 = snapshotData['midia3'] as bool?;
    _midia4 = snapshotData['midia4'] as bool?;
    _corPrincipal = getSchemaColor(snapshotData['corPrincipal']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('midiaAfiliado');

  static Stream<MidiaAfiliadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MidiaAfiliadoRecord.fromSnapshot(s));

  static Future<MidiaAfiliadoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MidiaAfiliadoRecord.fromSnapshot(s));

  static MidiaAfiliadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MidiaAfiliadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MidiaAfiliadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MidiaAfiliadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MidiaAfiliadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MidiaAfiliadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMidiaAfiliadoRecordData({
  String? capa,
  bool? widget1,
  bool? widget2,
  bool? widget3,
  bool? widget4,
  bool? midia1,
  bool? midia2,
  bool? midia3,
  bool? midia4,
  Color? corPrincipal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'capa': capa,
      'widget1': widget1,
      'widget2': widget2,
      'widget3': widget3,
      'widget4': widget4,
      'midia1': midia1,
      'midia2': midia2,
      'midia3': midia3,
      'midia4': midia4,
      'corPrincipal': corPrincipal,
    }.withoutNulls,
  );

  return firestoreData;
}

class MidiaAfiliadoRecordDocumentEquality
    implements Equality<MidiaAfiliadoRecord> {
  const MidiaAfiliadoRecordDocumentEquality();

  @override
  bool equals(MidiaAfiliadoRecord? e1, MidiaAfiliadoRecord? e2) {
    return e1?.capa == e2?.capa &&
        e1?.widget1 == e2?.widget1 &&
        e1?.widget2 == e2?.widget2 &&
        e1?.widget3 == e2?.widget3 &&
        e1?.widget4 == e2?.widget4 &&
        e1?.midia1 == e2?.midia1 &&
        e1?.midia2 == e2?.midia2 &&
        e1?.midia3 == e2?.midia3 &&
        e1?.midia4 == e2?.midia4 &&
        e1?.corPrincipal == e2?.corPrincipal;
  }

  @override
  int hash(MidiaAfiliadoRecord? e) => const ListEquality().hash([
        e?.capa,
        e?.widget1,
        e?.widget2,
        e?.widget3,
        e?.widget4,
        e?.midia1,
        e?.midia2,
        e?.midia3,
        e?.midia4,
        e?.corPrincipal
      ]);

  @override
  bool isValidKey(Object? o) => o is MidiaAfiliadoRecord;
}
