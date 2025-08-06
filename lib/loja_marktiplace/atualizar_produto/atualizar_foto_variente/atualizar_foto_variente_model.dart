import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'atualizar_foto_variente_widget.dart' show AtualizarFotoVarienteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AtualizarFotoVarienteModel
    extends FlutterFlowModel<AtualizarFotoVarienteWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataV2uk = false;
  FFUploadedFile uploadedLocalFile_uploadDataV2uk =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataV2uk = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
