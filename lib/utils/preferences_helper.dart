import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> removeAll() async {
    final SharedPreferences prefs = await _getSharedPreferences();
    prefs.clear();
  }

  Future<void> remove(String key) async {
    final SharedPreferences prefs = await _getSharedPreferences();
    prefs.remove(key);
  }

  Future<String> getString(String key) async {
    final pref = await _getSharedPreferences();
    return pref.getString(key) ?? '';
  }

  Future<void> setString(String key, String value) async {
    final pref = await _getSharedPreferences();
    pref.setString(key, value);
  }

  Future<int> getInt(String key) async {
    final pref = await _getSharedPreferences();
    return pref.getInt(key) ?? 0;
  }

  Future<void> setInt(String key, int value) async {
    final pref = await _getSharedPreferences();
    pref.setInt(key, value);
  }

  Future<double> getDouble(String key) async {
    final pref = await _getSharedPreferences();
    return pref.getDouble(key) ?? 0.0;
  }

  Future<void> setDouble(String key, double value) async {
    final pref = await _getSharedPreferences();
    pref.setDouble(key, value);
  }

  Future<bool> getBool(String key) async {
    final pref = await _getSharedPreferences();
    return pref.getBool(key) ?? false;
  }

  Future<void> setBool(String key, bool value) async {
    final pref = await _getSharedPreferences();
    pref.setBool(key, value);
  }
}

abstract class PreferencesKey {
  static const reminderStatus = "reminderStatus";
}