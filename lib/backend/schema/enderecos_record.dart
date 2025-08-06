import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnderecosRecord extends FirestoreRecord {
  EnderecosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "contato" field.
  String? _contato;
  String get contato => _contato ?? '';
  bool hasContato() => _contato != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  bool hasBairro() => _bairro != null;

  // "rua" field.
  String? _rua;
  String get rua => _rua ?? '';
  bool hasRua() => _rua != null;

  // "numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  bool hasNumero() => _numero != null;

  // "casa_trabalho" field.
  String? _casaTrabalho;
  String get casaTrabalho => _casaTrabalho ?? '';
  bool hasCasaTrabalho() => _casaTrabalho != null;

  // "endereco_completo" field.
  String? _enderecoCompleto;
  String get enderecoCompleto => _enderecoCompleto ?? '';
  bool hasEnderecoCompleto() => _enderecoCompleto != null;

  // "referencia" field.
  String? _referencia;
  String get referencia => _referencia ?? '';
  bool hasReferencia() => _referencia != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _contato = snapshotData['contato'] as String?;
    _cep = snapshotData['cep'] as String?;
    _estado = snapshotData['estado'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _bairro = snapshotData['bairro'] as String?;
    _rua = snapshotData['rua'] as String?;
    _numero = snapshotData['numero'] as String?;
    _casaTrabalho = snapshotData['casa_trabalho'] as String?;
    _enderecoCompleto = snapshotData['endereco_completo'] as String?;
    _referencia = snapshotData['referencia'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('enderecos')
          : FirebaseFirestore.instance.collectionGroup('enderecos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('enderecos').doc(id);

  static Stream<EnderecosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnderecosRecord.fromSnapshot(s));

  static Future<EnderecosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnderecosRecord.fromSnapshot(s));

  static EnderecosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnderecosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnderecosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnderecosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnderecosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnderecosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnderecosRecordData({
  String? nome,
  String? contato,
  String? cep,
  String? estado,
  String? cidade,
  String? bairro,
  String? rua,
  String? numero,
  String? casaTrabalho,
  String? enderecoCompleto,
  String? referencia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'contato': contato,
      'cep': cep,
      'estado': estado,
      'cidade': cidade,
      'bairro': bairro,
      'rua': rua,
      'numero': numero,
      'casa_trabalho': casaTrabalho,
      'endereco_completo': enderecoCompleto,
      'referencia': referencia,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnderecosRecordDocumentEquality implements Equality<EnderecosRecord> {
  const EnderecosRecordDocumentEquality();

  @override
  bool equals(EnderecosRecord? e1, EnderecosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.contato == e2?.contato &&
        e1?.cep == e2?.cep &&
        e1?.estado == e2?.estado &&
        e1?.cidade == e2?.cidade &&
        e1?.bairro == e2?.bairro &&
        e1?.rua == e2?.rua &&
        e1?.numero == e2?.numero &&
        e1?.casaTrabalho == e2?.casaTrabalho &&
        e1?.enderecoCompleto == e2?.enderecoCompleto &&
        e1?.referencia == e2?.referencia;
  }

  @override
  int hash(EnderecosRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.contato,
        e?.cep,
        e?.estado,
        e?.cidade,
        e?.bairro,
        e?.rua,
        e?.numero,
        e?.casaTrabalho,
        e?.enderecoCompleto,
        e?.referencia
      ]);

  @override
  bool isValidKey(Object? o) => o is EnderecosRecord;
}
