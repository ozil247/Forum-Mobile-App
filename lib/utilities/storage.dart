import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences prefs;

  LocalStorageService(this.prefs);

  Future<void> setString(String name, value) async {
    prefs.setString("forum_$name", value);
  }

  String? getString(String name) {
    return prefs.getString("forum_$name");
  }

  Future<void> setDouble(String name, value) async {
    prefs.setDouble("forum_$name", value);
  }

  Future<void> setInt(String name, value) async {
    prefs.setInt("forum_$name", value);
  }

  int? getInt(String name) {
    return prefs.getInt("forum_$name");
  }

  double? getDouble(String name) {
    return prefs.getDouble("forum_$name");
  }
}