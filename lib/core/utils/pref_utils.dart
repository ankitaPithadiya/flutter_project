import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return await prefs.setBool(key, value);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static Future<bool?>? putObject(String key, Object value) async {
    var prefs = await _instance;
    return prefs.setString(key, json.encode(value));
  }

  static Future<bool>? clear() {
    if (_prefsInstance == null) return null;
    return _prefsInstance?.clear();
  }

  static Future<void>? reload() {
    if (_prefsInstance == null) return null;
    return _prefsInstance?.reload();
  }

  String getThemeData() {
    try {
      return _prefsInstance!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setThemeData(String value) {
    return _prefsInstance!.setString('themeData', value);
  }
}
