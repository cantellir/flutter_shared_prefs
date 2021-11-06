import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefs/shared_prefs.dart';
import 'package:shared_prefs/src/shared_prefs.dart';

class SharedPrefsImpl implements SharedPrefs {
  SharedPreferences? _preferences;

  SharedPrefsImpl();

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String? getString(String key) {
    _verifyInitAssert();
    return _preferences!.getString(key);
  }

  @override
  Future<void> setString(String key, String value) {
    _verifyInitAssert();
    return _preferences!.setString(key, value);
  }

  void _verifyInitAssert() {
    assert(_preferences != null, 'init() was not called');
  }
}
