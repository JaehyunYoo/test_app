import 'package:chat_app/core/services/preferences/preference_item.dart';

class NullablePrefsItem<T> extends PreferenceItem<T?> {
  NullablePrefsItem(String key, [T? defaultValue]) : super(key, defaultValue);
}
