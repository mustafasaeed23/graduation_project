import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cache_helper/cache_helper.dart';
import '../cache_helper/cache_values.dart';
import 'language.dart';

const String prefsKeyLang = 'prefsKeyLang';
// const String prefsKeyToken = 'prefsKeyToken';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String language = _sharedPreferences.getString(prefsKeyLang) ??
        LanguageType.english.getValue();
    return language;
  }

  bool isEnglish() => getCurrentLanguage() == "en";
  String getCurrentLanguage() {
    return _sharedPreferences.getString(
          prefsKeyLang,
        ) ??
        "en";
  }


  Future<void> changeAppLanguage(String currentLang) async {
    _sharedPreferences.setString(prefsKeyLang, currentLang);
  }

  Future<Locale> getLocale() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  bool isLight() => getTheme() == "light";

  String getTheme() {
    return CacheHelper.getData(key: CacheKeys.theme) ?? "light";
  }

  Future<void> setTheme(String mode) async =>
      CacheHelper.saveData(key: CacheKeys.theme, value: mode);
}
