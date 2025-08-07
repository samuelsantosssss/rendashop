import '/flutter_flow/flutter_flow_util.dart';
import 'a_d_m_pagamento_afiliado_widget.dart' show ADMPagamentoAfiliadoWidget;
import 'package:flutter/material.dart';

class ADMPagamentoAfiliadoModel
    extends FlutterFlowModel<ADMPagamentoAfiliadoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  bool isDataUploading_uploadDataNtd = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataNtd = [];
  List<String> uploadedFileUrls_uploadDataNtd = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
