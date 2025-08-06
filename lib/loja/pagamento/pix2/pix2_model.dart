import '/auth/base_auth_user_provider.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/carregando/carregando15/carregando15_widget.dart';
import '/components/time_pix3_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'pix2_widget.dart' show Pix2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Pix2Model extends FlutterFlowModel<Pix2Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Status Pix MP)] action in pix2 widget.
  ApiCallResponse? apiResultnkfCopy;
  // Model for timePix3 component.
  late TimePix3Model timePix3Model;

  @override
  void initState(BuildContext context) {
    timePix3Model = createModel(context, () => TimePix3Model());
  }

  @override
  void dispose() {
    timePix3Model.dispose();
  }
}
