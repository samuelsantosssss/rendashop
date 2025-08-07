import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'updata_promo_home_model.dart';
export 'updata_promo_home_model.dart';

class UpdataPromoHomeWidget extends StatefulWidget {
  const UpdataPromoHomeWidget({
    super.key,
    this.docList,
  });

  final List<ProdutoRecord>? docList;

  @override
  State<UpdataPromoHomeWidget> createState() => _UpdataPromoHomeWidgetState();
}

class _UpdataPromoHomeWidgetState extends State<UpdataPromoHomeWidget> {
  late UpdataPromoHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdataPromoHomeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.promoRelampagoUpdate(
        widget.docList?.toList(),
      );
      FFAppState().horaPromo =
          functions.promoRelampagoHora(widget.docList!.toList());
      safeSetState(() {});
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
    context.watch<FFAppState>();

    return Container(
      width: 1.0,
      height: 1.0,
      decoration: BoxDecoration(),
    );
  }
}
