import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BaixarAppRecord extends FirestoreRecord {
  BaixarAppRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ip" field.
  String? _ip;
  String get ip => _ip ?? '';
  bool hasIp() => _ip != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "tamanhoTela" field.
  String? _tamanhoTela;
  String get tamanhoTela => _tamanhoTela ?? '';
  bool hasTamanhoTela() => _tamanhoTela != null;

  // "acessouMobile" field.
  bool? _acessouMobile;
  bool get acessouMobile => _acessouMobile ?? false;
  bool hasAcessouMobile() => _acessouMobile != null;

  // "produtoAfiliadoRef" field.
  DocumentReference? _produtoAfiliadoRef;
  DocumentReference? get produtoAfiliadoRef => _produtoAfiliadoRef;
  bool hasProdutoAfiliadoRef() => _produtoAfiliadoRef != null;

  // "baixarRef" field.
  DocumentReference? _baixarRef;
  DocumentReference? get baixarRef => _baixarRef;
  bool hasBaixarRef() => _baixarRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "carrinhoNacional" field.
  List<String>? _carrinhoNacional;
  List<String> get carrinhoNacional => _carrinhoNacional ?? const [];
  bool hasCarrinhoNacional() => _carrinhoNacional != null;

  // "carrinhoInternacional" field.
  List<String>? _carrinhoInternacional;
  List<String> get carrinhoInternacional => _carrinhoInternacional ?? const [];
  bool hasCarrinhoInternacional() => _carrinhoInternacional != null;

  void _initializeFields() {
    _ip = snapshotData['ip'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _tamanhoTela = snapshotData['tamanhoTela'] as String?;
    _acessouMobile = snapshotData['acessouMobile'] as bool?;
    _produtoAfiliadoRef =
        snapshotData['produtoAfiliadoRef'] as DocumentReference?;
    _baixarRef = snapshotData['baixarRef'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _carrinhoNacional = getDataList(snapshotData['carrinhoNacional']);
    _carrinhoInternacional = getDataList(snapshotData['carrinhoInternacional']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('baixarApp');

  static Stream<BaixarAppRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BaixarAppRecord.fromSnapshot(s));

  static Future<BaixarAppRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BaixarAppRecord.fromSnapshot(s));

  static BaixarAppRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BaixarAppRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BaixarAppRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BaixarAppRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BaixarAppRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BaixarAppRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBaixarAppRecordData({
  String? ip,
  DateTime? time,
  String? tamanhoTela,
  bool? acessouMobile,
  DocumentReference? produtoAfiliadoRef,
  DocumentReference? baixarRef,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ip': ip,
      'time': time,
      'tamanhoTela': tamanhoTela,
      'acessouMobile': acessouMobile,
      'produtoAfiliadoRef': produtoAfiliadoRef,
      'baixarRef': baixarRef,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class BaixarAppRecordDocumentEquality implements Equality<BaixarAppRecord> {
  const BaixarAppRecordDocumentEquality();

  @override
  bool equals(BaixarAppRecord? e1, BaixarAppRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ip == e2?.ip &&
        e1?.time == e2?.time &&
        e1?.tamanhoTela == e2?.tamanhoTela &&
        e1?.acessouMobile == e2?.acessouMobile &&
        e1?.produtoAfiliadoRef == e2?.produtoAfiliadoRef &&
        e1?.baixarRef == e2?.baixarRef &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.carrinhoNacional, e2?.carrinhoNacional) &&
        listEquality.equals(
            e1?.carrinhoInternacional, e2?.carrinhoInternacional);
  }

  @override
  int hash(BaixarAppRecord? e) => const ListEquality().hash([
        e?.ip,
        e?.time,
        e?.tamanhoTela,
        e?.acessouMobile,
        e?.produtoAfiliadoRef,
        e?.baixarRef,
        e?.status,
        e?.carrinhoNacional,
        e?.carrinhoInternacional
      ]);

  @override
  bool isValidKey(Object? o) => o is BaixarAppRecord;
}
