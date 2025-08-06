import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/carregando/carregando15/carregando15_widget.dart';
import '/components/time_pix2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'pix_widget.dart' show PixWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PixModel extends FlutterFlowModel<PixWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Status Pix MP)] action in pix widget.
  ApiCallResponse? apiResultnkfCopy2;
  // Model for timePix2 component.
  late TimePix2Model timePix2Model;

  @override
  void initState(BuildContext context) {
    timePix2Model = createModel(context, () => TimePix2Model());
  }

  @override
  void dispose() {
    timePix2Model.dispose();
  }
}
