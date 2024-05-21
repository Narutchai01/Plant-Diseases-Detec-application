import 'package:shared_preferences/shared_preferences.dart';

class SharePreferrences  {
  void saveToken(String token) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("token", token);
  }
  void saveId(int id) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("id", id);
  }
  Future<String?> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("token");
  }
  Future<int?> getId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getInt("id");
  }
  void removeToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("token");
  }
  void removeId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("id");
  }
}