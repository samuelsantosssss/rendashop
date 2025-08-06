import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/avaliacao/moedas/moedas_widget.dart';
import '/loja/cupom/cupom_ver_disponivel/cupom_ver_disponivel_widget.dart';
import '/nav_bar/nav_bar_perfil/nav_bar_perfil_widget.dart';
import '/perfil/objetivo/objetivo_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'perfil2_widget.dart' show Perfil2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Perfil2Model extends FlutterFlowModel<Perfil2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar-perfil component.
  late NavBarPerfilModel navBarPerfilModel;

  @override
  void initState(BuildContext context) {
    navBarPerfilModel = createModel(context, () => NavBarPerfilModel());
  }

  @override
  void dispose() {
    navBarPerfilModel.dispose();
  }
}
