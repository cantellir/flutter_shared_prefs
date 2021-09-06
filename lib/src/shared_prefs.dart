abstract class SharedPrefs {
  Future<void> init();
  void setString(String key, String value);
  String? getString(String key);
}
