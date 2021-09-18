abstract class SharedPrefs {
  Future<void> init();
  Future<void> setString(String key, String value);
  String? getString(String key);
}
