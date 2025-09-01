import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pc/endereco_p_c_novo/endereco_p_c_novo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'p_csem_endereco_model.dart';
export 'p_csem_endereco_model.dart';

class PCsemEnderecoWidget extends StatefulWidget {
  const PCsemEnderecoWidget({
    super.key,
    required this.carrinhoRef,
  });

  final List<CarrinhoRecord>? carrinhoRef;

  @override
  State<PCsemEnderecoWidget> createState() => _PCsemEnderecoWidgetState();
}

class _PCsemEnderecoWidgetState extends State<PCsemEnderecoWidget> {
  late PCsemEnderecoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PCsemEnderecoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(valueOrDefault(currentUserDocument?.enderecoCompleto, '') != '')) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: EnderecoPCNovoWidget(
                queryCarrinhoList: widget.carrinhoRef!,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
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
    return Container();
  }
}
