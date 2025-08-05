import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriaProdutoRecord extends FirestoreRecord {
  CategoriaProdutoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lider_nome" field.
  String? _liderNome;
  String get liderNome => _liderNome ?? '';
  bool hasLiderNome() => _liderNome != null;

  // "list_do_lider" field.
  List<String>? _listDoLider;
  List<String> get listDoLider => _listDoLider ?? const [];
  bool hasListDoLider() => _listDoLider != null;

  // "numero_categoria" field.
  String? _numeroCategoria;
  String get numeroCategoria => _numeroCategoria ?? '';
  bool hasNumeroCategoria() => _numeroCategoria != null;

  void _initializeFields() {
    _liderNome = snapshotData['lider_nome'] as String?;
    _listDoLider = getDataList(snapshotData['list_do_lider']);
    _numeroCategoria = snapshotData['numero_categoria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categoria_produto');

  static Stream<CategoriaProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriaProdutoRecord.fromSnapshot(s));

  static Future<CategoriaProdutoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CategoriaProdutoRecord.fromSnapshot(s));

  static CategoriaProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriaProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriaProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriaProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriaProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriaProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriaProdutoRecordData({
  String? liderNome,
  String? numeroCategoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lider_nome': liderNome,
      'numero_categoria': numeroCategoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriaProdutoRecordDocumentEquality
    implements Equality<CategoriaProdutoRecord> {
  const CategoriaProdutoRecordDocumentEquality();

  @override
  bool equals(CategoriaProdutoRecord? e1, CategoriaProdutoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.liderNome == e2?.liderNome &&
        listEquality.equals(e1?.listDoLider, e2?.listDoLider) &&
        e1?.numeroCategoria == e2?.numeroCategoria;
  }

  @override
  int hash(CategoriaProdutoRecord? e) => const ListEquality()
      .hash([e?.liderNome, e?.listDoLider, e?.numeroCategoria]);

  @override
  bool isValidKey(Object? o) => o is CategoriaProdutoRecord;
}
