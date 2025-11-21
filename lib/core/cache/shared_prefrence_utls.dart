import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceUtls {
  static late SharedPreferences sharedPref;

  static Future<SharedPreferences> init() async {
    return sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is int) {
      return sharedPref.setInt(key, value);
    } else if (value is double) {
      return sharedPref.setDouble(key, value);
    } else if (value is String) {
      return sharedPref.setString(key, value);
    } else if (value is List<String>) {
      return sharedPref.setStringList(key, value);
    } else {
      return sharedPref.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    return sharedPref.get(key);
  }
}
