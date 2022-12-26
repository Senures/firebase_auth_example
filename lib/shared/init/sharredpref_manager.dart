import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    log(" ==== SHARED PREFERENCE CREATED === ");
    return _prefs!;
  }

  static bool getBool(String key) => _prefs!.getBool(key)!;

  static Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);

  static Future<bool> remove(String key) async => await _prefs!.remove(key);
}
