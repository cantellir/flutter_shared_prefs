import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_prefs/src/shared_prefs_impl.dart';

void main() {
  late SharedPrefsImpl sut;

  final fakeKey = 'fakeKey';
  final fakeValue = 'fakeValue';

  setUp(() {
    sut = SharedPrefsImpl();
    SharedPreferences.setMockInitialValues({
      fakeKey: fakeValue,
    });
  });

  test('Should return a unique instance of SharedPrefs', () async {
    await sut.init();

    var anotherSharedPrefs = SharedPrefsImpl();

    expect(identical(sut, anotherSharedPrefs), true);
  });

  test('Should return correct fake value', () async {
    await sut.init();

    var getValue = sut.getString(fakeKey);

    expect(getValue, fakeValue);
  });

  test('Should write correct value', () async {
    await sut.init();

    var anotherFakeValue = 'anotherFakeValue';

    await sut.setString(fakeKey, anotherFakeValue);

    var getValue = sut.getString(fakeKey);

    expect(getValue, anotherFakeValue);
  });
}
