import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextoVendaRecord extends FirestoreRecord {
  TextoVendaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  void _initializeFields() {
    _texto = snapshotData['texto'] as String?;
    _categoria = snapshotData['categoria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('textoVenda');

  static Stream<TextoVendaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TextoVendaRecord.fromSnapshot(s));

  static Future<TextoVendaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TextoVendaRecord.fromSnapshot(s));

  static TextoVendaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TextoVendaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TextoVendaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TextoVendaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TextoVendaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TextoVendaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTextoVendaRecordData({
  String? texto,
  String? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'texto': texto,
      'categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class TextoVendaRecordDocumentEquality implements Equality<TextoVendaRecord> {
  const TextoVendaRecordDocumentEquality();

  @override
  bool equals(TextoVendaRecord? e1, TextoVendaRecord? e2) {
    return e1?.texto == e2?.texto && e1?.categoria == e2?.categoria;
  }

  @override
  int hash(TextoVendaRecord? e) =>
      const ListEquality().hash([e?.texto, e?.categoria]);

  @override
  bool isValidKey(Object? o) => o is TextoVendaRecord;
}
