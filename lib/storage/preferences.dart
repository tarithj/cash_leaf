import 'package:shared_preferences/shared_preferences.dart';

class PreferenceBox {
  late SharedPreferences prefs;

  Future<void> loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setCurrencySuffix(String suffix) async {
    await prefs.setString("currencySuffix", suffix);
  }

  String? getCurrencySuffix() {
    return prefs.getString("currencySuffix");
  }

}
