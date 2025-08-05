import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar/nav_bar_perfil/nav_bar_perfil_widget.dart';
import '/index.dart';
import 'perfil2_widget.dart' show Perfil2Widget;
import 'package:flutter/material.dart';

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
