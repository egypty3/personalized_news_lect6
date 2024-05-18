import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class DataHandler{
  Future<void> setStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  Future<void> clearAllPrefrences() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}