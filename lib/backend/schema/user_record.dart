import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "carteira" field.
  double? _carteira;
  double get carteira => _carteira ?? 0.0;
  bool hasCarteira() => _carteira != null;

  // "chave_afiliado" field.
  String? _chaveAfiliado;
  String get chaveAfiliado => _chaveAfiliado ?? '';
  bool hasChaveAfiliado() => _chaveAfiliado != null;

  // "sobrenome" field.
  String? _sobrenome;
  String get sobrenome => _sobrenome ?? '';
  bool hasSobrenome() => _sobrenome != null;

  // "idade" field.
  int? _idade;
  int get idade => _idade ?? 0;
  bool hasIdade() => _idade != null;

  // "CPF" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "ListCarrinho" field.
  List<double>? _listCarrinho;
  List<double> get listCarrinho => _listCarrinho ?? const [];
  bool hasListCarrinho() => _listCarrinho != null;

  // "valorTotalCompra" field.
  double? _valorTotalCompra;
  double get valorTotalCompra => _valorTotalCompra ?? 0.0;
  bool hasValorTotalCompra() => _valorTotalCompra != null;

  // "filtro_pedido" field.
  String? _filtroPedido;
  String get filtroPedido => _filtroPedido ?? '';
  bool hasFiltroPedido() => _filtroPedido != null;

  // "lojaRef" field.
  DocumentReference? _lojaRef;
  DocumentReference? get lojaRef => _lojaRef;
  bool hasLojaRef() => _lojaRef != null;

  // "endereco_completo" field.
  String? _enderecoCompleto;
  String get enderecoCompleto => _enderecoCompleto ?? '';
  bool hasEnderecoCompleto() => _enderecoCompleto != null;

  // "moedas" field.
  double? _moedas;
  double get moedas => _moedas ?? 0.0;
  bool hasMoedas() => _moedas != null;

  // "endereco_ref" field.
  DocumentReference? _enderecoRef;
  DocumentReference? get enderecoRef => _enderecoRef;
  bool hasEnderecoRef() => _enderecoRef != null;

  // "ID_asaas" field.
  String? _iDAsaas;
  String get iDAsaas => _iDAsaas ?? '';
  bool hasIDAsaas() => _iDAsaas != null;

  // "taxaProcessamento" field.
  String? _taxaProcessamento;
  String get taxaProcessamento => _taxaProcessamento ?? '';
  bool hasTaxaProcessamento() => _taxaProcessamento != null;

  // "historicoPesquisa" field.
  List<String>? _historicoPesquisa;
  List<String> get historicoPesquisa => _historicoPesquisa ?? const [];
  bool hasHistoricoPesquisa() => _historicoPesquisa != null;

  // "vistoRecente" field.
  List<String>? _vistoRecente;
  List<String> get vistoRecente => _vistoRecente ?? const [];
  bool hasVistoRecente() => _vistoRecente != null;

  // "favorito" field.
  List<String>? _favorito;
  List<String> get favorito => _favorito ?? const [];
  bool hasFavorito() => _favorito != null;

  // "contaGoogle" field.
  bool? _contaGoogle;
  bool get contaGoogle => _contaGoogle ?? false;
  bool hasContaGoogle() => _contaGoogle != null;

  // "chavePix" field.
  String? _chavePix;
  String get chavePix => _chavePix ?? '';
  bool hasChavePix() => _chavePix != null;

  // "tipoPix" field.
  String? _tipoPix;
  String get tipoPix => _tipoPix ?? '';
  bool hasTipoPix() => _tipoPix != null;

  // "banco" field.
  String? _banco;
  String get banco => _banco ?? '';
  bool hasBanco() => _banco != null;

  // "ganhouCupomPosLogin" field.
  bool? _ganhouCupomPosLogin;
  bool get ganhouCupomPosLogin => _ganhouCupomPosLogin ?? false;
  bool hasGanhouCupomPosLogin() => _ganhouCupomPosLogin != null;

  // "comprasHistoricoProdutos" field.
  List<String>? _comprasHistoricoProdutos;
  List<String> get comprasHistoricoProdutos =>
      _comprasHistoricoProdutos ?? const [];
  bool hasComprasHistoricoProdutos() => _comprasHistoricoProdutos != null;

  // "autorizadoTerLoja" field.
  bool? _autorizadoTerLoja;
  bool get autorizadoTerLoja => _autorizadoTerLoja ?? false;
  bool hasAutorizadoTerLoja() => _autorizadoTerLoja != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _endereco = snapshotData['endereco'] as String?;
    _carteira = castToType<double>(snapshotData['carteira']);
    _chaveAfiliado = snapshotData['chave_afiliado'] as String?;
    _sobrenome = snapshotData['sobrenome'] as String?;
    _idade = castToType<int>(snapshotData['idade']);
    _cpf = snapshotData['CPF'] as String?;
    _listCarrinho = getDataList(snapshotData['ListCarrinho']);
    _valorTotalCompra = castToType<double>(snapshotData['valorTotalCompra']);
    _filtroPedido = snapshotData['filtro_pedido'] as String?;
    _lojaRef = snapshotData['lojaRef'] as DocumentReference?;
    _enderecoCompleto = snapshotData['endereco_completo'] as String?;
    _moedas = castToType<double>(snapshotData['moedas']);
    _enderecoRef = snapshotData['endereco_ref'] as DocumentReference?;
    _iDAsaas = snapshotData['ID_asaas'] as String?;
    _taxaProcessamento = snapshotData['taxaProcessamento'] as String?;
    _historicoPesquisa = getDataList(snapshotData['historicoPesquisa']);
    _vistoRecente = getDataList(snapshotData['vistoRecente']);
    _favorito = getDataList(snapshotData['favorito']);
    _contaGoogle = snapshotData['contaGoogle'] as bool?;
    _chavePix = snapshotData['chavePix'] as String?;
    _tipoPix = snapshotData['tipoPix'] as String?;
    _banco = snapshotData['banco'] as String?;
    _ganhouCupomPosLogin = snapshotData['ganhouCupomPosLogin'] as bool?;
    _comprasHistoricoProdutos =
        getDataList(snapshotData['comprasHistoricoProdutos']);
    _autorizadoTerLoja = snapshotData['autorizadoTerLoja'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? endereco,
  double? carteira,
  String? chaveAfiliado,
  String? sobrenome,
  int? idade,
  String? cpf,
  double? valorTotalCompra,
  String? filtroPedido,
  DocumentReference? lojaRef,
  String? enderecoCompleto,
  double? moedas,
  DocumentReference? enderecoRef,
  String? iDAsaas,
  String? taxaProcessamento,
  bool? contaGoogle,
  String? chavePix,
  String? tipoPix,
  String? banco,
  bool? ganhouCupomPosLogin,
  bool? autorizadoTerLoja,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'endereco': endereco,
      'carteira': carteira,
      'chave_afiliado': chaveAfiliado,
      'sobrenome': sobrenome,
      'idade': idade,
      'CPF': cpf,
      'valorTotalCompra': valorTotalCompra,
      'filtro_pedido': filtroPedido,
      'lojaRef': lojaRef,
      'endereco_completo': enderecoCompleto,
      'moedas': moedas,
      'endereco_ref': enderecoRef,
      'ID_asaas': iDAsaas,
      'taxaProcessamento': taxaProcessamento,
      'contaGoogle': contaGoogle,
      'chavePix': chavePix,
      'tipoPix': tipoPix,
      'banco': banco,
      'ganhouCupomPosLogin': ganhouCupomPosLogin,
      'autorizadoTerLoja': autorizadoTerLoja,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.endereco == e2?.endereco &&
        e1?.carteira == e2?.carteira &&
        e1?.chaveAfiliado == e2?.chaveAfiliado &&
        e1?.sobrenome == e2?.sobrenome &&
        e1?.idade == e2?.idade &&
        e1?.cpf == e2?.cpf &&
        listEquality.equals(e1?.listCarrinho, e2?.listCarrinho) &&
        e1?.valorTotalCompra == e2?.valorTotalCompra &&
        e1?.filtroPedido == e2?.filtroPedido &&
        e1?.lojaRef == e2?.lojaRef &&
        e1?.enderecoCompleto == e2?.enderecoCompleto &&
        e1?.moedas == e2?.moedas &&
        e1?.enderecoRef == e2?.enderecoRef &&
        e1?.iDAsaas == e2?.iDAsaas &&
        e1?.taxaProcessamento == e2?.taxaProcessamento &&
        listEquality.equals(e1?.historicoPesquisa, e2?.historicoPesquisa) &&
        listEquality.equals(e1?.vistoRecente, e2?.vistoRecente) &&
        listEquality.equals(e1?.favorito, e2?.favorito) &&
        e1?.contaGoogle == e2?.contaGoogle &&
        e1?.chavePix == e2?.chavePix &&
        e1?.tipoPix == e2?.tipoPix &&
        e1?.banco == e2?.banco &&
        e1?.ganhouCupomPosLogin == e2?.ganhouCupomPosLogin &&
        listEquality.equals(
            e1?.comprasHistoricoProdutos, e2?.comprasHistoricoProdutos) &&
        e1?.autorizadoTerLoja == e2?.autorizadoTerLoja;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.endereco,
        e?.carteira,
        e?.chaveAfiliado,
        e?.sobrenome,
        e?.idade,
        e?.cpf,
        e?.listCarrinho,
        e?.valorTotalCompra,
        e?.filtroPedido,
        e?.lojaRef,
        e?.enderecoCompleto,
        e?.moedas,
        e?.enderecoRef,
        e?.iDAsaas,
        e?.taxaProcessamento,
        e?.historicoPesquisa,
        e?.vistoRecente,
        e?.favorito,
        e?.contaGoogle,
        e?.chavePix,
        e?.tipoPix,
        e?.banco,
        e?.ganhouCupomPosLogin,
        e?.comprasHistoricoProdutos,
        e?.autorizadoTerLoja
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
