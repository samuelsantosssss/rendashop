import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loja/promocao_relampago/time_promo/time_promo_widget.dart';
import '/pc/rodape/rodape_widget.dart';
import '/index.dart';
import 'pagina_produto_p_c_widget.dart' show PaginaProdutoPCWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaginaProdutoPCModel extends FlutterFlowModel<PaginaProdutoPCWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for timePromo component.
  late TimePromoModel timePromoModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoRecord>? respostaCarrinhSemVariante1Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CarrinhoRecord>? respostaCarrinho3;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CarrinhoRecord>? respostaCarrinho2;
  // Stores action output result for [Firestore Query - Query a collection] action in Text4444foto widget.
  List<CarrinhoRecord>? respostaCarrinho;
  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  late MaskTextInputFormatter cepMask;
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  // Stores action output result for [Backend Call - API (Puxar CEP)] action in cep widget.
  ApiCallResponse? apiResult1rf;
  // Model for rodape component.
  late RodapeModel rodapeModel;

  @override
  void initState(BuildContext context) {
    timePromoModel = createModel(context, () => TimePromoModel());
    rodapeModel = createModel(context, () => RodapeModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    timePromoModel.dispose();
    cepFocusNode?.dispose();
    cepTextController?.dispose();

    rodapeModel.dispose();
  }
}
