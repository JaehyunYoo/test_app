import 'package:chat_app/core/services/preferences/nullable_prefs_item.dart';
import 'package:chat_app/core/services/preferences/preference_item.dart';

class Prefs {
  /// ex) static final re = NullablePrefsItem<String>(key);
  /// ex) static final dk = PreferenceItem<String>(key, default value setting);
  static final theme = PreferenceItem<bool>('theme', false);

  static final ddd = PreferenceItem<String>('ddd', '');

  static final et = NullablePrefsItem<String>('et');
}
