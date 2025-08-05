import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VarianteRecord extends FirestoreRecord {
  VarianteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Revenda" field.
  double? _revenda;
  double get revenda => _revenda ?? 0.0;
  bool hasRevenda() => _revenda != null;

  // "estoque" field.
  int? _estoque;
  int get estoque => _estoque ?? 0;
  bool hasEstoque() => _estoque != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "titulo1" field.
  String? _titulo1;
  String get titulo1 => _titulo1 ?? '';
  bool hasTitulo1() => _titulo1 != null;

  // "titulo2" field.
  String? _titulo2;
  String get titulo2 => _titulo2 ?? '';
  bool hasTitulo2() => _titulo2 != null;

  // "produtoRef" field.
  DocumentReference? _produtoRef;
  DocumentReference? get produtoRef => _produtoRef;
  bool hasProdutoRef() => _produtoRef != null;

  // "opcao_titulo1" field.
  String? _opcaoTitulo1;
  String get opcaoTitulo1 => _opcaoTitulo1 ?? '';
  bool hasOpcaoTitulo1() => _opcaoTitulo1 != null;

  // "opcao_titulo2" field.
  String? _opcaoTitulo2;
  String get opcaoTitulo2 => _opcaoTitulo2 ?? '';
  bool hasOpcaoTitulo2() => _opcaoTitulo2 != null;

  // "promoRelampagoAtivo" field.
  bool? _promoRelampagoAtivo;
  bool get promoRelampagoAtivo => _promoRelampagoAtivo ?? false;
  bool hasPromoRelampagoAtivo() => _promoRelampagoAtivo != null;

  // "promoRelampagoValor" field.
  double? _promoRelampagoValor;
  double get promoRelampagoValor => _promoRelampagoValor ?? 0.0;
  bool hasPromoRelampagoValor() => _promoRelampagoValor != null;

  // "promoRelampagoLimiteCompra" field.
  int? _promoRelampagoLimiteCompra;
  int get promoRelampagoLimiteCompra => _promoRelampagoLimiteCompra ?? 0;
  bool hasPromoRelampagoLimiteCompra() => _promoRelampagoLimiteCompra != null;

  // "promoRelampagoEstoque" field.
  int? _promoRelampagoEstoque;
  int get promoRelampagoEstoque => _promoRelampagoEstoque ?? 0;
  bool hasPromoRelampagoEstoque() => _promoRelampagoEstoque != null;

  // "promoRelampagoDiaHora" field.
  String? _promoRelampagoDiaHora;
  String get promoRelampagoDiaHora => _promoRelampagoDiaHora ?? '';
  bool hasPromoRelampagoDiaHora() => _promoRelampagoDiaHora != null;

  // "promoRelampagoAgendado" field.
  bool? _promoRelampagoAgendado;
  bool get promoRelampagoAgendado => _promoRelampagoAgendado ?? false;
  bool hasPromoRelampagoAgendado() => _promoRelampagoAgendado != null;

  // "Preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _revenda = castToType<double>(snapshotData['Revenda']);
    _estoque = castToType<int>(snapshotData['estoque']);
    _foto = snapshotData['foto'] as String?;
    _titulo1 = snapshotData['titulo1'] as String?;
    _titulo2 = snapshotData['titulo2'] as String?;
    _produtoRef = snapshotData['produtoRef'] as DocumentReference?;
    _opcaoTitulo1 = snapshotData['opcao_titulo1'] as String?;
    _opcaoTitulo2 = snapshotData['opcao_titulo2'] as String?;
    _promoRelampagoAtivo = snapshotData['promoRelampagoAtivo'] as bool?;
    _promoRelampagoValor =
        castToType<double>(snapshotData['promoRelampagoValor']);
    _promoRelampagoLimiteCompra =
        castToType<int>(snapshotData['promoRelampagoLimiteCompra']);
    _promoRelampagoEstoque =
        castToType<int>(snapshotData['promoRelampagoEstoque']);
    _promoRelampagoDiaHora = snapshotData['promoRelampagoDiaHora'] as String?;
    _promoRelampagoAgendado = snapshotData['promoRelampagoAgendado'] as bool?;
    _preco = castToType<double>(snapshotData['Preco']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('variante')
          : FirebaseFirestore.instance.collectionGroup('variante');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('variante').doc(id);

  static Stream<VarianteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VarianteRecord.fromSnapshot(s));

  static Future<VarianteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VarianteRecord.fromSnapshot(s));

  static VarianteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VarianteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VarianteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VarianteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VarianteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VarianteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVarianteRecordData({
  double? revenda,
  int? estoque,
  String? foto,
  String? titulo1,
  String? titulo2,
  DocumentReference? produtoRef,
  String? opcaoTitulo1,
  String? opcaoTitulo2,
  bool? promoRelampagoAtivo,
  double? promoRelampagoValor,
  int? promoRelampagoLimiteCompra,
  int? promoRelampagoEstoque,
  String? promoRelampagoDiaHora,
  bool? promoRelampagoAgendado,
  double? preco,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Revenda': revenda,
      'estoque': estoque,
      'foto': foto,
      'titulo1': titulo1,
      'titulo2': titulo2,
      'produtoRef': produtoRef,
      'opcao_titulo1': opcaoTitulo1,
      'opcao_titulo2': opcaoTitulo2,
      'promoRelampagoAtivo': promoRelampagoAtivo,
      'promoRelampagoValor': promoRelampagoValor,
      'promoRelampagoLimiteCompra': promoRelampagoLimiteCompra,
      'promoRelampagoEstoque': promoRelampagoEstoque,
      'promoRelampagoDiaHora': promoRelampagoDiaHora,
      'promoRelampagoAgendado': promoRelampagoAgendado,
      'Preco': preco,
    }.withoutNulls,
  );

  return firestoreData;
}

class VarianteRecordDocumentEquality implements Equality<VarianteRecord> {
  const VarianteRecordDocumentEquality();

  @override
  bool equals(VarianteRecord? e1, VarianteRecord? e2) {
    return e1?.revenda == e2?.revenda &&
        e1?.estoque == e2?.estoque &&
        e1?.foto == e2?.foto &&
        e1?.titulo1 == e2?.titulo1 &&
        e1?.titulo2 == e2?.titulo2 &&
        e1?.produtoRef == e2?.produtoRef &&
        e1?.opcaoTitulo1 == e2?.opcaoTitulo1 &&
        e1?.opcaoTitulo2 == e2?.opcaoTitulo2 &&
        e1?.promoRelampagoAtivo == e2?.promoRelampagoAtivo &&
        e1?.promoRelampagoValor == e2?.promoRelampagoValor &&
        e1?.promoRelampagoLimiteCompra == e2?.promoRelampagoLimiteCompra &&
        e1?.promoRelampagoEstoque == e2?.promoRelampagoEstoque &&
        e1?.promoRelampagoDiaHora == e2?.promoRelampagoDiaHora &&
        e1?.promoRelampagoAgendado == e2?.promoRelampagoAgendado &&
        e1?.preco == e2?.preco;
  }

  @override
  int hash(VarianteRecord? e) => const ListEquality().hash([
        e?.revenda,
        e?.estoque,
        e?.foto,
        e?.titulo1,
        e?.titulo2,
        e?.produtoRef,
        e?.opcaoTitulo1,
        e?.opcaoTitulo2,
        e?.promoRelampagoAtivo,
        e?.promoRelampagoValor,
        e?.promoRelampagoLimiteCompra,
        e?.promoRelampagoEstoque,
        e?.promoRelampagoDiaHora,
        e?.promoRelampagoAgendado,
        e?.preco
      ]);

  @override
  bool isValidKey(Object? o) => o is VarianteRecord;
}
