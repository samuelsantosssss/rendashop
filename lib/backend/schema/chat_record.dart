import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "clienteID" field.
  DocumentReference? _clienteID;
  DocumentReference? get clienteID => _clienteID;
  bool hasClienteID() => _clienteID != null;

  // "logistaID" field.
  DocumentReference? _logistaID;
  DocumentReference? get logistaID => _logistaID;
  bool hasLogistaID() => _logistaID != null;

  // "conversa" field.
  List<String>? _conversa;
  List<String> get conversa => _conversa ?? const [];
  bool hasConversa() => _conversa != null;

  void _initializeFields() {
    _clienteID = snapshotData['clienteID'] as DocumentReference?;
    _logistaID = snapshotData['logistaID'] as DocumentReference?;
    _conversa = getDataList(snapshotData['conversa']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? clienteID,
  DocumentReference? logistaID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clienteID': clienteID,
      'logistaID': logistaID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clienteID == e2?.clienteID &&
        e1?.logistaID == e2?.logistaID &&
        listEquality.equals(e1?.conversa, e2?.conversa);
  }

  @override
  int hash(ChatRecord? e) =>
      const ListEquality().hash([e?.clienteID, e?.logistaID, e?.conversa]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
