import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_promo_model.dart';
export 'update_promo_model.dart';

class UpdatePromoWidget extends StatefulWidget {
  const UpdatePromoWidget({
    super.key,
    required this.data,
    required this.promoRef,
    required this.statusAtual,
  });

  final String? data;
  final DocumentReference? promoRef;
  final bool? statusAtual;

  @override
  State<UpdatePromoWidget> createState() => _UpdatePromoWidgetState();
}

class _UpdatePromoWidgetState extends State<UpdatePromoWidget> {
  late UpdatePromoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdatePromoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((functions.promoRelampagoUpadete(widget!.data!) == true) &&
          (widget!.statusAtual == true))) {
        await widget!.promoRef!.update(createPromoRelampagoRecordData(
          status: false,
        ));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: 1.0,
      decoration: BoxDecoration(),
    );
  }
}
