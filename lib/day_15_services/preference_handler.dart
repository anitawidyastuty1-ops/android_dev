import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static late SharedPreferences _prefs;

  // Inisialisasi Shared Preferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Menyimpan status login
  static Future<void> setLogin(bool value) async {
    await _prefs.setBool('isLogin', value);
  }

  // Mengambil status login
  static bool get isLogin {
    return _prefs.getBool('isLogin') ?? false;
  }
}
