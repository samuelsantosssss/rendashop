import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'criar_promo_relampago2_widget.dart' show CriarPromoRelampago2Widget;
import 'package:flutter/material.dart';

class CriarPromoRelampago2Model
    extends FlutterFlowModel<CriarPromoRelampago2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<ProdutoRecord, bool> checkboxValueMap = {};
  List<ProdutoRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
