import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ValueNotifier<bool> {
  AuthController._() : super(false);

  static final AuthController instance = AuthController._();

  static const _prefsKey = 'flowee_is_logged_in';

///dipanggil sekali saat aplikasi baru di buka (muncul splashscreen),
///untuk  membaca status login yang tersimpan dari sesi SEBELUMNYA
  Future<void> loadPersistedSession() async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(_prefsKey) ?? false;
  }

  Future<void> login() async {
    value = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, true);
  }

//OUT CONTROLLER
  Future<void> logout() async {
    value  = false;
    final perfs = await SharedPreferences.getInstance();
    await perfs.setBool(_prefsKey, false);
  }
}