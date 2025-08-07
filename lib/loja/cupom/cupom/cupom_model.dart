import '/flutter_flow/flutter_flow_util.dart';
import '/loja/cupom/cupom_acima10/cupom_acima10_widget.dart';
import '/loja/cupom/cupom_acima19/cupom_acima19_widget.dart';
import 'cupom_widget.dart' show CupomWidget;
import 'package:flutter/material.dart';

class CupomModel extends FlutterFlowModel<CupomWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for cupom_acima10 component.
  late CupomAcima10Model cupomAcima10Model;
  // Model for cupom_acima19 component.
  late CupomAcima19Model cupomAcima19Model;

  @override
  void initState(BuildContext context) {
    cupomAcima10Model = createModel(context, () => CupomAcima10Model());
    cupomAcima19Model = createModel(context, () => CupomAcima19Model());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cupomAcima10Model.dispose();
    cupomAcima19Model.dispose();
  }
}
