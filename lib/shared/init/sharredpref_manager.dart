import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceManager {
  static SharedPrefrenceManager? _instance;
  SharedPreferences? pref;

  static SharedPrefrenceManager get instance {
    if (_instance == null) {
      _instance = SharedPrefrenceManager._init();
      return _instance!;
    }
    return _instance!;
  }

  SharedPrefrenceManager._init() {
    SharedPreferences.getInstance().then((value) {
      pref = value;
    });
  }
}

class Pref {
  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static bool getBool(String key) => _prefs!.getBool(key)!;

  static Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);

  static Future<bool> remove(String key) async => await _prefs!.remove(key);
}
