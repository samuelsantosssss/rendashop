import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_foto_variante_model.dart';
export 'add_foto_variante_model.dart';

class AddFotoVarianteWidget extends StatefulWidget {
  const AddFotoVarianteWidget({
    super.key,
    required this.numero,
  });

  final String? numero;

  @override
  State<AddFotoVarianteWidget> createState() => _AddFotoVarianteWidgetState();
}

class _AddFotoVarianteWidgetState extends State<AddFotoVarianteWidget> {
  late AddFotoVarianteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFotoVarianteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_sharp,
                        color: Color(0xFFA6ABAB),
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Galeria de fotos',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF272929),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.library_add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          final selectedMedia = await selectMedia(
                            maxWidth: 1080.00,
                            imageQuality: 80,
                            mediaSource: MediaSource.photoGallery,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(
                                () => _model.isDataUploading_upload1010 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading_upload1010 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_upload1010 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_upload1010 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          if (widget.numero == '1') {
                            FFAppState().foto1titulo1 =
                                _model.uploadedFileUrl_upload1010 != ''
                                    ? _model.uploadedFileUrl_upload1010
                                    : FFAppState().foto1titulo1;
                            FFAppState().addToFotoProduto(
                                _model.uploadedFileUrl_upload1010);
                            safeSetState(() {});
                            safeSetState(() {
                              _model.isDataUploading_upload1010 = false;
                              _model.uploadedLocalFile_upload1010 =
                                  FFUploadedFile(bytes: Uint8List.fromList([]));
                              _model.uploadedFileUrl_upload1010 = '';
                            });

                            Navigator.pop(context);
                            return;
                          } else {
                            if (widget.numero == '2') {
                              FFAppState().foto2titulo1 =
                                  _model.uploadedFileUrl_upload1010 !=
                                              ''
                                      ? _model.uploadedFileUrl_upload1010
                                      : FFAppState().foto2titulo1;
                              FFAppState().addToFotoProduto(
                                  _model.uploadedFileUrl_upload1010);
                              safeSetState(() {});
                              safeSetState(() {
                                _model.isDataUploading_upload1010 = false;
                                _model.uploadedLocalFile_upload1010 =
                                    FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl_upload1010 = '';
                              });

                              Navigator.pop(context);
                              return;
                            } else {
                              if (widget.numero == '3') {
                                FFAppState().foto3titulo1 =
                                    _model.uploadedFileUrl_upload1010 !=
                                                ''
                                        ? _model.uploadedFileUrl_upload1010
                                        : FFAppState().foto3titulo1;
                                FFAppState().addToFotoProduto(
                                    _model.uploadedFileUrl_upload1010);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.isDataUploading_upload1010 = false;
                                  _model.uploadedLocalFile_upload1010 =
                                      FFUploadedFile(
                                          bytes: Uint8List.fromList([]));
                                  _model.uploadedFileUrl_upload1010 = '';
                                });

                                Navigator.pop(context);
                                return;
                              } else {
                                if (widget.numero == '4') {
                                  FFAppState().foto4titulo1 = _model.uploadedFileUrl_upload1010 !=
                                              ''
                                      ? _model.uploadedFileUrl_upload1010
                                      : FFAppState().foto4titulo1;
                                  FFAppState().addToFotoProduto(
                                      _model.uploadedFileUrl_upload1010);
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.isDataUploading_upload1010 = false;
                                    _model.uploadedLocalFile_upload1010 =
                                        FFUploadedFile(
                                            bytes: Uint8List.fromList([]));
                                    _model.uploadedFileUrl_upload1010 = '';
                                  });

                                  Navigator.pop(context);
                                  return;
                                } else {
                                  if (widget.numero == '5') {
                                    FFAppState().foto5titulo1 = _model.uploadedFileUrl_upload1010 !=
                                                ''
                                        ? _model.uploadedFileUrl_upload1010
                                        : FFAppState().foto5titulo1;
                                    FFAppState().addToFotoProduto(
                                        _model.uploadedFileUrl_upload1010);
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.isDataUploading_upload1010 = false;
                                      _model.uploadedLocalFile_upload1010 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl_upload1010 = '';
                                    });

                                    Navigator.pop(context);
                                    return;
                                  } else {
                                    if (widget.numero == '6') {
                                      FFAppState().foto6titulo1 = _model.uploadedFileUrl_upload1010 !=
                                                  ''
                                          ? _model.uploadedFileUrl_upload1010
                                          : FFAppState().foto6titulo1;
                                      FFAppState().addToFotoProduto(
                                          _model.uploadedFileUrl_upload1010);
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.isDataUploading_upload1010 =
                                            false;
                                        _model.uploadedLocalFile_upload1010 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl_upload1010 = '';
                                      });

                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      if (widget.numero == '7') {
                                        FFAppState().foto7titulo1 =
                                            _model.uploadedFileUrl_upload1010 !=
                                                        ''
                                                ? _model
                                                    .uploadedFileUrl_upload1010
                                                : FFAppState().foto7titulo1;
                                        FFAppState().addToFotoProduto(
                                            _model.uploadedFileUrl_upload1010);
                                        safeSetState(() {});
                                        safeSetState(() {
                                          _model.isDataUploading_upload1010 =
                                              false;
                                          _model.uploadedLocalFile_upload1010 =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                          _model.uploadedFileUrl_upload1010 =
                                              '';
                                        });

                                        Navigator.pop(context);
                                        return;
                                      } else {
                                        if (widget.numero == '8') {
                                          FFAppState().foto8titulo1 =
                                              _model.uploadedFileUrl_upload1010 !=
                                                          ''
                                                  ? _model
                                                      .uploadedFileUrl_upload1010
                                                  : FFAppState().foto8titulo1;
                                          FFAppState().addToFotoProduto(_model
                                              .uploadedFileUrl_upload1010);
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.isDataUploading_upload1010 =
                                                false;
                                            _model.uploadedLocalFile_upload1010 =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                            _model.uploadedFileUrl_upload1010 =
                                                '';
                                          });

                                          Navigator.pop(context);
                                          return;
                                        } else {
                                          if (widget.numero == '9') {
                                            FFAppState().foto9titulo1 = _model.uploadedFileUrl_upload1010 !=
                                                        ''
                                                ? _model
                                                    .uploadedFileUrl_upload1010
                                                : FFAppState().foto9titulo1;
                                            FFAppState().addToFotoProduto(_model
                                                .uploadedFileUrl_upload1010);
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.isDataUploading_upload1010 =
                                                  false;
                                              _model.uploadedLocalFile_upload1010 =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []));
                                              _model.uploadedFileUrl_upload1010 =
                                                  '';
                                            });

                                            Navigator.pop(context);
                                            return;
                                          } else {
                                            if (widget.numero == '10') {
                                              FFAppState()
                                                  .foto10titulo1 = _model.uploadedFileUrl_upload1010 !=
                                                          ''
                                                  ? _model
                                                      .uploadedFileUrl_upload1010
                                                  : FFAppState().foto10titulo1;
                                              FFAppState().addToFotoProduto(_model
                                                  .uploadedFileUrl_upload1010);
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.isDataUploading_upload1010 =
                                                    false;
                                                _model.uploadedLocalFile_upload1010 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                                _model.uploadedFileUrl_upload1010 =
                                                    '';
                                              });

                                              Navigator.pop(context);
                                              return;
                                            } else {
                                              return;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final fotoProduto = FFAppState().fotoProduto.toList();

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 0.0,
                          childAspectRatio: 1.1,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: fotoProduto.length,
                        itemBuilder: (context, fotoProdutoIndex) {
                          final fotoProdutoItem = fotoProduto[fotoProdutoIndex];
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (widget.numero == '1') {
                                  FFAppState().foto1titulo1 = fotoProdutoItem;
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  return;
                                } else {
                                  if (widget.numero == '2') {
                                    FFAppState().foto2titulo1 = fotoProdutoItem;
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    return;
                                  } else {
                                    if (widget.numero == '3') {
                                      FFAppState().foto3titulo1 =
                                          fotoProdutoItem;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      if (widget.numero == '4') {
                                        FFAppState().foto4titulo1 =
                                            fotoProdutoItem;
                                        safeSetState(() {});
                                        Navigator.pop(context);
                                        return;
                                      } else {
                                        if (widget.numero == '4') {
                                          FFAppState().foto4titulo1 =
                                              fotoProdutoItem;
                                          safeSetState(() {});
                                          Navigator.pop(context);
                                          return;
                                        } else {
                                          if (widget.numero == '5') {
                                            FFAppState().foto5titulo1 =
                                                fotoProdutoItem;
                                            safeSetState(() {});
                                            Navigator.pop(context);
                                            return;
                                          } else {
                                            if (widget.numero == '6') {
                                              FFAppState().foto6titulo1 =
                                                  fotoProdutoItem;
                                              safeSetState(() {});
                                              Navigator.pop(context);
                                              return;
                                            } else {
                                              if (widget.numero == '7') {
                                                FFAppState().foto7titulo1 =
                                                    fotoProdutoItem;
                                                safeSetState(() {});
                                                Navigator.pop(context);
                                                return;
                                              } else {
                                                if (widget.numero == '8') {
                                                  FFAppState().foto8titulo1 =
                                                      fotoProdutoItem;
                                                  safeSetState(() {});
                                                  Navigator.pop(context);
                                                  return;
                                                } else {
                                                  if (widget.numero == '9') {
                                                    FFAppState().foto9titulo1 =
                                                        fotoProdutoItem;
                                                    safeSetState(() {});
                                                    Navigator.pop(context);
                                                    return;
                                                  } else {
                                                    if (widget.numero ==
                                                        '10') {
                                                      FFAppState()
                                                              .foto10titulo1 =
                                                          fotoProdutoItem;
                                                      safeSetState(() {});
                                                      Navigator.pop(context);
                                                      return;
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  fotoProdutoItem,
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
