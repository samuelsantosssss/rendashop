import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagamentoAfiliadoRecord extends FirestoreRecord {
  PagamentoAfiliadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "afiliadoRef" field.
  DocumentReference? _afiliadoRef;
  DocumentReference? get afiliadoRef => _afiliadoRef;
  bool hasAfiliadoRef() => _afiliadoRef != null;

  // "valor" field.
  String? _valor;
  String get valor => _valor ?? '';
  bool hasValor() => _valor != null;

  // "dataPagamento" field.
  DateTime? _dataPagamento;
  DateTime? get dataPagamento => _dataPagamento;
  bool hasDataPagamento() => _dataPagamento != null;

  // "pedidoRef" field.
  List<DocumentReference>? _pedidoRef;
  List<DocumentReference> get pedidoRef => _pedidoRef ?? const [];
  bool hasPedidoRef() => _pedidoRef != null;

  // "comprovantes" field.
  List<String>? _comprovantes;
  List<String> get comprovantes => _comprovantes ?? const [];
  bool hasComprovantes() => _comprovantes != null;

  // "nomeAfiliado" field.
  String? _nomeAfiliado;
  String get nomeAfiliado => _nomeAfiliado ?? '';
  bool hasNomeAfiliado() => _nomeAfiliado != null;

  // "pix" field.
  String? _pix;
  String get pix => _pix ?? '';
  bool hasPix() => _pix != null;

  // "tipoPix" field.
  String? _tipoPix;
  String get tipoPix => _tipoPix ?? '';
  bool hasTipoPix() => _tipoPix != null;

  // "banco" field.
  String? _banco;
  String get banco => _banco ?? '';
  bool hasBanco() => _banco != null;

  void _initializeFields() {
    _afiliadoRef = snapshotData['afiliadoRef'] as DocumentReference?;
    _valor = snapshotData['valor'] as String?;
    _dataPagamento = snapshotData['dataPagamento'] as DateTime?;
    _pedidoRef = getDataList(snapshotData['pedidoRef']);
    _comprovantes = getDataList(snapshotData['comprovantes']);
    _nomeAfiliado = snapshotData['nomeAfiliado'] as String?;
    _pix = snapshotData['pix'] as String?;
    _tipoPix = snapshotData['tipoPix'] as String?;
    _banco = snapshotData['banco'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pagamentoAfiliado');

  static Stream<PagamentoAfiliadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PagamentoAfiliadoRecord.fromSnapshot(s));

  static Future<PagamentoAfiliadoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PagamentoAfiliadoRecord.fromSnapshot(s));

  static PagamentoAfiliadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PagamentoAfiliadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PagamentoAfiliadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PagamentoAfiliadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PagamentoAfiliadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PagamentoAfiliadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPagamentoAfiliadoRecordData({
  DocumentReference? afiliadoRef,
  String? valor,
  DateTime? dataPagamento,
  String? nomeAfiliado,
  String? pix,
  String? tipoPix,
  String? banco,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'afiliadoRef': afiliadoRef,
      'valor': valor,
      'dataPagamento': dataPagamento,
      'nomeAfiliado': nomeAfiliado,
      'pix': pix,
      'tipoPix': tipoPix,
      'banco': banco,
    }.withoutNulls,
  );

  return firestoreData;
}

class PagamentoAfiliadoRecordDocumentEquality
    implements Equality<PagamentoAfiliadoRecord> {
  const PagamentoAfiliadoRecordDocumentEquality();

  @override
  bool equals(PagamentoAfiliadoRecord? e1, PagamentoAfiliadoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.afiliadoRef == e2?.afiliadoRef &&
        e1?.valor == e2?.valor &&
        e1?.dataPagamento == e2?.dataPagamento &&
        listEquality.equals(e1?.pedidoRef, e2?.pedidoRef) &&
        listEquality.equals(e1?.comprovantes, e2?.comprovantes) &&
        e1?.nomeAfiliado == e2?.nomeAfiliado &&
        e1?.pix == e2?.pix &&
        e1?.tipoPix == e2?.tipoPix &&
        e1?.banco == e2?.banco;
  }

  @override
  int hash(PagamentoAfiliadoRecord? e) => const ListEquality().hash([
        e?.afiliadoRef,
        e?.valor,
        e?.dataPagamento,
        e?.pedidoRef,
        e?.comprovantes,
        e?.nomeAfiliado,
        e?.pix,
        e?.tipoPix,
        e?.banco
      ]);

  @override
  bool isValidKey(Object? o) => o is PagamentoAfiliadoRecord;
}
