import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graduation_project/core/utilies/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/service_locator.dart';
import '../routing/routes.dart';
import 'cache_values.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<String?> getSecuredData({
    required String key,
  }) async {
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key);
  }

  static void logout() {
    CacheHelper.clearAllSecuredData();
    CacheHelper.removeData(key: CacheKeys.profileData);
    CacheHelper.removeData(key: CacheKeys.guestId);
  }

  static bool isEnglish() => getCurrentLanguage() == "en";

  static bool isLoggedIn = false;

  static Future<void> initializeLoginStatus() async {
    isLoggedIn = await condition();
  }

  static String initialRoute() {
    return passedOnBoarding
        ? isLoggedIn || isLoggedInAsGuest()
            ? Routes.mainLayoutScreen
            : Routes.loginScreen
        : Routes.getStartRoute;
  }

  static void changeLanguageToEn() async {
    await CacheHelper.saveData(key: CacheKeys.currentLanguage, value: "en");
  }

  static Future<bool> condition() async {
    return await CacheHelper.getSecuredData(key: CacheKeys.accessToken) !=
            null ||
        await CacheHelper.getSecuredData(key: CacheKeys.refreshToken) != null;
  }

  static String getCurrentLanguage() {
    return CacheHelper.getData(
          key: CacheKeys.currentLanguage,
        ) ??
        "ar";
  }

  static bool get isEn {
    return getIt.get<AppPreferences>().isEnglish();
  }

  static void changeLanguageToAr() async {
    await CacheHelper.saveData(key: CacheKeys.currentLanguage, value: "ar");
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value is String) return await sharedPreferences.setString(key, value);
      if (value is int) return await sharedPreferences.setInt(key, value);
      if (value is bool) return await sharedPreferences.setBool(key, value);
      return await sharedPreferences.setDouble(key, value);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }

  static clearAllSecuredData() async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint("// All Secured Data Cleared");
    await flutterSecureStorage.deleteAll();
  }

  // Utilities
  static String getDeviceToken() {
    return CacheHelper.getData(
          key: CacheKeys.deviceToken,
        ) ??
        "";
  }

  static String? getGuestId() {
    return CacheHelper.getData(
      key: CacheKeys.guestId,
    );
  }

  static String getDeviceType() {
    switch (Platform.isAndroid) {
      case false:
        return "IOS";
      case true:
        return "Android";
      }
  }

  static saveAccessToken({required String accessToken}) {
    const flutterSecureStorage = FlutterSecureStorage();
    return flutterSecureStorage.write(
        key: CacheKeys.accessToken, value: accessToken);
  }

  static saveRefreshToken({required String refreshToken}) {
    const flutterSecureStorage = FlutterSecureStorage();

    return flutterSecureStorage.write(
        key: CacheKeys.refreshToken, value: refreshToken);
  }

  static Future<bool> saveGuestId({required String saveGuestId}) {
    return CacheHelper.saveData(key: CacheKeys.guestId, value: saveGuestId);
  }

  static bool isLoggedInAsGuest() {
    return getGuestId() != null;
  }

  static bool get passedOnBoarding {
    return CacheHelper.getData(key: CacheKeys.getStartedFinished) == true;
  }

  static Future<bool> saveListData(String key, List<String> value) async {
    return sharedPreferences.setStringList(
      key,
      value,
    );
  }

  static List<String> getListData(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  static Future<bool> saveProfileData(String profileData) {
    return CacheHelper.saveData(key: CacheKeys.profileData, value: profileData);
  }

  static String getProfileData() {
    return CacheHelper.getData(key: CacheKeys.profileData) ?? "";
  }
}
