import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_notificacao/nav_bar_notificacao_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'notificacao_widget.dart' show NotificacaoWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificacaoModel extends FlutterFlowModel<NotificacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar-Notificacao component.
  late NavBarNotificacaoModel navBarNotificacaoModel;

  @override
  void initState(BuildContext context) {
    navBarNotificacaoModel =
        createModel(context, () => NavBarNotificacaoModel());
  }

  @override
  void dispose() {
    navBarNotificacaoModel.dispose();
  }
}
