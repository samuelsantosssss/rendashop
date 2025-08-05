import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CupomRecord extends FirestoreRecord {
  CupomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "tipo_cupom" field.
  String? _tipoCupom;
  String get tipoCupom => _tipoCupom ?? '';
  bool hasTipoCupom() => _tipoCupom != null;

  // "valor_desconto" field.
  double? _valorDesconto;
  double get valorDesconto => _valorDesconto ?? 0.0;
  bool hasValorDesconto() => _valorDesconto != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "selecionado" field.
  bool? _selecionado;
  bool get selecionado => _selecionado ?? false;
  bool hasSelecionado() => _selecionado != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _tipoCupom = snapshotData['tipo_cupom'] as String?;
    _valorDesconto = castToType<double>(snapshotData['valor_desconto']);
    _status = snapshotData['status'] as String?;
    _selecionado = snapshotData['selecionado'] as bool?;
    _data = snapshotData['data'] as DateTime?;
    _valor = castToType<double>(snapshotData['valor']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cupom')
          : FirebaseFirestore.instance.collectionGroup('cupom');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cupom').doc(id);

  static Stream<CupomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CupomRecord.fromSnapshot(s));

  static Future<CupomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CupomRecord.fromSnapshot(s));

  static CupomRecord fromSnapshot(DocumentSnapshot snapshot) => CupomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CupomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CupomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CupomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CupomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCupomRecordData({
  String? nome,
  String? tipoCupom,
  double? valorDesconto,
  String? status,
  bool? selecionado,
  DateTime? data,
  double? valor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'tipo_cupom': tipoCupom,
      'valor_desconto': valorDesconto,
      'status': status,
      'selecionado': selecionado,
      'data': data,
      'valor': valor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CupomRecordDocumentEquality implements Equality<CupomRecord> {
  const CupomRecordDocumentEquality();

  @override
  bool equals(CupomRecord? e1, CupomRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.tipoCupom == e2?.tipoCupom &&
        e1?.valorDesconto == e2?.valorDesconto &&
        e1?.status == e2?.status &&
        e1?.selecionado == e2?.selecionado &&
        e1?.data == e2?.data &&
        e1?.valor == e2?.valor;
  }

  @override
  int hash(CupomRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.tipoCupom,
        e?.valorDesconto,
        e?.status,
        e?.selecionado,
        e?.data,
        e?.valor
      ]);

  @override
  bool isValidKey(Object? o) => o is CupomRecord;
}
