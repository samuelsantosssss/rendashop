import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartaoRecord extends FirestoreRecord {
  CartaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome_completo" field.
  String? _nomeCompleto;
  String get nomeCompleto => _nomeCompleto ?? '';
  bool hasNomeCompleto() => _nomeCompleto != null;

  // "numero_cartao" field.
  String? _numeroCartao;
  String get numeroCartao => _numeroCartao ?? '';
  bool hasNumeroCartao() => _numeroCartao != null;

  // "expiracao_mes" field.
  String? _expiracaoMes;
  String get expiracaoMes => _expiracaoMes ?? '';
  bool hasExpiracaoMes() => _expiracaoMes != null;

  // "experacao_ano" field.
  String? _experacaoAno;
  String get experacaoAno => _experacaoAno ?? '';
  bool hasExperacaoAno() => _experacaoAno != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "numero_casa" field.
  String? _numeroCasa;
  String get numeroCasa => _numeroCasa ?? '';
  bool hasNumeroCasa() => _numeroCasa != null;

  // "complemento_endereco" field.
  String? _complementoEndereco;
  String get complementoEndereco => _complementoEndereco ?? '';
  bool hasComplementoEndereco() => _complementoEndereco != null;

  // "celular" field.
  String? _celular;
  String get celular => _celular ?? '';
  bool hasCelular() => _celular != null;

  // "bin" field.
  String? _bin;
  String get bin => _bin ?? '';
  bool hasBin() => _bin != null;

  // "selecionado" field.
  bool? _selecionado;
  bool get selecionado => _selecionado ?? false;
  bool hasSelecionado() => _selecionado != null;

  // "bandeira" field.
  String? _bandeira;
  String get bandeira => _bandeira ?? '';
  bool hasBandeira() => _bandeira != null;

  // "abrir_fechar" field.
  bool? _abrirFechar;
  bool get abrirFechar => _abrirFechar ?? false;
  bool hasAbrirFechar() => _abrirFechar != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeCompleto = snapshotData['nome_completo'] as String?;
    _numeroCartao = snapshotData['numero_cartao'] as String?;
    _expiracaoMes = snapshotData['expiracao_mes'] as String?;
    _experacaoAno = snapshotData['experacao_ano'] as String?;
    _email = snapshotData['email'] as String?;
    _cpf = snapshotData['cpf'] as String?;
    _cep = snapshotData['cep'] as String?;
    _numeroCasa = snapshotData['numero_casa'] as String?;
    _complementoEndereco = snapshotData['complemento_endereco'] as String?;
    _celular = snapshotData['celular'] as String?;
    _bin = snapshotData['bin'] as String?;
    _selecionado = snapshotData['selecionado'] as bool?;
    _bandeira = snapshotData['bandeira'] as String?;
    _abrirFechar = snapshotData['abrir_fechar'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cartao')
          : FirebaseFirestore.instance.collectionGroup('cartao');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cartao').doc(id);

  static Stream<CartaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartaoRecord.fromSnapshot(s));

  static Future<CartaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartaoRecord.fromSnapshot(s));

  static CartaoRecord fromSnapshot(DocumentSnapshot snapshot) => CartaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartaoRecordData({
  String? nomeCompleto,
  String? numeroCartao,
  String? expiracaoMes,
  String? experacaoAno,
  String? email,
  String? cpf,
  String? cep,
  String? numeroCasa,
  String? complementoEndereco,
  String? celular,
  String? bin,
  bool? selecionado,
  String? bandeira,
  bool? abrirFechar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome_completo': nomeCompleto,
      'numero_cartao': numeroCartao,
      'expiracao_mes': expiracaoMes,
      'experacao_ano': experacaoAno,
      'email': email,
      'cpf': cpf,
      'cep': cep,
      'numero_casa': numeroCasa,
      'complemento_endereco': complementoEndereco,
      'celular': celular,
      'bin': bin,
      'selecionado': selecionado,
      'bandeira': bandeira,
      'abrir_fechar': abrirFechar,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartaoRecordDocumentEquality implements Equality<CartaoRecord> {
  const CartaoRecordDocumentEquality();

  @override
  bool equals(CartaoRecord? e1, CartaoRecord? e2) {
    return e1?.nomeCompleto == e2?.nomeCompleto &&
        e1?.numeroCartao == e2?.numeroCartao &&
        e1?.expiracaoMes == e2?.expiracaoMes &&
        e1?.experacaoAno == e2?.experacaoAno &&
        e1?.email == e2?.email &&
        e1?.cpf == e2?.cpf &&
        e1?.cep == e2?.cep &&
        e1?.numeroCasa == e2?.numeroCasa &&
        e1?.complementoEndereco == e2?.complementoEndereco &&
        e1?.celular == e2?.celular &&
        e1?.bin == e2?.bin &&
        e1?.selecionado == e2?.selecionado &&
        e1?.bandeira == e2?.bandeira &&
        e1?.abrirFechar == e2?.abrirFechar;
  }

  @override
  int hash(CartaoRecord? e) => const ListEquality().hash([
        e?.nomeCompleto,
        e?.numeroCartao,
        e?.expiracaoMes,
        e?.experacaoAno,
        e?.email,
        e?.cpf,
        e?.cep,
        e?.numeroCasa,
        e?.complementoEndereco,
        e?.celular,
        e?.bin,
        e?.selecionado,
        e?.bandeira,
        e?.abrirFechar
      ]);

  @override
  bool isValidKey(Object? o) => o is CartaoRecord;
}
