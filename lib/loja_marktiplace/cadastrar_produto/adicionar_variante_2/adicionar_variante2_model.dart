import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'adicionar_variante2_widget.dart' show AdicionarVariante2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarVariante2Model
    extends FlutterFlowModel<AdicionarVariante2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode1;
  TextEditingController? preco1TextController1;
  String? Function(BuildContext, String?)? preco1TextController1Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode1;
  TextEditingController? estoque1TextController1;
  String? Function(BuildContext, String?)? estoque1TextController1Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode1;
  TextEditingController? preco12TextController1;
  String? Function(BuildContext, String?)? preco12TextController1Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode1;
  TextEditingController? estoque12TextController1;
  String? Function(BuildContext, String?)? estoque12TextController1Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode1;
  TextEditingController? preco13TextController1;
  String? Function(BuildContext, String?)? preco13TextController1Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode1;
  TextEditingController? estoque13TextController1;
  String? Function(BuildContext, String?)? estoque13TextController1Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode1;
  TextEditingController? preco14TextController1;
  String? Function(BuildContext, String?)? preco14TextController1Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode1;
  TextEditingController? estoque14TextController1;
  String? Function(BuildContext, String?)? estoque14TextController1Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode1;
  TextEditingController? preco15TextController1;
  String? Function(BuildContext, String?)? preco15TextController1Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode1;
  TextEditingController? estoque15TextController1;
  String? Function(BuildContext, String?)? estoque15TextController1Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode1;
  TextEditingController? preco16TextController1;
  String? Function(BuildContext, String?)? preco16TextController1Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode1;
  TextEditingController? estoque16TextController1;
  String? Function(BuildContext, String?)? estoque16TextController1Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode1;
  TextEditingController? preco17TextController1;
  String? Function(BuildContext, String?)? preco17TextController1Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode1;
  TextEditingController? estoque17TextController1;
  String? Function(BuildContext, String?)? estoque17TextController1Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode1;
  TextEditingController? preco18TextController1;
  String? Function(BuildContext, String?)? preco18TextController1Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode1;
  TextEditingController? estoque18TextController1;
  String? Function(BuildContext, String?)? estoque18TextController1Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode1;
  TextEditingController? preco19TextController1;
  String? Function(BuildContext, String?)? preco19TextController1Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode1;
  TextEditingController? estoque19TextController1;
  String? Function(BuildContext, String?)? estoque19TextController1Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode1;
  TextEditingController? preco110TextController1;
  String? Function(BuildContext, String?)? preco110TextController1Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode1;
  TextEditingController? estoque110TextController1;
  String? Function(BuildContext, String?)? estoque110TextController1Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode2;
  TextEditingController? preco1TextController2;
  String? Function(BuildContext, String?)? preco1TextController2Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode2;
  TextEditingController? estoque1TextController2;
  String? Function(BuildContext, String?)? estoque1TextController2Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode2;
  TextEditingController? preco12TextController2;
  String? Function(BuildContext, String?)? preco12TextController2Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode2;
  TextEditingController? estoque12TextController2;
  String? Function(BuildContext, String?)? estoque12TextController2Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode2;
  TextEditingController? preco13TextController2;
  String? Function(BuildContext, String?)? preco13TextController2Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode2;
  TextEditingController? estoque13TextController2;
  String? Function(BuildContext, String?)? estoque13TextController2Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode2;
  TextEditingController? preco14TextController2;
  String? Function(BuildContext, String?)? preco14TextController2Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode2;
  TextEditingController? estoque14TextController2;
  String? Function(BuildContext, String?)? estoque14TextController2Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode2;
  TextEditingController? preco15TextController2;
  String? Function(BuildContext, String?)? preco15TextController2Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode2;
  TextEditingController? estoque15TextController2;
  String? Function(BuildContext, String?)? estoque15TextController2Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode2;
  TextEditingController? preco16TextController2;
  String? Function(BuildContext, String?)? preco16TextController2Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode2;
  TextEditingController? estoque16TextController2;
  String? Function(BuildContext, String?)? estoque16TextController2Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode2;
  TextEditingController? preco17TextController2;
  String? Function(BuildContext, String?)? preco17TextController2Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode2;
  TextEditingController? estoque17TextController2;
  String? Function(BuildContext, String?)? estoque17TextController2Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode2;
  TextEditingController? preco18TextController2;
  String? Function(BuildContext, String?)? preco18TextController2Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode2;
  TextEditingController? estoque18TextController2;
  String? Function(BuildContext, String?)? estoque18TextController2Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode2;
  TextEditingController? preco19TextController2;
  String? Function(BuildContext, String?)? preco19TextController2Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode2;
  TextEditingController? estoque19TextController2;
  String? Function(BuildContext, String?)? estoque19TextController2Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode2;
  TextEditingController? preco110TextController2;
  String? Function(BuildContext, String?)? preco110TextController2Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode2;
  TextEditingController? estoque110TextController2;
  String? Function(BuildContext, String?)? estoque110TextController2Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode3;
  TextEditingController? preco1TextController3;
  String? Function(BuildContext, String?)? preco1TextController3Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode3;
  TextEditingController? estoque1TextController3;
  String? Function(BuildContext, String?)? estoque1TextController3Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode3;
  TextEditingController? preco12TextController3;
  String? Function(BuildContext, String?)? preco12TextController3Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode3;
  TextEditingController? estoque12TextController3;
  String? Function(BuildContext, String?)? estoque12TextController3Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode3;
  TextEditingController? preco13TextController3;
  String? Function(BuildContext, String?)? preco13TextController3Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode3;
  TextEditingController? estoque13TextController3;
  String? Function(BuildContext, String?)? estoque13TextController3Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode3;
  TextEditingController? preco14TextController3;
  String? Function(BuildContext, String?)? preco14TextController3Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode3;
  TextEditingController? estoque14TextController3;
  String? Function(BuildContext, String?)? estoque14TextController3Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode3;
  TextEditingController? preco15TextController3;
  String? Function(BuildContext, String?)? preco15TextController3Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode3;
  TextEditingController? estoque15TextController3;
  String? Function(BuildContext, String?)? estoque15TextController3Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode3;
  TextEditingController? preco16TextController3;
  String? Function(BuildContext, String?)? preco16TextController3Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode3;
  TextEditingController? estoque16TextController3;
  String? Function(BuildContext, String?)? estoque16TextController3Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode3;
  TextEditingController? preco17TextController3;
  String? Function(BuildContext, String?)? preco17TextController3Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode3;
  TextEditingController? estoque17TextController3;
  String? Function(BuildContext, String?)? estoque17TextController3Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode3;
  TextEditingController? preco18TextController3;
  String? Function(BuildContext, String?)? preco18TextController3Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode3;
  TextEditingController? estoque18TextController3;
  String? Function(BuildContext, String?)? estoque18TextController3Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode3;
  TextEditingController? preco19TextController3;
  String? Function(BuildContext, String?)? preco19TextController3Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode3;
  TextEditingController? estoque19TextController3;
  String? Function(BuildContext, String?)? estoque19TextController3Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode3;
  TextEditingController? preco110TextController3;
  String? Function(BuildContext, String?)? preco110TextController3Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode3;
  TextEditingController? estoque110TextController3;
  String? Function(BuildContext, String?)? estoque110TextController3Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode4;
  TextEditingController? preco1TextController4;
  String? Function(BuildContext, String?)? preco1TextController4Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode4;
  TextEditingController? estoque1TextController4;
  String? Function(BuildContext, String?)? estoque1TextController4Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode4;
  TextEditingController? preco12TextController4;
  String? Function(BuildContext, String?)? preco12TextController4Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode4;
  TextEditingController? estoque12TextController4;
  String? Function(BuildContext, String?)? estoque12TextController4Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode4;
  TextEditingController? preco13TextController4;
  String? Function(BuildContext, String?)? preco13TextController4Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode4;
  TextEditingController? estoque13TextController4;
  String? Function(BuildContext, String?)? estoque13TextController4Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode4;
  TextEditingController? preco14TextController4;
  String? Function(BuildContext, String?)? preco14TextController4Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode4;
  TextEditingController? estoque14TextController4;
  String? Function(BuildContext, String?)? estoque14TextController4Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode4;
  TextEditingController? preco15TextController4;
  String? Function(BuildContext, String?)? preco15TextController4Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode4;
  TextEditingController? estoque15TextController4;
  String? Function(BuildContext, String?)? estoque15TextController4Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode4;
  TextEditingController? preco16TextController4;
  String? Function(BuildContext, String?)? preco16TextController4Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode4;
  TextEditingController? estoque16TextController4;
  String? Function(BuildContext, String?)? estoque16TextController4Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode4;
  TextEditingController? preco17TextController4;
  String? Function(BuildContext, String?)? preco17TextController4Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode4;
  TextEditingController? estoque17TextController4;
  String? Function(BuildContext, String?)? estoque17TextController4Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode4;
  TextEditingController? preco18TextController4;
  String? Function(BuildContext, String?)? preco18TextController4Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode4;
  TextEditingController? estoque18TextController4;
  String? Function(BuildContext, String?)? estoque18TextController4Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode4;
  TextEditingController? preco19TextController4;
  String? Function(BuildContext, String?)? preco19TextController4Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode4;
  TextEditingController? estoque19TextController4;
  String? Function(BuildContext, String?)? estoque19TextController4Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode4;
  TextEditingController? preco110TextController4;
  String? Function(BuildContext, String?)? preco110TextController4Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode4;
  TextEditingController? estoque110TextController4;
  String? Function(BuildContext, String?)? estoque110TextController4Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode5;
  TextEditingController? preco1TextController5;
  String? Function(BuildContext, String?)? preco1TextController5Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode5;
  TextEditingController? estoque1TextController5;
  String? Function(BuildContext, String?)? estoque1TextController5Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode5;
  TextEditingController? preco12TextController5;
  String? Function(BuildContext, String?)? preco12TextController5Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode5;
  TextEditingController? estoque12TextController5;
  String? Function(BuildContext, String?)? estoque12TextController5Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode5;
  TextEditingController? preco13TextController5;
  String? Function(BuildContext, String?)? preco13TextController5Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode5;
  TextEditingController? estoque13TextController5;
  String? Function(BuildContext, String?)? estoque13TextController5Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode5;
  TextEditingController? preco14TextController5;
  String? Function(BuildContext, String?)? preco14TextController5Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode5;
  TextEditingController? estoque14TextController5;
  String? Function(BuildContext, String?)? estoque14TextController5Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode5;
  TextEditingController? preco15TextController5;
  String? Function(BuildContext, String?)? preco15TextController5Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode5;
  TextEditingController? estoque15TextController5;
  String? Function(BuildContext, String?)? estoque15TextController5Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode5;
  TextEditingController? preco16TextController5;
  String? Function(BuildContext, String?)? preco16TextController5Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode5;
  TextEditingController? estoque16TextController5;
  String? Function(BuildContext, String?)? estoque16TextController5Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode5;
  TextEditingController? preco17TextController5;
  String? Function(BuildContext, String?)? preco17TextController5Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode5;
  TextEditingController? estoque17TextController5;
  String? Function(BuildContext, String?)? estoque17TextController5Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode5;
  TextEditingController? preco18TextController5;
  String? Function(BuildContext, String?)? preco18TextController5Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode5;
  TextEditingController? estoque18TextController5;
  String? Function(BuildContext, String?)? estoque18TextController5Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode5;
  TextEditingController? preco19TextController5;
  String? Function(BuildContext, String?)? preco19TextController5Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode5;
  TextEditingController? estoque19TextController5;
  String? Function(BuildContext, String?)? estoque19TextController5Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode5;
  TextEditingController? preco110TextController5;
  String? Function(BuildContext, String?)? preco110TextController5Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode5;
  TextEditingController? estoque110TextController5;
  String? Function(BuildContext, String?)? estoque110TextController5Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode6;
  TextEditingController? preco1TextController6;
  String? Function(BuildContext, String?)? preco1TextController6Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode6;
  TextEditingController? estoque1TextController6;
  String? Function(BuildContext, String?)? estoque1TextController6Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode6;
  TextEditingController? preco12TextController6;
  String? Function(BuildContext, String?)? preco12TextController6Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode6;
  TextEditingController? estoque12TextController6;
  String? Function(BuildContext, String?)? estoque12TextController6Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode6;
  TextEditingController? preco13TextController6;
  String? Function(BuildContext, String?)? preco13TextController6Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode6;
  TextEditingController? estoque13TextController6;
  String? Function(BuildContext, String?)? estoque13TextController6Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode6;
  TextEditingController? preco14TextController6;
  String? Function(BuildContext, String?)? preco14TextController6Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode6;
  TextEditingController? estoque14TextController6;
  String? Function(BuildContext, String?)? estoque14TextController6Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode6;
  TextEditingController? preco15TextController6;
  String? Function(BuildContext, String?)? preco15TextController6Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode6;
  TextEditingController? estoque15TextController6;
  String? Function(BuildContext, String?)? estoque15TextController6Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode6;
  TextEditingController? preco16TextController6;
  String? Function(BuildContext, String?)? preco16TextController6Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode6;
  TextEditingController? estoque16TextController6;
  String? Function(BuildContext, String?)? estoque16TextController6Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode6;
  TextEditingController? preco17TextController6;
  String? Function(BuildContext, String?)? preco17TextController6Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode6;
  TextEditingController? estoque17TextController6;
  String? Function(BuildContext, String?)? estoque17TextController6Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode6;
  TextEditingController? preco18TextController6;
  String? Function(BuildContext, String?)? preco18TextController6Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode6;
  TextEditingController? estoque18TextController6;
  String? Function(BuildContext, String?)? estoque18TextController6Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode6;
  TextEditingController? preco19TextController6;
  String? Function(BuildContext, String?)? preco19TextController6Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode6;
  TextEditingController? estoque19TextController6;
  String? Function(BuildContext, String?)? estoque19TextController6Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode6;
  TextEditingController? preco110TextController6;
  String? Function(BuildContext, String?)? preco110TextController6Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode6;
  TextEditingController? estoque110TextController6;
  String? Function(BuildContext, String?)? estoque110TextController6Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode7;
  TextEditingController? preco1TextController7;
  String? Function(BuildContext, String?)? preco1TextController7Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode7;
  TextEditingController? estoque1TextController7;
  String? Function(BuildContext, String?)? estoque1TextController7Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode7;
  TextEditingController? preco12TextController7;
  String? Function(BuildContext, String?)? preco12TextController7Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode7;
  TextEditingController? estoque12TextController7;
  String? Function(BuildContext, String?)? estoque12TextController7Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode7;
  TextEditingController? preco13TextController7;
  String? Function(BuildContext, String?)? preco13TextController7Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode7;
  TextEditingController? estoque13TextController7;
  String? Function(BuildContext, String?)? estoque13TextController7Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode7;
  TextEditingController? preco14TextController7;
  String? Function(BuildContext, String?)? preco14TextController7Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode7;
  TextEditingController? estoque14TextController7;
  String? Function(BuildContext, String?)? estoque14TextController7Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode7;
  TextEditingController? preco15TextController7;
  String? Function(BuildContext, String?)? preco15TextController7Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode7;
  TextEditingController? estoque15TextController7;
  String? Function(BuildContext, String?)? estoque15TextController7Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode7;
  TextEditingController? preco16TextController7;
  String? Function(BuildContext, String?)? preco16TextController7Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode7;
  TextEditingController? estoque16TextController7;
  String? Function(BuildContext, String?)? estoque16TextController7Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode7;
  TextEditingController? preco17TextController7;
  String? Function(BuildContext, String?)? preco17TextController7Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode7;
  TextEditingController? estoque17TextController7;
  String? Function(BuildContext, String?)? estoque17TextController7Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode7;
  TextEditingController? preco18TextController7;
  String? Function(BuildContext, String?)? preco18TextController7Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode7;
  TextEditingController? estoque18TextController7;
  String? Function(BuildContext, String?)? estoque18TextController7Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode7;
  TextEditingController? preco19TextController7;
  String? Function(BuildContext, String?)? preco19TextController7Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode7;
  TextEditingController? estoque19TextController7;
  String? Function(BuildContext, String?)? estoque19TextController7Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode7;
  TextEditingController? preco110TextController7;
  String? Function(BuildContext, String?)? preco110TextController7Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode7;
  TextEditingController? estoque110TextController7;
  String? Function(BuildContext, String?)? estoque110TextController7Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode8;
  TextEditingController? preco1TextController8;
  String? Function(BuildContext, String?)? preco1TextController8Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode8;
  TextEditingController? estoque1TextController8;
  String? Function(BuildContext, String?)? estoque1TextController8Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode8;
  TextEditingController? preco12TextController8;
  String? Function(BuildContext, String?)? preco12TextController8Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode8;
  TextEditingController? estoque12TextController8;
  String? Function(BuildContext, String?)? estoque12TextController8Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode8;
  TextEditingController? preco13TextController8;
  String? Function(BuildContext, String?)? preco13TextController8Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode8;
  TextEditingController? estoque13TextController8;
  String? Function(BuildContext, String?)? estoque13TextController8Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode8;
  TextEditingController? preco14TextController8;
  String? Function(BuildContext, String?)? preco14TextController8Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode8;
  TextEditingController? estoque14TextController8;
  String? Function(BuildContext, String?)? estoque14TextController8Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode8;
  TextEditingController? preco15TextController8;
  String? Function(BuildContext, String?)? preco15TextController8Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode8;
  TextEditingController? estoque15TextController8;
  String? Function(BuildContext, String?)? estoque15TextController8Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode8;
  TextEditingController? preco16TextController8;
  String? Function(BuildContext, String?)? preco16TextController8Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode8;
  TextEditingController? estoque16TextController8;
  String? Function(BuildContext, String?)? estoque16TextController8Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode8;
  TextEditingController? preco17TextController8;
  String? Function(BuildContext, String?)? preco17TextController8Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode8;
  TextEditingController? estoque17TextController8;
  String? Function(BuildContext, String?)? estoque17TextController8Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode8;
  TextEditingController? preco18TextController8;
  String? Function(BuildContext, String?)? preco18TextController8Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode8;
  TextEditingController? estoque18TextController8;
  String? Function(BuildContext, String?)? estoque18TextController8Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode8;
  TextEditingController? preco19TextController8;
  String? Function(BuildContext, String?)? preco19TextController8Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode8;
  TextEditingController? estoque19TextController8;
  String? Function(BuildContext, String?)? estoque19TextController8Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode8;
  TextEditingController? preco110TextController8;
  String? Function(BuildContext, String?)? preco110TextController8Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode8;
  TextEditingController? estoque110TextController8;
  String? Function(BuildContext, String?)? estoque110TextController8Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode9;
  TextEditingController? preco1TextController9;
  String? Function(BuildContext, String?)? preco1TextController9Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode9;
  TextEditingController? estoque1TextController9;
  String? Function(BuildContext, String?)? estoque1TextController9Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode9;
  TextEditingController? preco12TextController9;
  String? Function(BuildContext, String?)? preco12TextController9Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode9;
  TextEditingController? estoque12TextController9;
  String? Function(BuildContext, String?)? estoque12TextController9Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode9;
  TextEditingController? preco13TextController9;
  String? Function(BuildContext, String?)? preco13TextController9Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode9;
  TextEditingController? estoque13TextController9;
  String? Function(BuildContext, String?)? estoque13TextController9Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode9;
  TextEditingController? preco14TextController9;
  String? Function(BuildContext, String?)? preco14TextController9Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode9;
  TextEditingController? estoque14TextController9;
  String? Function(BuildContext, String?)? estoque14TextController9Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode9;
  TextEditingController? preco15TextController9;
  String? Function(BuildContext, String?)? preco15TextController9Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode9;
  TextEditingController? estoque15TextController9;
  String? Function(BuildContext, String?)? estoque15TextController9Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode9;
  TextEditingController? preco16TextController9;
  String? Function(BuildContext, String?)? preco16TextController9Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode9;
  TextEditingController? estoque16TextController9;
  String? Function(BuildContext, String?)? estoque16TextController9Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode9;
  TextEditingController? preco17TextController9;
  String? Function(BuildContext, String?)? preco17TextController9Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode9;
  TextEditingController? estoque17TextController9;
  String? Function(BuildContext, String?)? estoque17TextController9Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode9;
  TextEditingController? preco18TextController9;
  String? Function(BuildContext, String?)? preco18TextController9Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode9;
  TextEditingController? estoque18TextController9;
  String? Function(BuildContext, String?)? estoque18TextController9Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode9;
  TextEditingController? preco19TextController9;
  String? Function(BuildContext, String?)? preco19TextController9Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode9;
  TextEditingController? estoque19TextController9;
  String? Function(BuildContext, String?)? estoque19TextController9Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode9;
  TextEditingController? preco110TextController9;
  String? Function(BuildContext, String?)? preco110TextController9Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode9;
  TextEditingController? estoque110TextController9;
  String? Function(BuildContext, String?)? estoque110TextController9Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode10;
  TextEditingController? preco1TextController10;
  String? Function(BuildContext, String?)? preco1TextController10Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode10;
  TextEditingController? estoque1TextController10;
  String? Function(BuildContext, String?)? estoque1TextController10Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode10;
  TextEditingController? preco12TextController10;
  String? Function(BuildContext, String?)? preco12TextController10Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode10;
  TextEditingController? estoque12TextController10;
  String? Function(BuildContext, String?)? estoque12TextController10Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode10;
  TextEditingController? preco13TextController10;
  String? Function(BuildContext, String?)? preco13TextController10Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode10;
  TextEditingController? estoque13TextController10;
  String? Function(BuildContext, String?)? estoque13TextController10Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode10;
  TextEditingController? preco14TextController10;
  String? Function(BuildContext, String?)? preco14TextController10Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode10;
  TextEditingController? estoque14TextController10;
  String? Function(BuildContext, String?)? estoque14TextController10Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode10;
  TextEditingController? preco15TextController10;
  String? Function(BuildContext, String?)? preco15TextController10Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode10;
  TextEditingController? estoque15TextController10;
  String? Function(BuildContext, String?)? estoque15TextController10Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode10;
  TextEditingController? preco16TextController10;
  String? Function(BuildContext, String?)? preco16TextController10Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode10;
  TextEditingController? estoque16TextController10;
  String? Function(BuildContext, String?)? estoque16TextController10Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode10;
  TextEditingController? preco17TextController10;
  String? Function(BuildContext, String?)? preco17TextController10Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode10;
  TextEditingController? estoque17TextController10;
  String? Function(BuildContext, String?)? estoque17TextController10Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode10;
  TextEditingController? preco18TextController10;
  String? Function(BuildContext, String?)? preco18TextController10Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode10;
  TextEditingController? estoque18TextController10;
  String? Function(BuildContext, String?)? estoque18TextController10Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode10;
  TextEditingController? preco19TextController10;
  String? Function(BuildContext, String?)? preco19TextController10Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode10;
  TextEditingController? estoque19TextController10;
  String? Function(BuildContext, String?)? estoque19TextController10Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode10;
  TextEditingController? preco110TextController10;
  String? Function(BuildContext, String?)? preco110TextController10Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode10;
  TextEditingController? estoque110TextController10;
  String? Function(BuildContext, String?)? estoque110TextController10Validator;
  // State field(s) for preco-1 widget.
  FocusNode? preco1FocusNode11;
  TextEditingController? preco1TextController11;
  String? Function(BuildContext, String?)? preco1TextController11Validator;
  // State field(s) for estoque-1 widget.
  FocusNode? estoque1FocusNode11;
  TextEditingController? estoque1TextController11;
  String? Function(BuildContext, String?)? estoque1TextController11Validator;
  // State field(s) for preco12 widget.
  FocusNode? preco12FocusNode11;
  TextEditingController? preco12TextController11;
  String? Function(BuildContext, String?)? preco12TextController11Validator;
  // State field(s) for estoque12 widget.
  FocusNode? estoque12FocusNode11;
  TextEditingController? estoque12TextController11;
  String? Function(BuildContext, String?)? estoque12TextController11Validator;
  // State field(s) for preco-13 widget.
  FocusNode? preco13FocusNode11;
  TextEditingController? preco13TextController11;
  String? Function(BuildContext, String?)? preco13TextController11Validator;
  // State field(s) for estoque-13 widget.
  FocusNode? estoque13FocusNode11;
  TextEditingController? estoque13TextController11;
  String? Function(BuildContext, String?)? estoque13TextController11Validator;
  // State field(s) for preco-14 widget.
  FocusNode? preco14FocusNode11;
  TextEditingController? preco14TextController11;
  String? Function(BuildContext, String?)? preco14TextController11Validator;
  // State field(s) for estoque-14 widget.
  FocusNode? estoque14FocusNode11;
  TextEditingController? estoque14TextController11;
  String? Function(BuildContext, String?)? estoque14TextController11Validator;
  // State field(s) for preco-15 widget.
  FocusNode? preco15FocusNode11;
  TextEditingController? preco15TextController11;
  String? Function(BuildContext, String?)? preco15TextController11Validator;
  // State field(s) for estoque15 widget.
  FocusNode? estoque15FocusNode11;
  TextEditingController? estoque15TextController11;
  String? Function(BuildContext, String?)? estoque15TextController11Validator;
  // State field(s) for preco16 widget.
  FocusNode? preco16FocusNode11;
  TextEditingController? preco16TextController11;
  String? Function(BuildContext, String?)? preco16TextController11Validator;
  // State field(s) for estoque16 widget.
  FocusNode? estoque16FocusNode11;
  TextEditingController? estoque16TextController11;
  String? Function(BuildContext, String?)? estoque16TextController11Validator;
  // State field(s) for preco17 widget.
  FocusNode? preco17FocusNode11;
  TextEditingController? preco17TextController11;
  String? Function(BuildContext, String?)? preco17TextController11Validator;
  // State field(s) for estoque17 widget.
  FocusNode? estoque17FocusNode11;
  TextEditingController? estoque17TextController11;
  String? Function(BuildContext, String?)? estoque17TextController11Validator;
  // State field(s) for preco18 widget.
  FocusNode? preco18FocusNode11;
  TextEditingController? preco18TextController11;
  String? Function(BuildContext, String?)? preco18TextController11Validator;
  // State field(s) for estoque18 widget.
  FocusNode? estoque18FocusNode11;
  TextEditingController? estoque18TextController11;
  String? Function(BuildContext, String?)? estoque18TextController11Validator;
  // State field(s) for preco19 widget.
  FocusNode? preco19FocusNode11;
  TextEditingController? preco19TextController11;
  String? Function(BuildContext, String?)? preco19TextController11Validator;
  // State field(s) for estoque19 widget.
  FocusNode? estoque19FocusNode11;
  TextEditingController? estoque19TextController11;
  String? Function(BuildContext, String?)? estoque19TextController11Validator;
  // State field(s) for preco110 widget.
  FocusNode? preco110FocusNode11;
  TextEditingController? preco110TextController11;
  String? Function(BuildContext, String?)? preco110TextController11Validator;
  // State field(s) for estoque110 widget.
  FocusNode? estoque110FocusNode11;
  TextEditingController? estoque110TextController11;
  String? Function(BuildContext, String?)? estoque110TextController11Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    preco1FocusNode1?.dispose();
    preco1TextController1?.dispose();

    estoque1FocusNode1?.dispose();
    estoque1TextController1?.dispose();

    preco12FocusNode1?.dispose();
    preco12TextController1?.dispose();

    estoque12FocusNode1?.dispose();
    estoque12TextController1?.dispose();

    preco13FocusNode1?.dispose();
    preco13TextController1?.dispose();

    estoque13FocusNode1?.dispose();
    estoque13TextController1?.dispose();

    preco14FocusNode1?.dispose();
    preco14TextController1?.dispose();

    estoque14FocusNode1?.dispose();
    estoque14TextController1?.dispose();

    preco15FocusNode1?.dispose();
    preco15TextController1?.dispose();

    estoque15FocusNode1?.dispose();
    estoque15TextController1?.dispose();

    preco16FocusNode1?.dispose();
    preco16TextController1?.dispose();

    estoque16FocusNode1?.dispose();
    estoque16TextController1?.dispose();

    preco17FocusNode1?.dispose();
    preco17TextController1?.dispose();

    estoque17FocusNode1?.dispose();
    estoque17TextController1?.dispose();

    preco18FocusNode1?.dispose();
    preco18TextController1?.dispose();

    estoque18FocusNode1?.dispose();
    estoque18TextController1?.dispose();

    preco19FocusNode1?.dispose();
    preco19TextController1?.dispose();

    estoque19FocusNode1?.dispose();
    estoque19TextController1?.dispose();

    preco110FocusNode1?.dispose();
    preco110TextController1?.dispose();

    estoque110FocusNode1?.dispose();
    estoque110TextController1?.dispose();

    preco1FocusNode2?.dispose();
    preco1TextController2?.dispose();

    estoque1FocusNode2?.dispose();
    estoque1TextController2?.dispose();

    preco12FocusNode2?.dispose();
    preco12TextController2?.dispose();

    estoque12FocusNode2?.dispose();
    estoque12TextController2?.dispose();

    preco13FocusNode2?.dispose();
    preco13TextController2?.dispose();

    estoque13FocusNode2?.dispose();
    estoque13TextController2?.dispose();

    preco14FocusNode2?.dispose();
    preco14TextController2?.dispose();

    estoque14FocusNode2?.dispose();
    estoque14TextController2?.dispose();

    preco15FocusNode2?.dispose();
    preco15TextController2?.dispose();

    estoque15FocusNode2?.dispose();
    estoque15TextController2?.dispose();

    preco16FocusNode2?.dispose();
    preco16TextController2?.dispose();

    estoque16FocusNode2?.dispose();
    estoque16TextController2?.dispose();

    preco17FocusNode2?.dispose();
    preco17TextController2?.dispose();

    estoque17FocusNode2?.dispose();
    estoque17TextController2?.dispose();

    preco18FocusNode2?.dispose();
    preco18TextController2?.dispose();

    estoque18FocusNode2?.dispose();
    estoque18TextController2?.dispose();

    preco19FocusNode2?.dispose();
    preco19TextController2?.dispose();

    estoque19FocusNode2?.dispose();
    estoque19TextController2?.dispose();

    preco110FocusNode2?.dispose();
    preco110TextController2?.dispose();

    estoque110FocusNode2?.dispose();
    estoque110TextController2?.dispose();

    preco1FocusNode3?.dispose();
    preco1TextController3?.dispose();

    estoque1FocusNode3?.dispose();
    estoque1TextController3?.dispose();

    preco12FocusNode3?.dispose();
    preco12TextController3?.dispose();

    estoque12FocusNode3?.dispose();
    estoque12TextController3?.dispose();

    preco13FocusNode3?.dispose();
    preco13TextController3?.dispose();

    estoque13FocusNode3?.dispose();
    estoque13TextController3?.dispose();

    preco14FocusNode3?.dispose();
    preco14TextController3?.dispose();

    estoque14FocusNode3?.dispose();
    estoque14TextController3?.dispose();

    preco15FocusNode3?.dispose();
    preco15TextController3?.dispose();

    estoque15FocusNode3?.dispose();
    estoque15TextController3?.dispose();

    preco16FocusNode3?.dispose();
    preco16TextController3?.dispose();

    estoque16FocusNode3?.dispose();
    estoque16TextController3?.dispose();

    preco17FocusNode3?.dispose();
    preco17TextController3?.dispose();

    estoque17FocusNode3?.dispose();
    estoque17TextController3?.dispose();

    preco18FocusNode3?.dispose();
    preco18TextController3?.dispose();

    estoque18FocusNode3?.dispose();
    estoque18TextController3?.dispose();

    preco19FocusNode3?.dispose();
    preco19TextController3?.dispose();

    estoque19FocusNode3?.dispose();
    estoque19TextController3?.dispose();

    preco110FocusNode3?.dispose();
    preco110TextController3?.dispose();

    estoque110FocusNode3?.dispose();
    estoque110TextController3?.dispose();

    preco1FocusNode4?.dispose();
    preco1TextController4?.dispose();

    estoque1FocusNode4?.dispose();
    estoque1TextController4?.dispose();

    preco12FocusNode4?.dispose();
    preco12TextController4?.dispose();

    estoque12FocusNode4?.dispose();
    estoque12TextController4?.dispose();

    preco13FocusNode4?.dispose();
    preco13TextController4?.dispose();

    estoque13FocusNode4?.dispose();
    estoque13TextController4?.dispose();

    preco14FocusNode4?.dispose();
    preco14TextController4?.dispose();

    estoque14FocusNode4?.dispose();
    estoque14TextController4?.dispose();

    preco15FocusNode4?.dispose();
    preco15TextController4?.dispose();

    estoque15FocusNode4?.dispose();
    estoque15TextController4?.dispose();

    preco16FocusNode4?.dispose();
    preco16TextController4?.dispose();

    estoque16FocusNode4?.dispose();
    estoque16TextController4?.dispose();

    preco17FocusNode4?.dispose();
    preco17TextController4?.dispose();

    estoque17FocusNode4?.dispose();
    estoque17TextController4?.dispose();

    preco18FocusNode4?.dispose();
    preco18TextController4?.dispose();

    estoque18FocusNode4?.dispose();
    estoque18TextController4?.dispose();

    preco19FocusNode4?.dispose();
    preco19TextController4?.dispose();

    estoque19FocusNode4?.dispose();
    estoque19TextController4?.dispose();

    preco110FocusNode4?.dispose();
    preco110TextController4?.dispose();

    estoque110FocusNode4?.dispose();
    estoque110TextController4?.dispose();

    preco1FocusNode5?.dispose();
    preco1TextController5?.dispose();

    estoque1FocusNode5?.dispose();
    estoque1TextController5?.dispose();

    preco12FocusNode5?.dispose();
    preco12TextController5?.dispose();

    estoque12FocusNode5?.dispose();
    estoque12TextController5?.dispose();

    preco13FocusNode5?.dispose();
    preco13TextController5?.dispose();

    estoque13FocusNode5?.dispose();
    estoque13TextController5?.dispose();

    preco14FocusNode5?.dispose();
    preco14TextController5?.dispose();

    estoque14FocusNode5?.dispose();
    estoque14TextController5?.dispose();

    preco15FocusNode5?.dispose();
    preco15TextController5?.dispose();

    estoque15FocusNode5?.dispose();
    estoque15TextController5?.dispose();

    preco16FocusNode5?.dispose();
    preco16TextController5?.dispose();

    estoque16FocusNode5?.dispose();
    estoque16TextController5?.dispose();

    preco17FocusNode5?.dispose();
    preco17TextController5?.dispose();

    estoque17FocusNode5?.dispose();
    estoque17TextController5?.dispose();

    preco18FocusNode5?.dispose();
    preco18TextController5?.dispose();

    estoque18FocusNode5?.dispose();
    estoque18TextController5?.dispose();

    preco19FocusNode5?.dispose();
    preco19TextController5?.dispose();

    estoque19FocusNode5?.dispose();
    estoque19TextController5?.dispose();

    preco110FocusNode5?.dispose();
    preco110TextController5?.dispose();

    estoque110FocusNode5?.dispose();
    estoque110TextController5?.dispose();

    preco1FocusNode6?.dispose();
    preco1TextController6?.dispose();

    estoque1FocusNode6?.dispose();
    estoque1TextController6?.dispose();

    preco12FocusNode6?.dispose();
    preco12TextController6?.dispose();

    estoque12FocusNode6?.dispose();
    estoque12TextController6?.dispose();

    preco13FocusNode6?.dispose();
    preco13TextController6?.dispose();

    estoque13FocusNode6?.dispose();
    estoque13TextController6?.dispose();

    preco14FocusNode6?.dispose();
    preco14TextController6?.dispose();

    estoque14FocusNode6?.dispose();
    estoque14TextController6?.dispose();

    preco15FocusNode6?.dispose();
    preco15TextController6?.dispose();

    estoque15FocusNode6?.dispose();
    estoque15TextController6?.dispose();

    preco16FocusNode6?.dispose();
    preco16TextController6?.dispose();

    estoque16FocusNode6?.dispose();
    estoque16TextController6?.dispose();

    preco17FocusNode6?.dispose();
    preco17TextController6?.dispose();

    estoque17FocusNode6?.dispose();
    estoque17TextController6?.dispose();

    preco18FocusNode6?.dispose();
    preco18TextController6?.dispose();

    estoque18FocusNode6?.dispose();
    estoque18TextController6?.dispose();

    preco19FocusNode6?.dispose();
    preco19TextController6?.dispose();

    estoque19FocusNode6?.dispose();
    estoque19TextController6?.dispose();

    preco110FocusNode6?.dispose();
    preco110TextController6?.dispose();

    estoque110FocusNode6?.dispose();
    estoque110TextController6?.dispose();

    preco1FocusNode7?.dispose();
    preco1TextController7?.dispose();

    estoque1FocusNode7?.dispose();
    estoque1TextController7?.dispose();

    preco12FocusNode7?.dispose();
    preco12TextController7?.dispose();

    estoque12FocusNode7?.dispose();
    estoque12TextController7?.dispose();

    preco13FocusNode7?.dispose();
    preco13TextController7?.dispose();

    estoque13FocusNode7?.dispose();
    estoque13TextController7?.dispose();

    preco14FocusNode7?.dispose();
    preco14TextController7?.dispose();

    estoque14FocusNode7?.dispose();
    estoque14TextController7?.dispose();

    preco15FocusNode7?.dispose();
    preco15TextController7?.dispose();

    estoque15FocusNode7?.dispose();
    estoque15TextController7?.dispose();

    preco16FocusNode7?.dispose();
    preco16TextController7?.dispose();

    estoque16FocusNode7?.dispose();
    estoque16TextController7?.dispose();

    preco17FocusNode7?.dispose();
    preco17TextController7?.dispose();

    estoque17FocusNode7?.dispose();
    estoque17TextController7?.dispose();

    preco18FocusNode7?.dispose();
    preco18TextController7?.dispose();

    estoque18FocusNode7?.dispose();
    estoque18TextController7?.dispose();

    preco19FocusNode7?.dispose();
    preco19TextController7?.dispose();

    estoque19FocusNode7?.dispose();
    estoque19TextController7?.dispose();

    preco110FocusNode7?.dispose();
    preco110TextController7?.dispose();

    estoque110FocusNode7?.dispose();
    estoque110TextController7?.dispose();

    preco1FocusNode8?.dispose();
    preco1TextController8?.dispose();

    estoque1FocusNode8?.dispose();
    estoque1TextController8?.dispose();

    preco12FocusNode8?.dispose();
    preco12TextController8?.dispose();

    estoque12FocusNode8?.dispose();
    estoque12TextController8?.dispose();

    preco13FocusNode8?.dispose();
    preco13TextController8?.dispose();

    estoque13FocusNode8?.dispose();
    estoque13TextController8?.dispose();

    preco14FocusNode8?.dispose();
    preco14TextController8?.dispose();

    estoque14FocusNode8?.dispose();
    estoque14TextController8?.dispose();

    preco15FocusNode8?.dispose();
    preco15TextController8?.dispose();

    estoque15FocusNode8?.dispose();
    estoque15TextController8?.dispose();

    preco16FocusNode8?.dispose();
    preco16TextController8?.dispose();

    estoque16FocusNode8?.dispose();
    estoque16TextController8?.dispose();

    preco17FocusNode8?.dispose();
    preco17TextController8?.dispose();

    estoque17FocusNode8?.dispose();
    estoque17TextController8?.dispose();

    preco18FocusNode8?.dispose();
    preco18TextController8?.dispose();

    estoque18FocusNode8?.dispose();
    estoque18TextController8?.dispose();

    preco19FocusNode8?.dispose();
    preco19TextController8?.dispose();

    estoque19FocusNode8?.dispose();
    estoque19TextController8?.dispose();

    preco110FocusNode8?.dispose();
    preco110TextController8?.dispose();

    estoque110FocusNode8?.dispose();
    estoque110TextController8?.dispose();

    preco1FocusNode9?.dispose();
    preco1TextController9?.dispose();

    estoque1FocusNode9?.dispose();
    estoque1TextController9?.dispose();

    preco12FocusNode9?.dispose();
    preco12TextController9?.dispose();

    estoque12FocusNode9?.dispose();
    estoque12TextController9?.dispose();

    preco13FocusNode9?.dispose();
    preco13TextController9?.dispose();

    estoque13FocusNode9?.dispose();
    estoque13TextController9?.dispose();

    preco14FocusNode9?.dispose();
    preco14TextController9?.dispose();

    estoque14FocusNode9?.dispose();
    estoque14TextController9?.dispose();

    preco15FocusNode9?.dispose();
    preco15TextController9?.dispose();

    estoque15FocusNode9?.dispose();
    estoque15TextController9?.dispose();

    preco16FocusNode9?.dispose();
    preco16TextController9?.dispose();

    estoque16FocusNode9?.dispose();
    estoque16TextController9?.dispose();

    preco17FocusNode9?.dispose();
    preco17TextController9?.dispose();

    estoque17FocusNode9?.dispose();
    estoque17TextController9?.dispose();

    preco18FocusNode9?.dispose();
    preco18TextController9?.dispose();

    estoque18FocusNode9?.dispose();
    estoque18TextController9?.dispose();

    preco19FocusNode9?.dispose();
    preco19TextController9?.dispose();

    estoque19FocusNode9?.dispose();
    estoque19TextController9?.dispose();

    preco110FocusNode9?.dispose();
    preco110TextController9?.dispose();

    estoque110FocusNode9?.dispose();
    estoque110TextController9?.dispose();

    preco1FocusNode10?.dispose();
    preco1TextController10?.dispose();

    estoque1FocusNode10?.dispose();
    estoque1TextController10?.dispose();

    preco12FocusNode10?.dispose();
    preco12TextController10?.dispose();

    estoque12FocusNode10?.dispose();
    estoque12TextController10?.dispose();

    preco13FocusNode10?.dispose();
    preco13TextController10?.dispose();

    estoque13FocusNode10?.dispose();
    estoque13TextController10?.dispose();

    preco14FocusNode10?.dispose();
    preco14TextController10?.dispose();

    estoque14FocusNode10?.dispose();
    estoque14TextController10?.dispose();

    preco15FocusNode10?.dispose();
    preco15TextController10?.dispose();

    estoque15FocusNode10?.dispose();
    estoque15TextController10?.dispose();

    preco16FocusNode10?.dispose();
    preco16TextController10?.dispose();

    estoque16FocusNode10?.dispose();
    estoque16TextController10?.dispose();

    preco17FocusNode10?.dispose();
    preco17TextController10?.dispose();

    estoque17FocusNode10?.dispose();
    estoque17TextController10?.dispose();

    preco18FocusNode10?.dispose();
    preco18TextController10?.dispose();

    estoque18FocusNode10?.dispose();
    estoque18TextController10?.dispose();

    preco19FocusNode10?.dispose();
    preco19TextController10?.dispose();

    estoque19FocusNode10?.dispose();
    estoque19TextController10?.dispose();

    preco110FocusNode10?.dispose();
    preco110TextController10?.dispose();

    estoque110FocusNode10?.dispose();
    estoque110TextController10?.dispose();

    preco1FocusNode11?.dispose();
    preco1TextController11?.dispose();

    estoque1FocusNode11?.dispose();
    estoque1TextController11?.dispose();

    preco12FocusNode11?.dispose();
    preco12TextController11?.dispose();

    estoque12FocusNode11?.dispose();
    estoque12TextController11?.dispose();

    preco13FocusNode11?.dispose();
    preco13TextController11?.dispose();

    estoque13FocusNode11?.dispose();
    estoque13TextController11?.dispose();

    preco14FocusNode11?.dispose();
    preco14TextController11?.dispose();

    estoque14FocusNode11?.dispose();
    estoque14TextController11?.dispose();

    preco15FocusNode11?.dispose();
    preco15TextController11?.dispose();

    estoque15FocusNode11?.dispose();
    estoque15TextController11?.dispose();

    preco16FocusNode11?.dispose();
    preco16TextController11?.dispose();

    estoque16FocusNode11?.dispose();
    estoque16TextController11?.dispose();

    preco17FocusNode11?.dispose();
    preco17TextController11?.dispose();

    estoque17FocusNode11?.dispose();
    estoque17TextController11?.dispose();

    preco18FocusNode11?.dispose();
    preco18TextController11?.dispose();

    estoque18FocusNode11?.dispose();
    estoque18TextController11?.dispose();

    preco19FocusNode11?.dispose();
    preco19TextController11?.dispose();

    estoque19FocusNode11?.dispose();
    estoque19TextController11?.dispose();

    preco110FocusNode11?.dispose();
    preco110TextController11?.dispose();

    estoque110FocusNode11?.dispose();
    estoque110TextController11?.dispose();
  }
}
