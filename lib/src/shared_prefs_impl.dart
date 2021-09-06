import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefs/shared_prefs.dart';
import 'package:shared_prefs/src/shared_prefs.dart';

class SharedPrefsImpl implements SharedPrefs {
  SharedPreferences? _preferences;

  static final SharedPrefsImpl _sharedPrefsImpl = SharedPrefsImpl._internal();

  factory SharedPrefsImpl() {
    return _sharedPrefsImpl;
  }

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  SharedPrefsImpl._internal();

  @override
  String? getString(String key) {
    return _preferences!.getString(key);
  }

  @override
  void setString(String key, String value) {
    _preferences!.setString(key, value);
  }
}
