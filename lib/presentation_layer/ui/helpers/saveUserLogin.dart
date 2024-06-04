import 'package:shared_preferences/shared_preferences.dart';

class SaveUserLogin {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setId(String id) {
    prefs.setString("id", id);
  }

  static setUserData(String email, String password) {
    prefs.setString("email", email);
    prefs.setString("password", password);
  }

  static String getId() {
    return prefs.getString("id") ?? "";
  }

  static String getEmail() {
    return prefs.getString("email") ?? "";
  }

  static String getPassword() {
    return prefs.getString("password") ?? "";
  }

  static logout() {
    prefs.clear();
  }
  // static setAddress(String details , String city) {
  //   prefs.setString("details", details);
  //   prefs.setString("city", city);
  // }

  // static setMobileNum(String mobileNum) {
  //   prefs.setString("mobileNum", mobileNum);
  // }

  // static String getAddress() {
  //   return prefs.getString("details") ?? "";
  // }

  // static String getMobileNum() {
  //   return prefs.getString("mobileNum") ?? "";
  // }

  // static void saveData(String key, dynamic value) {
  //   Map<String, dynamic> dataMap = prefs.getString('dataMap') != null
  //       ? Map<String, dynamic>.from(jsonDecode(prefs.getString('dataMap')!))
  //       : {};
  //   dataMap[key] = value;
  //   prefs.setString('dataMap', jsonEncode(dataMap));
  // }
  //
  // static Map<String, dynamic> getDataMap() {
  //   SharedPreferences prefs =
  //   SharedPreferences.getInstance() as SharedPreferences;
  //   String? jsonString = prefs.getString('dataMap');
  //   Map<String, dynamic> dataMap = jsonString != null
  //       ? Map<String, dynamic>.from(jsonDecode(jsonString))
  //       : {};
  //   return dataMap;
  // }
}
