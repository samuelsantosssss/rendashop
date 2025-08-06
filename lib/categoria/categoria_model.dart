import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_categoria/nav_bar_categoria_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'categoria_widget.dart' show CategoriaWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriaModel extends FlutterFlowModel<CategoriaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar-categoria component.
  late NavBarCategoriaModel navBarCategoriaModel;

  @override
  void initState(BuildContext context) {
    navBarCategoriaModel = createModel(context, () => NavBarCategoriaModel());
  }

  @override
  void dispose() {
    navBarCategoriaModel.dispose();
  }
}
