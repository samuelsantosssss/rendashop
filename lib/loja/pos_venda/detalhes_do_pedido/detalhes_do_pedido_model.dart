import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/carregando/carregamento12/carregamento12_widget.dart';
import '/carregando/carregando10/carregando10_widget.dart';
import '/carregando/carregando18/carregando18_widget.dart';
import '/carregando/carregando19/carregando19_widget.dart';
import '/carregando/carregando7/carregando7_widget.dart';
import '/carregando/carregando8/carregando8_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loja/imposto_i_c_m_s/imposto_i_c_m_s_widget.dart';
import '/loja/imposto_importacao/imposto_importacao_widget.dart';
import '/loja/pos_venda/cencelando_pedido/cencelando_pedido_widget.dart';
import '/loja/pos_venda/cencelando_pedido2/cencelando_pedido2_widget.dart';
import '/loja/pos_venda/pedido_faturado/pedido_faturado_widget.dart';
import '/loja/pos_venda/time_pix4/time_pix4_widget.dart';
import '/loja/taxa_processamento2/taxa_processamento2_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'detalhes_do_pedido_widget.dart' show DetalhesDoPedidoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalhesDoPedidoModel extends FlutterFlowModel<DetalhesDoPedidoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for timePix4 component.
  late TimePix4Model timePix4Model;

  @override
  void initState(BuildContext context) {
    timePix4Model = createModel(context, () => TimePix4Model());
  }

  @override
  void dispose() {
    timePix4Model.dispose();
  }
}
