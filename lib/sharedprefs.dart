import 'package:shared_preferences/shared_preferences.dart';

class sharedpref {
  static savedata(String key, String data) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(key, data);
  }

  static getdata(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  static cleardata() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
