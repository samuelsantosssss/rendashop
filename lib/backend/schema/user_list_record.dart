import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserListRecord extends FirestoreRecord {
  UserListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  List<DocumentReference>? _userRef;
  List<DocumentReference> get userRef => _userRef ?? const [];
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _userRef = getDataList(snapshotData['userRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userList');

  static Stream<UserListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserListRecord.fromSnapshot(s));

  static Future<UserListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserListRecord.fromSnapshot(s));

  static UserListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserListRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class UserListRecordDocumentEquality implements Equality<UserListRecord> {
  const UserListRecordDocumentEquality();

  @override
  bool equals(UserListRecord? e1, UserListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userRef, e2?.userRef);
  }

  @override
  int hash(UserListRecord? e) => const ListEquality().hash([e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is UserListRecord;
}
