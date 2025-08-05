import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
          widget.imgRef!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
