import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefUtils {

  static saveStr(String empkey) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var empkey;
    print(empkey);
    pref.setString(empkey, empkey);
  }

  static readPrefStr() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('empkey');
  }

}