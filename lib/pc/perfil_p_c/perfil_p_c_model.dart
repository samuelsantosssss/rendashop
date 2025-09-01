import '/flutter_flow/flutter_flow_util.dart';
import '/loja/pos_venda/time_pix4/time_pix4_widget.dart';
import '/index.dart';
import 'perfil_p_c_widget.dart' show PerfilPCWidget;
import 'package:flutter/material.dart';

class PerfilPCModel extends FlutterFlowModel<PerfilPCWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for timePix4 component.
  late TimePix4Model timePix4Model;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  bool isDataUploading_uploadData33f45553 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadData33f45553 = [];
  List<String> uploadedFileUrls_uploadData33f45553 = [];

  bool isDataUploading_uploadData33f445555 = false;
  FFUploadedFile uploadedLocalFile_uploadData33f445555 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData33f445555 = '';

  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;

  @override
  void initState(BuildContext context) {
    timePix4Model = createModel(context, () => TimePix4Model());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    timePix4Model.dispose();
    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
  }
}
