import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CancelamentoRecord extends FirestoreRecord {
  CancelamentoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "pedidoRef" field.
  DocumentReference? _pedidoRef;
  DocumentReference? get pedidoRef => _pedidoRef;
  bool hasPedidoRef() => _pedidoRef != null;

  // "solicitante" field.
  String? _solicitante;
  String get solicitante => _solicitante ?? '';
  bool hasSolicitante() => _solicitante != null;

  // "motivo" field.
  String? _motivo;
  String get motivo => _motivo ?? '';
  bool hasMotivo() => _motivo != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "lojaRef" field.
  DocumentReference? _lojaRef;
  DocumentReference? get lojaRef => _lojaRef;
  bool hasLojaRef() => _lojaRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "ID_solicitacao" field.
  String? _iDSolicitacao;
  String get iDSolicitacao => _iDSolicitacao ?? '';
  bool hasIDSolicitacao() => _iDSolicitacao != null;

  // "valor_reembolso" field.
  double? _valorReembolso;
  double get valorReembolso => _valorReembolso ?? 0.0;
  bool hasValorReembolso() => _valorReembolso != null;

  // "produtoRef" field.
  DocumentReference? _produtoRef;
  DocumentReference? get produtoRef => _produtoRef;
  bool hasProdutoRef() => _produtoRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _data = snapshotData['data'] as DateTime?;
    _pedidoRef = snapshotData['pedidoRef'] as DocumentReference?;
    _solicitante = snapshotData['solicitante'] as String?;
    _motivo = snapshotData['motivo'] as String?;
    _status = snapshotData['status'] as String?;
    _lojaRef = snapshotData['lojaRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _iDSolicitacao = snapshotData['ID_solicitacao'] as String?;
    _valorReembolso = castToType<double>(snapshotData['valor_reembolso']);
    _produtoRef = snapshotData['produtoRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cancelamento')
          : FirebaseFirestore.instance.collectionGroup('cancelamento');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cancelamento').doc(id);

  static Stream<CancelamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CancelamentoRecord.fromSnapshot(s));

  static Future<CancelamentoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CancelamentoRecord.fromSnapshot(s));

  static CancelamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CancelamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CancelamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CancelamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CancelamentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CancelamentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCancelamentoRecordData({
  DateTime? data,
  DocumentReference? pedidoRef,
  String? solicitante,
  String? motivo,
  String? status,
  DocumentReference? lojaRef,
  DocumentReference? userRef,
  String? iDSolicitacao,
  double? valorReembolso,
  DocumentReference? produtoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': data,
      'pedidoRef': pedidoRef,
      'solicitante': solicitante,
      'motivo': motivo,
      'status': status,
      'lojaRef': lojaRef,
      'userRef': userRef,
      'ID_solicitacao': iDSolicitacao,
      'valor_reembolso': valorReembolso,
      'produtoRef': produtoRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CancelamentoRecordDocumentEquality
    implements Equality<CancelamentoRecord> {
  const CancelamentoRecordDocumentEquality();

  @override
  bool equals(CancelamentoRecord? e1, CancelamentoRecord? e2) {
    return e1?.data == e2?.data &&
        e1?.pedidoRef == e2?.pedidoRef &&
        e1?.solicitante == e2?.solicitante &&
        e1?.motivo == e2?.motivo &&
        e1?.status == e2?.status &&
        e1?.lojaRef == e2?.lojaRef &&
        e1?.userRef == e2?.userRef &&
        e1?.iDSolicitacao == e2?.iDSolicitacao &&
        e1?.valorReembolso == e2?.valorReembolso &&
        e1?.produtoRef == e2?.produtoRef;
  }

  @override
  int hash(CancelamentoRecord? e) => const ListEquality().hash([
        e?.data,
        e?.pedidoRef,
        e?.solicitante,
        e?.motivo,
        e?.status,
        e?.lojaRef,
        e?.userRef,
        e?.iDSolicitacao,
        e?.valorReembolso,
        e?.produtoRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CancelamentoRecord;
}
