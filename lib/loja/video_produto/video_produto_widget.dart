import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'video_produto_model.dart';
export 'video_produto_model.dart';

class VideoProdutoWidget extends StatefulWidget {
  const VideoProdutoWidget({
    super.key,
    required this.produtoRef,
  });

  final DocumentReference? produtoRef;

  static String routeName = 'video_produto';
  static String routePath = '/video_produto';

  @override
  State<VideoProdutoWidget> createState() => _VideoProdutoWidgetState();
}

class _VideoProdutoWidgetState extends State<VideoProdutoWidget> {
  late VideoProdutoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoProdutoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF121212),
        body: StreamBuilder<ProdutoRecord>(
          stream: ProdutoRecord.getDocument(widget.produtoRef!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 26.0,
                  height: 26.0,
                  child: SpinKitCircle(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 26.0,
                  ),
                ),
              );
            }

            final containerProdutoRecord = snapshot.data!;

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          decoration: BoxDecoration(),
                          child: FlutterFlowVideoPlayer(
                            path: containerProdutoRecord.video,
                            videoType: VideoType.network,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            autoPlay: true,
                            looping: true,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 52.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
