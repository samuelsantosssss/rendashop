import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'cupom_acima19_model.dart';
export 'cupom_acima19_model.dart';

class CupomAcima19Widget extends StatefulWidget {
  const CupomAcima19Widget({
    super.key,
    required this.query19,
  });

  final List<CarrinhoRecord>? query19;

  @override
  State<CupomAcima19Widget> createState() => _CupomAcima19WidgetState();
}

class _CupomAcima19WidgetState extends State<CupomAcima19Widget> {
  late CupomAcima19Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CupomAcima19Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultado2 = await actions.cupomMais19(
        widget.query19!.toList(),
      );
      FFAppState().cupomMais19 = _model.resultado2!;
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

    return Visibility(
      visible: FFAppState().cupomMais19 == false,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          FFAppState().nada = true;
          safeSetState(() {});
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xACFAFAFA),
          ),
        ),
      ),
    );
  }
}
