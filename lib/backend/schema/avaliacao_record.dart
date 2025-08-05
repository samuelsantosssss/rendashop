import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvaliacaoRecord extends FirestoreRecord {
  AvaliacaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "nota" field.
  int? _nota;
  int get nota => _nota ?? 0;
  bool hasNota() => _nota != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "imageList" field.
  List<String>? _imageList;
  List<String> get imageList => _imageList ?? const [];
  bool hasImageList() => _imageList != null;

  // "lojaRef" field.
  DocumentReference? _lojaRef;
  DocumentReference? get lojaRef => _lojaRef;
  bool hasLojaRef() => _lojaRef != null;

  // "nome_user" field.
  String? _nomeUser;
  String get nomeUser => _nomeUser ?? '';
  bool hasNomeUser() => _nomeUser != null;

  // "foto_user" field.
  String? _fotoUser;
  String get fotoUser => _fotoUser ?? '';
  bool hasFotoUser() => _fotoUser != null;

  // "variacao" field.
  String? _variacao;
  String get variacao => _variacao ?? '';
  bool hasVariacao() => _variacao != null;

  // "like" field.
  List<DocumentReference>? _like;
  List<DocumentReference> get like => _like ?? const [];
  bool hasLike() => _like != null;

  // "servico_entregador" field.
  int? _servicoEntregador;
  int get servicoEntregador => _servicoEntregador ?? 0;
  bool hasServicoEntregador() => _servicoEntregador != null;

  // "tesrte" field.
  double? _tesrte;
  double get tesrte => _tesrte ?? 0.0;
  bool hasTesrte() => _tesrte != null;

  // "videoSet" field.
  int? _videoSet;
  int get videoSet => _videoSet ?? 0;
  bool hasVideoSet() => _videoSet != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _comentario = snapshotData['comentario'] as String?;
    _nota = castToType<int>(snapshotData['nota']);
    _data = snapshotData['data'] as DateTime?;
    _video = snapshotData['video'] as String?;
    _imageList = getDataList(snapshotData['imageList']);
    _lojaRef = snapshotData['lojaRef'] as DocumentReference?;
    _nomeUser = snapshotData['nome_user'] as String?;
    _fotoUser = snapshotData['foto_user'] as String?;
    _variacao = snapshotData['variacao'] as String?;
    _like = getDataList(snapshotData['like']);
    _servicoEntregador = castToType<int>(snapshotData['servico_entregador']);
    _tesrte = castToType<double>(snapshotData['tesrte']);
    _videoSet = castToType<int>(snapshotData['videoSet']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('avaliacao')
          : FirebaseFirestore.instance.collectionGroup('avaliacao');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('avaliacao').doc(id);

  static Stream<AvaliacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvaliacaoRecord.fromSnapshot(s));

  static Future<AvaliacaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvaliacaoRecord.fromSnapshot(s));

  static AvaliacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvaliacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvaliacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvaliacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvaliacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvaliacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvaliacaoRecordData({
  DocumentReference? userRef,
  String? comentario,
  int? nota,
  DateTime? data,
  String? video,
  DocumentReference? lojaRef,
  String? nomeUser,
  String? fotoUser,
  String? variacao,
  int? servicoEntregador,
  double? tesrte,
  int? videoSet,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'comentario': comentario,
      'nota': nota,
      'data': data,
      'video': video,
      'lojaRef': lojaRef,
      'nome_user': nomeUser,
      'foto_user': fotoUser,
      'variacao': variacao,
      'servico_entregador': servicoEntregador,
      'tesrte': tesrte,
      'videoSet': videoSet,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvaliacaoRecordDocumentEquality implements Equality<AvaliacaoRecord> {
  const AvaliacaoRecordDocumentEquality();

  @override
  bool equals(AvaliacaoRecord? e1, AvaliacaoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.comentario == e2?.comentario &&
        e1?.nota == e2?.nota &&
        e1?.data == e2?.data &&
        e1?.video == e2?.video &&
        listEquality.equals(e1?.imageList, e2?.imageList) &&
        e1?.lojaRef == e2?.lojaRef &&
        e1?.nomeUser == e2?.nomeUser &&
        e1?.fotoUser == e2?.fotoUser &&
        e1?.variacao == e2?.variacao &&
        listEquality.equals(e1?.like, e2?.like) &&
        e1?.servicoEntregador == e2?.servicoEntregador &&
        e1?.tesrte == e2?.tesrte &&
        e1?.videoSet == e2?.videoSet;
  }

  @override
  int hash(AvaliacaoRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.comentario,
        e?.nota,
        e?.data,
        e?.video,
        e?.imageList,
        e?.lojaRef,
        e?.nomeUser,
        e?.fotoUser,
        e?.variacao,
        e?.like,
        e?.servicoEntregador,
        e?.tesrte,
        e?.videoSet
      ]);

  @override
  bool isValidKey(Object? o) => o is AvaliacaoRecord;
}
