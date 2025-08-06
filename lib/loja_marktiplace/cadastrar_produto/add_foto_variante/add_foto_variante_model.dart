import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'add_foto_variante_widget.dart' show AddFotoVarianteWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddFotoVarianteModel extends FlutterFlowModel<AddFotoVarianteWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_upload1010 = false;
  FFUploadedFile uploadedLocalFile_upload1010 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_upload1010 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
