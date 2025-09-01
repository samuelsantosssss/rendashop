import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'deletar_favorito_model.dart';
export 'deletar_favorito_model.dart';

class DeletarFavoritoWidget extends StatefulWidget {
  const DeletarFavoritoWidget({
    super.key,
    required this.idFavorito,
  });

  final String? idFavorito;

  @override
  State<DeletarFavoritoWidget> createState() => _DeletarFavoritoWidgetState();
}

class _DeletarFavoritoWidgetState extends State<DeletarFavoritoWidget> {
  late DeletarFavoritoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletarFavoritoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.repsotaa = await queryProdutoRecordOnce(
        queryBuilder: (produtoRecord) => produtoRecord.where(
          'produtoRef',
          isEqualTo: functions.stringEmDocRef(widget.idFavorito!),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.repsotaa?.reference != null) {
        return;
      }

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'favorito': FieldValue.arrayRemove([widget.idFavorito]),
          },
        ),
      });
      return;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: 1.0,
      decoration: BoxDecoration(),
    );
  }
}
