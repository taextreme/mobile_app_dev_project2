import 'package:shared_preferences/shared_preferences.dart';

class UserUpdateData {
  static late SharedPreferences _preferences;
  static const String dateKey = "updateDate";
  static const String lastUpdateKey = "lastUpdate";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setLastUpdateData(String data) async {
    _preferences.setString(lastUpdateKey, data);
  }

  static String getLastUpdateData() {
    return _preferences.getString(lastUpdateKey) ?? "01:00";
  }

  static Future setDate(String data) async {
    _preferences.setString(dateKey, data);
  }

  static String getDate() {
    return _preferences.getString(dateKey) ?? "/00/00/0000";
  }
}
