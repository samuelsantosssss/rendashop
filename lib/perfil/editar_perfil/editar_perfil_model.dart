import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'editar_perfil_widget.dart' show EditarPerfilWidget;
import 'package:flutter/material.dart';

class EditarPerfilModel extends FlutterFlowModel<EditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData1fh7 = false;
  FFUploadedFile uploadedLocalFile_uploadData1fh7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadToCloudinary)] action in Container widget.
  ApiCallResponse? apiResult4cb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
