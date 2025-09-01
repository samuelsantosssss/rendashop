import '/flutter_flow/flutter_flow_util.dart';
import 'criar_avaliacao_widget.dart' show CriarAvaliacaoWidget;
import 'package:flutter/material.dart';

class CriarAvaliacaoModel extends FlutterFlowModel<CriarAvaliacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  bool isDataUploading_uploadData33f4555 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadData33f4555 = [];
  List<String> uploadedFileUrls_uploadData33f4555 = [];

  bool isDataUploading_uploadData33f4455555 = false;
  FFUploadedFile uploadedLocalFile_uploadData33f4455555 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData33f4455555 = '';

  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
  }
}
