import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_atualizacao_frete_widget.dart' show EditarAtualizacaoFreteWidget;
import 'package:flutter/material.dart';

class EditarAtualizacaoFreteModel
    extends FlutterFlowModel<EditarAtualizacaoFreteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
  }
}
