import 'package:alpha/constants/shared_prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<bool> checkUserIsAuthenticated() async {
    String token = await SharedPreferencesHelper.getToken();
    print('TOKEN: $token');
    return token.isNotEmpty && token != 'null';
  }

  static Future<bool> checkIfVerified() async {
    String status = await SharedPreferencesHelper.getStatus();
    print('Status: $status');
    return status != 'pending' && status != 'null';
  }

  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await Future.wait([
      sharedPreferences.setString(SharedPreferencesConstants.tokenKey, ''),
      sharedPreferences.setString(SharedPreferencesConstants.statusKey, ''),
      sharedPreferences.setString(SharedPreferencesConstants.userNameKey, '')
    ]);
  }

  static Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences
        .getString(SharedPreferencesConstants.tokenKey)
        .toString();
    return token;
  }

  static Future<String> getStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String status = sharedPreferences
        .getString(SharedPreferencesConstants.statusKey)
        .toString();
    return status;
  }

  static Future<void> verify() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences
        .setString(SharedPreferencesConstants.statusKey, 'verified')
        .toString();
  }

  static Future<void> setBoardingViewed(bool val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(SharedPreferencesConstants.statusKey, val);
  }

  static Future<bool> checkOnBoardingViewed() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool viewedOnBoarding =
        sharedPreferences.getBool(SharedPreferencesConstants.onBoarding) ??
            false;
    return viewedOnBoarding;
  }
}
