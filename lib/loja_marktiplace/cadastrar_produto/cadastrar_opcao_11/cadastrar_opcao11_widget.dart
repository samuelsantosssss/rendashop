import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cadastrar_opcao11_model.dart';
export 'cadastrar_opcao11_model.dart';

class CadastrarOpcao11Widget extends StatefulWidget {
  const CadastrarOpcao11Widget({super.key});

  @override
  State<CadastrarOpcao11Widget> createState() => _CadastrarOpcao11WidgetState();
}

class _CadastrarOpcao11WidgetState extends State<CadastrarOpcao11Widget> {
  late CadastrarOpcao11Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastrarOpcao11Model());

    _model.nomeProdutoTextController ??= TextEditingController();
    _model.nomeProdutoFocusNode ??= FocusNode();

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
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
              height: 98.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 27.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: Color(0x5ECBCDCE),
                        ),
                      ),
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.nomeProdutoTextController,
                            focusNode: _model.nomeProdutoFocusNode,
                            onFieldSubmitted: (_) async {
                              if (FFAppState().opcao1titulo1 == null ||
                                  FFAppState().opcao1titulo1 == '') {
                                FFAppState().opcao1titulo1 =
                                    _model.nomeProdutoTextController.text;
                                safeSetState(() {});
                                Navigator.pop(context);
                                return;
                              } else {
                                if (FFAppState().opcao2titulo1 == null ||
                                    FFAppState().opcao2titulo1 == '') {
                                  FFAppState().opcao2titulo1 =
                                      _model.nomeProdutoTextController.text;
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  return;
                                } else {
                                  if (FFAppState().opcao3titulo1 == null ||
                                      FFAppState().opcao3titulo1 == '') {
                                    FFAppState().opcao3titulo1 =
                                        _model.nomeProdutoTextController.text;
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    return;
                                  } else {
                                    if (FFAppState().opcao4titulo1 == null ||
                                        FFAppState().opcao4titulo1 == '') {
                                      FFAppState().opcao4titulo1 =
                                          _model.nomeProdutoTextController.text;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      if (FFAppState().opcao5titulo1 == null ||
                                          FFAppState().opcao5titulo1 == '') {
                                        FFAppState().opcao5titulo1 = _model
                                            .nomeProdutoTextController.text;
                                        safeSetState(() {});
                                        Navigator.pop(context);
                                        return;
                                      } else {
                                        if (FFAppState().opcao6titulo1 ==
                                                null ||
                                            FFAppState().opcao6titulo1 == '') {
                                          FFAppState().opcao6titulo1 = _model
                                              .nomeProdutoTextController.text;
                                          safeSetState(() {});
                                          Navigator.pop(context);
                                          return;
                                        } else {
                                          if (FFAppState().opcao7titulo1 ==
                                                  null ||
                                              FFAppState().opcao7titulo1 ==
                                                  '') {
                                            FFAppState().opcao7titulo1 = _model
                                                .nomeProdutoTextController.text;
                                            safeSetState(() {});
                                            Navigator.pop(context);
                                            return;
                                          } else {
                                            if (FFAppState().opcao8titulo1 ==
                                                    null ||
                                                FFAppState().opcao8titulo1 ==
                                                    '') {
                                              FFAppState().opcao8titulo1 =
                                                  _model
                                                      .nomeProdutoTextController
                                                      .text;
                                              safeSetState(() {});
                                              Navigator.pop(context);
                                              return;
                                            } else {
                                              if (FFAppState().opcao9titulo1 ==
                                                      null ||
                                                  FFAppState().opcao9titulo1 ==
                                                      '') {
                                                FFAppState().opcao9titulo1 =
                                                    _model
                                                        .nomeProdutoTextController
                                                        .text;
                                                safeSetState(() {});
                                                Navigator.pop(context);
                                                return;
                                              } else {
                                                if (FFAppState()
                                                            .opcao10titulo1 ==
                                                        null ||
                                                    FFAppState()
                                                            .opcao10titulo1 ==
                                                        '') {
                                                  FFAppState().opcao10titulo1 =
                                                      _model
                                                          .nomeProdutoTextController
                                                          .text;
                                                  safeSetState(() {});
                                                  Navigator.pop(context);
                                                  return;
                                                } else {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Atenção'),
                                                        content: Text(
                                                            'Máximo de 10 opções atingido'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
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
                            autofocus: true,
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFC1C2C5),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                              alignLabelWithHint: true,
                              hintText: 'Ex. Material, etc',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFC1C2C5),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                              counterStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFC1C2C5),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                            cursorColor: Color(0xFFC1C2C5),
                            validator: _model.nomeProdutoTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              if (!isAndroid && !isiOS)
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  return TextEditingValue(
                                    selection: newValue.selection,
                                    text: newValue.text.toCapitalization(
                                        TextCapitalization.none),
                                  );
                                }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
