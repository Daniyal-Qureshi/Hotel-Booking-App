import "package:shared_preferences/shared_preferences.dart";

class Store {
  static signupsave(String name, String email, String password) async {
    print("hello  ");
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setStringList(email, [password, name]);
  }

  static getData(String email, String password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    if (_preferences.getStringList(email) == null ||
        _preferences.getStringList(email)[0] != password)
      _preferences.setBool("login", false);
    else if (_preferences.getStringList(email)[0] == password) {
      _preferences.setBool("login", true);
      _preferences.setString("current", email);
    } else
      _preferences.setBool("login", false);
  }

  static Future<bool> status() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool("login");
  }

  static Future<String> getEmail() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString("current");
  }

  static Future<List> getName() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getStringList(_preferences.getString("current"));
  }
}
