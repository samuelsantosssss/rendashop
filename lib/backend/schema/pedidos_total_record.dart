import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosTotalRecord extends FirestoreRecord {
  PedidosTotalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "produtoRef" field.
  DocumentReference? _produtoRef;
  DocumentReference? get produtoRef => _produtoRef;
  bool hasProdutoRef() => _produtoRef != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "endereco_completo" field.
  String? _enderecoCompleto;
  String get enderecoCompleto => _enderecoCompleto ?? '';
  bool hasEnderecoCompleto() => _enderecoCompleto != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "quantidade" field.
  double? _quantidade;
  double get quantidade => _quantidade ?? 0.0;
  bool hasQuantidade() => _quantidade != null;

  // "lojaRef" field.
  DocumentReference? _lojaRef;
  DocumentReference? get lojaRef => _lojaRef;
  bool hasLojaRef() => _lojaRef != null;

  // "valorUnitario" field.
  double? _valorUnitario;
  double get valorUnitario => _valorUnitario ?? 0.0;
  bool hasValorUnitario() => _valorUnitario != null;

  // "frete" field.
  double? _frete;
  double get frete => _frete ?? 0.0;
  bool hasFrete() => _frete != null;

  // "variacao" field.
  String? _variacao;
  String get variacao => _variacao ?? '';
  bool hasVariacao() => _variacao != null;

  // "id_pedido" field.
  String? _idPedido;
  String get idPedido => _idPedido ?? '';
  bool hasIdPedido() => _idPedido != null;

  // "avaliado" field.
  bool? _avaliado;
  bool get avaliado => _avaliado ?? false;
  bool hasAvaliado() => _avaliado != null;

  // "data_pedido" field.
  DateTime? _dataPedido;
  DateTime? get dataPedido => _dataPedido;
  bool hasDataPedido() => _dataPedido != null;

  // "preco_antes" field.
  double? _precoAntes;
  double get precoAntes => _precoAntes ?? 0.0;
  bool hasPrecoAntes() => _precoAntes != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  // "comissao_lojista" field.
  double? _comissaoLojista;
  double get comissaoLojista => _comissaoLojista ?? 0.0;
  bool hasComissaoLojista() => _comissaoLojista != null;

  // "comissao_afiliado" field.
  double? _comissaoAfiliado;
  double get comissaoAfiliado => _comissaoAfiliado ?? 0.0;
  bool hasComissaoAfiliado() => _comissaoAfiliado != null;

  // "comissao_RendaShop" field.
  double? _comissaoRendaShop;
  double get comissaoRendaShop => _comissaoRendaShop ?? 0.0;
  bool hasComissaoRendaShop() => _comissaoRendaShop != null;

  // "id_afiliado" field.
  String? _idAfiliado;
  String get idAfiliado => _idAfiliado ?? '';
  bool hasIdAfiliado() => _idAfiliado != null;

  // "CPF_cliente" field.
  String? _cPFCliente;
  String get cPFCliente => _cPFCliente ?? '';
  bool hasCPFCliente() => _cPFCliente != null;

  // "endereco_ref" field.
  DocumentReference? _enderecoRef;
  DocumentReference? get enderecoRef => _enderecoRef;
  bool hasEnderecoRef() => _enderecoRef != null;

  // "totalPedido" field.
  double? _totalPedido;
  double get totalPedido => _totalPedido ?? 0.0;
  bool hasTotalPedido() => _totalPedido != null;

  // "totalPedidoSemFrete" field.
  double? _totalPedidoSemFrete;
  double get totalPedidoSemFrete => _totalPedidoSemFrete ?? 0.0;
  bool hasTotalPedidoSemFrete() => _totalPedidoSemFrete != null;

  // "data_entregue" field.
  DateTime? _dataEntregue;
  DateTime? get dataEntregue => _dataEntregue;
  bool hasDataEntregue() => _dataEntregue != null;

  // "codigoRastreio" field.
  String? _codigoRastreio;
  String get codigoRastreio => _codigoRastreio ?? '';
  bool hasCodigoRastreio() => _codigoRastreio != null;

  // "forma_pagamento" field.
  String? _formaPagamento;
  String get formaPagamento => _formaPagamento ?? '';
  bool hasFormaPagamento() => _formaPagamento != null;

  // "ID_asaas" field.
  String? _iDAsaas;
  String get iDAsaas => _iDAsaas ?? '';
  bool hasIDAsaas() => _iDAsaas != null;

  // "status_pagamento" field.
  String? _statusPagamento;
  String get statusPagamento => _statusPagamento ?? '';
  bool hasStatusPagamento() => _statusPagamento != null;

  // "chavePix" field.
  String? _chavePix;
  String get chavePix => _chavePix ?? '';
  bool hasChavePix() => _chavePix != null;

  // "idPix" field.
  int? _idPix;
  int get idPix => _idPix ?? 0;
  bool hasIdPix() => _idPix != null;

  // "time24h" field.
  DateTime? _time24h;
  DateTime? get time24h => _time24h;
  bool hasTime24h() => _time24h != null;

  // "pedidos_list" field.
  List<DocumentReference>? _pedidosList;
  List<DocumentReference> get pedidosList => _pedidosList ?? const [];
  bool hasPedidosList() => _pedidosList != null;

  // "totalGeralPedidos" field.
  String? _totalGeralPedidos;
  String get totalGeralPedidos => _totalGeralPedidos ?? '';
  bool hasTotalGeralPedidos() => _totalGeralPedidos != null;

  // "taxaProcessamento" field.
  double? _taxaProcessamento;
  double get taxaProcessamento => _taxaProcessamento ?? 0.0;
  bool hasTaxaProcessamento() => _taxaProcessamento != null;

  // "Reembolso_feito" field.
  bool? _reembolsoFeito;
  bool get reembolsoFeito => _reembolsoFeito ?? false;
  bool hasReembolsoFeito() => _reembolsoFeito != null;

  // "cancelado_logista" field.
  bool? _canceladoLogista;
  bool get canceladoLogista => _canceladoLogista ?? false;
  bool hasCanceladoLogista() => _canceladoLogista != null;

  // "moedas" field.
  double? _moedas;
  double get moedas => _moedas ?? 0.0;
  bool hasMoedas() => _moedas != null;

  // "icms" field.
  double? _icms;
  double get icms => _icms ?? 0.0;
  bool hasIcms() => _icms != null;

  // "impostoImportacao" field.
  double? _impostoImportacao;
  double get impostoImportacao => _impostoImportacao ?? 0.0;
  bool hasImpostoImportacao() => _impostoImportacao != null;

  // "afiliadoRef" field.
  DocumentReference? _afiliadoRef;
  DocumentReference? get afiliadoRef => _afiliadoRef;
  bool hasAfiliadoRef() => _afiliadoRef != null;

  // "afiliadoSacouDinheiro" field.
  bool? _afiliadoSacouDinheiro;
  bool get afiliadoSacouDinheiro => _afiliadoSacouDinheiro ?? false;
  bool hasAfiliadoSacouDinheiro() => _afiliadoSacouDinheiro != null;

  // "afiliadoLiberarSaque" field.
  bool? _afiliadoLiberarSaque;
  bool get afiliadoLiberarSaque => _afiliadoLiberarSaque ?? false;
  bool hasAfiliadoLiberarSaque() => _afiliadoLiberarSaque != null;

  // "produtoExcluido" field.
  bool? _produtoExcluido;
  bool get produtoExcluido => _produtoExcluido ?? false;
  bool hasProdutoExcluido() => _produtoExcluido != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _produtoRef = snapshotData['produtoRef'] as DocumentReference?;
    _nome = snapshotData['nome'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _enderecoCompleto = snapshotData['endereco_completo'] as String?;
    _status = snapshotData['status'] as String?;
    _quantidade = castToType<double>(snapshotData['quantidade']);
    _lojaRef = snapshotData['lojaRef'] as DocumentReference?;
    _valorUnitario = castToType<double>(snapshotData['valorUnitario']);
    _frete = castToType<double>(snapshotData['frete']);
    _variacao = snapshotData['variacao'] as String?;
    _idPedido = snapshotData['id_pedido'] as String?;
    _avaliado = snapshotData['avaliado'] as bool?;
    _dataPedido = snapshotData['data_pedido'] as DateTime?;
    _precoAntes = castToType<double>(snapshotData['preco_antes']);
    _preco = castToType<double>(snapshotData['preco']);
    _comissaoLojista = castToType<double>(snapshotData['comissao_lojista']);
    _comissaoAfiliado = castToType<double>(snapshotData['comissao_afiliado']);
    _comissaoRendaShop = castToType<double>(snapshotData['comissao_RendaShop']);
    _idAfiliado = snapshotData['id_afiliado'] as String?;
    _cPFCliente = snapshotData['CPF_cliente'] as String?;
    _enderecoRef = snapshotData['endereco_ref'] as DocumentReference?;
    _totalPedido = castToType<double>(snapshotData['totalPedido']);
    _totalPedidoSemFrete =
        castToType<double>(snapshotData['totalPedidoSemFrete']);
    _dataEntregue = snapshotData['data_entregue'] as DateTime?;
    _codigoRastreio = snapshotData['codigoRastreio'] as String?;
    _formaPagamento = snapshotData['forma_pagamento'] as String?;
    _iDAsaas = snapshotData['ID_asaas'] as String?;
    _statusPagamento = snapshotData['status_pagamento'] as String?;
    _chavePix = snapshotData['chavePix'] as String?;
    _idPix = castToType<int>(snapshotData['idPix']);
    _time24h = snapshotData['time24h'] as DateTime?;
    _pedidosList = getDataList(snapshotData['pedidos_list']);
    _totalGeralPedidos = snapshotData['totalGeralPedidos'] as String?;
    _taxaProcessamento = castToType<double>(snapshotData['taxaProcessamento']);
    _reembolsoFeito = snapshotData['Reembolso_feito'] as bool?;
    _canceladoLogista = snapshotData['cancelado_logista'] as bool?;
    _moedas = castToType<double>(snapshotData['moedas']);
    _icms = castToType<double>(snapshotData['icms']);
    _impostoImportacao = castToType<double>(snapshotData['impostoImportacao']);
    _afiliadoRef = snapshotData['afiliadoRef'] as DocumentReference?;
    _afiliadoSacouDinheiro = snapshotData['afiliadoSacouDinheiro'] as bool?;
    _afiliadoLiberarSaque = snapshotData['afiliadoLiberarSaque'] as bool?;
    _produtoExcluido = snapshotData['produtoExcluido'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidos_total');

  static Stream<PedidosTotalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosTotalRecord.fromSnapshot(s));

  static Future<PedidosTotalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosTotalRecord.fromSnapshot(s));

  static PedidosTotalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosTotalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosTotalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosTotalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosTotalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosTotalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosTotalRecordData({
  DocumentReference? userRef,
  DocumentReference? produtoRef,
  String? nome,
  String? imagem,
  String? enderecoCompleto,
  String? status,
  double? quantidade,
  DocumentReference? lojaRef,
  double? valorUnitario,
  double? frete,
  String? variacao,
  String? idPedido,
  bool? avaliado,
  DateTime? dataPedido,
  double? precoAntes,
  double? preco,
  double? comissaoLojista,
  double? comissaoAfiliado,
  double? comissaoRendaShop,
  String? idAfiliado,
  String? cPFCliente,
  DocumentReference? enderecoRef,
  double? totalPedido,
  double? totalPedidoSemFrete,
  DateTime? dataEntregue,
  String? codigoRastreio,
  String? formaPagamento,
  String? iDAsaas,
  String? statusPagamento,
  String? chavePix,
  int? idPix,
  DateTime? time24h,
  String? totalGeralPedidos,
  double? taxaProcessamento,
  bool? reembolsoFeito,
  bool? canceladoLogista,
  double? moedas,
  double? icms,
  double? impostoImportacao,
  DocumentReference? afiliadoRef,
  bool? afiliadoSacouDinheiro,
  bool? afiliadoLiberarSaque,
  bool? produtoExcluido,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'produtoRef': produtoRef,
      'nome': nome,
      'imagem': imagem,
      'endereco_completo': enderecoCompleto,
      'status': status,
      'quantidade': quantidade,
      'lojaRef': lojaRef,
      'valorUnitario': valorUnitario,
      'frete': frete,
      'variacao': variacao,
      'id_pedido': idPedido,
      'avaliado': avaliado,
      'data_pedido': dataPedido,
      'preco_antes': precoAntes,
      'preco': preco,
      'comissao_lojista': comissaoLojista,
      'comissao_afiliado': comissaoAfiliado,
      'comissao_RendaShop': comissaoRendaShop,
      'id_afiliado': idAfiliado,
      'CPF_cliente': cPFCliente,
      'endereco_ref': enderecoRef,
      'totalPedido': totalPedido,
      'totalPedidoSemFrete': totalPedidoSemFrete,
      'data_entregue': dataEntregue,
      'codigoRastreio': codigoRastreio,
      'forma_pagamento': formaPagamento,
      'ID_asaas': iDAsaas,
      'status_pagamento': statusPagamento,
      'chavePix': chavePix,
      'idPix': idPix,
      'time24h': time24h,
      'totalGeralPedidos': totalGeralPedidos,
      'taxaProcessamento': taxaProcessamento,
      'Reembolso_feito': reembolsoFeito,
      'cancelado_logista': canceladoLogista,
      'moedas': moedas,
      'icms': icms,
      'impostoImportacao': impostoImportacao,
      'afiliadoRef': afiliadoRef,
      'afiliadoSacouDinheiro': afiliadoSacouDinheiro,
      'afiliadoLiberarSaque': afiliadoLiberarSaque,
      'produtoExcluido': produtoExcluido,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosTotalRecordDocumentEquality
    implements Equality<PedidosTotalRecord> {
  const PedidosTotalRecordDocumentEquality();

  @override
  bool equals(PedidosTotalRecord? e1, PedidosTotalRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.produtoRef == e2?.produtoRef &&
        e1?.nome == e2?.nome &&
        e1?.imagem == e2?.imagem &&
        e1?.enderecoCompleto == e2?.enderecoCompleto &&
        e1?.status == e2?.status &&
        e1?.quantidade == e2?.quantidade &&
        e1?.lojaRef == e2?.lojaRef &&
        e1?.valorUnitario == e2?.valorUnitario &&
        e1?.frete == e2?.frete &&
        e1?.variacao == e2?.variacao &&
        e1?.idPedido == e2?.idPedido &&
        e1?.avaliado == e2?.avaliado &&
        e1?.dataPedido == e2?.dataPedido &&
        e1?.precoAntes == e2?.precoAntes &&
        e1?.preco == e2?.preco &&
        e1?.comissaoLojista == e2?.comissaoLojista &&
        e1?.comissaoAfiliado == e2?.comissaoAfiliado &&
        e1?.comissaoRendaShop == e2?.comissaoRendaShop &&
        e1?.idAfiliado == e2?.idAfiliado &&
        e1?.cPFCliente == e2?.cPFCliente &&
        e1?.enderecoRef == e2?.enderecoRef &&
        e1?.totalPedido == e2?.totalPedido &&
        e1?.totalPedidoSemFrete == e2?.totalPedidoSemFrete &&
        e1?.dataEntregue == e2?.dataEntregue &&
        e1?.codigoRastreio == e2?.codigoRastreio &&
        e1?.formaPagamento == e2?.formaPagamento &&
        e1?.iDAsaas == e2?.iDAsaas &&
        e1?.statusPagamento == e2?.statusPagamento &&
        e1?.chavePix == e2?.chavePix &&
        e1?.idPix == e2?.idPix &&
        e1?.time24h == e2?.time24h &&
        listEquality.equals(e1?.pedidosList, e2?.pedidosList) &&
        e1?.totalGeralPedidos == e2?.totalGeralPedidos &&
        e1?.taxaProcessamento == e2?.taxaProcessamento &&
        e1?.reembolsoFeito == e2?.reembolsoFeito &&
        e1?.canceladoLogista == e2?.canceladoLogista &&
        e1?.moedas == e2?.moedas &&
        e1?.icms == e2?.icms &&
        e1?.impostoImportacao == e2?.impostoImportacao &&
        e1?.afiliadoRef == e2?.afiliadoRef &&
        e1?.afiliadoSacouDinheiro == e2?.afiliadoSacouDinheiro &&
        e1?.afiliadoLiberarSaque == e2?.afiliadoLiberarSaque &&
        e1?.produtoExcluido == e2?.produtoExcluido;
  }

  @override
  int hash(PedidosTotalRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.produtoRef,
        e?.nome,
        e?.imagem,
        e?.enderecoCompleto,
        e?.status,
        e?.quantidade,
        e?.lojaRef,
        e?.valorUnitario,
        e?.frete,
        e?.variacao,
        e?.idPedido,
        e?.avaliado,
        e?.dataPedido,
        e?.precoAntes,
        e?.preco,
        e?.comissaoLojista,
        e?.comissaoAfiliado,
        e?.comissaoRendaShop,
        e?.idAfiliado,
        e?.cPFCliente,
        e?.enderecoRef,
        e?.totalPedido,
        e?.totalPedidoSemFrete,
        e?.dataEntregue,
        e?.codigoRastreio,
        e?.formaPagamento,
        e?.iDAsaas,
        e?.statusPagamento,
        e?.chavePix,
        e?.idPix,
        e?.time24h,
        e?.pedidosList,
        e?.totalGeralPedidos,
        e?.taxaProcessamento,
        e?.reembolsoFeito,
        e?.canceladoLogista,
        e?.moedas,
        e?.icms,
        e?.impostoImportacao,
        e?.afiliadoRef,
        e?.afiliadoSacouDinheiro,
        e?.afiliadoLiberarSaque,
        e?.produtoExcluido
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidosTotalRecord;
}
