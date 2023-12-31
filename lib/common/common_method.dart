import 'package:shared_preferences/shared_preferences.dart';

class CommonMethod {
  Future saveUserLoginsDetails(
    int id,
    String name,
    String email,
    String password,
    String token,
    bool loginStatus,
    String gender,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", id);
    prefs.setString("name", name);
    prefs.setString("email", email);
    // prefs.setString('birth_date', birthDate);
    prefs.setString("gender", gender);
    prefs.setString("password", password);
    prefs.setString("access_token", token);
    prefs.setBool("loginStatus", loginStatus);
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setBool("loginStatus", false);
  }

  // Future getUserLoginDetail() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setInt("id", id);
  //   prefs.setString("name", name);
  //   prefs.setString("email", email);
  //   prefs.setString("password", password);
  //   prefs.setString("access_token", token);
  //   prefs.setBool("loginStatus", loginStatus);
  // }
}
