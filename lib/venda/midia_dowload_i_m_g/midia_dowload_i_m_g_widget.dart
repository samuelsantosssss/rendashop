import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'midia_dowload_i_m_g_model.dart';
export 'midia_dowload_i_m_g_model.dart';

class MidiaDowloadIMGWidget extends StatefulWidget {
  const MidiaDowloadIMGWidget({
    super.key,
    required this.imgRef,
  });

  final String? imgRef;

  @override
  State<MidiaDowloadIMGWidget> createState() => _MidiaDowloadIMGWidgetState();
}

class _MidiaDowloadIMGWidgetState extends State<MidiaDowloadIMGWidget> {
  late MidiaDowloadIMGModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MidiaDowloadIMGModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: Image.network(
          widget!.imgRef!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
