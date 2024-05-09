import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class StroageUtil {
  late SharedPreferences pref;

  saveString(String key, String value) async {
    try {
      pref = await SharedPreferences.getInstance();
      pref.setString(key, value);
      log(pref.getString(key)!);
    } catch (e) {
      log(e.toString());
    }
  }

  saveStringList(String key, List<String> value) async {
    try {
      pref = await SharedPreferences.getInstance();
      pref.setStringList(key, value);
    } catch (e) {
      log(e.toString());
    }
  }

  getString(String key) async {
    pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  getStringList(String key) async {
    pref = await SharedPreferences.getInstance();
    return pref.getStringList(key);
  }

  saveInt(String key, int value) async {
    pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
    log(value.toString());
  }

  getInt(String key) async {
    pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  saveBoolean(String key, bool value) async {
    pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
    log(value.toString());
  }

  getBoolean(String key) async {
    pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  remove(String key) async {
    pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }

  contains(String key) async {
    pref = await SharedPreferences.getInstance();
    return pref.containsKey(key);
  }
}
