import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'query_produto_model.dart';
export 'query_produto_model.dart';

class QueryProdutoWidget extends StatefulWidget {
  const QueryProdutoWidget({
    super.key,
    this.produtoRef,
  });

  final DocumentReference? produtoRef;

  @override
  State<QueryProdutoWidget> createState() => _QueryProdutoWidgetState();
}

class _QueryProdutoWidgetState extends State<QueryProdutoWidget> {
  late QueryProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QueryProdutoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<VarianteRecord>>(
      stream: queryVarianteRecord(
        parent: widget.produtoRef,
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 26.0,
              height: 26.0,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 26.0,
              ),
            ),
          );
        }
        List<VarianteRecord> containerVarianteRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerVarianteRecord = containerVarianteRecordList.isNotEmpty
            ? containerVarianteRecordList.first
            : null;

        return Container(
          decoration: BoxDecoration(),
        );
      },
    );
  }
}
