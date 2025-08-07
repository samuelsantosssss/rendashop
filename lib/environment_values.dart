import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _branchHostURL = data['branchHostURL'];
      _branchKey = data['branchKey'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _branchHostURL = '';
  String get branchHostURL => _branchHostURL;

  String _branchKey = '';
  String get branchKey => _branchKey;
}
