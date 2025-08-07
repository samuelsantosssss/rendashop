import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar/nav_bar_categoria/nav_bar_categoria_widget.dart';
import '/index.dart';
import 'categoria_widget.dart' show CategoriaWidget;
import 'package:flutter/material.dart';

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
