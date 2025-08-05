import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LojasRecord extends FirestoreRecord {
  LojasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fotoperfil" field.
  String? _fotoperfil;
  String get fotoperfil => _fotoperfil ?? '';
  bool hasFotoperfil() => _fotoperfil != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "produtos_vendidos" field.
  int? _produtosVendidos;
  int get produtosVendidos => _produtosVendidos ?? 0;
  bool hasProdutosVendidos() => _produtosVendidos != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "seguidores" field.
  List<DocumentReference>? _seguidores;
  List<DocumentReference> get seguidores => _seguidores ?? const [];
  bool hasSeguidores() => _seguidores != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "avaliacao" field.
  double? _avaliacao;
  double get avaliacao => _avaliacao ?? 0.0;
  bool hasAvaliacao() => _avaliacao != null;

  // "produtos_total" field.
  int? _produtosTotal;
  int get produtosTotal => _produtosTotal ?? 0;
  bool hasProdutosTotal() => _produtosTotal != null;

  void _initializeFields() {
    _fotoperfil = snapshotData['fotoperfil'] as String?;
    _nome = snapshotData['nome'] as String?;
    _url = snapshotData['url'] as String?;
    _produtosVendidos = castToType<int>(snapshotData['produtos_vendidos']);
    _descricao = snapshotData['descricao'] as String?;
    _seguidores = getDataList(snapshotData['seguidores']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _avaliacao = castToType<double>(snapshotData['avaliacao']);
    _produtosTotal = castToType<int>(snapshotData['produtos_total']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lojas');

  static Stream<LojasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LojasRecord.fromSnapshot(s));

  static Future<LojasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LojasRecord.fromSnapshot(s));

  static LojasRecord fromSnapshot(DocumentSnapshot snapshot) => LojasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LojasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LojasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LojasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LojasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLojasRecordData({
  String? fotoperfil,
  String? nome,
  String? url,
  int? produtosVendidos,
  String? descricao,
  DocumentReference? userRef,
  double? avaliacao,
  int? produtosTotal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fotoperfil': fotoperfil,
      'nome': nome,
      'url': url,
      'produtos_vendidos': produtosVendidos,
      'descricao': descricao,
      'userRef': userRef,
      'avaliacao': avaliacao,
      'produtos_total': produtosTotal,
    }.withoutNulls,
  );

  return firestoreData;
}

class LojasRecordDocumentEquality implements Equality<LojasRecord> {
  const LojasRecordDocumentEquality();

  @override
  bool equals(LojasRecord? e1, LojasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fotoperfil == e2?.fotoperfil &&
        e1?.nome == e2?.nome &&
        e1?.url == e2?.url &&
        e1?.produtosVendidos == e2?.produtosVendidos &&
        e1?.descricao == e2?.descricao &&
        listEquality.equals(e1?.seguidores, e2?.seguidores) &&
        e1?.userRef == e2?.userRef &&
        e1?.avaliacao == e2?.avaliacao &&
        e1?.produtosTotal == e2?.produtosTotal;
  }

  @override
  int hash(LojasRecord? e) => const ListEquality().hash([
        e?.fotoperfil,
        e?.nome,
        e?.url,
        e?.produtosVendidos,
        e?.descricao,
        e?.seguidores,
        e?.userRef,
        e?.avaliacao,
        e?.produtosTotal
      ]);

  @override
  bool isValidKey(Object? o) => o is LojasRecord;
}
