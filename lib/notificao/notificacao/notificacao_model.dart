import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar/nav_bar_notificacao/nav_bar_notificacao_widget.dart';
import '/index.dart';
import 'notificacao_widget.dart' show NotificacaoWidget;
import 'package:flutter/material.dart';

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
