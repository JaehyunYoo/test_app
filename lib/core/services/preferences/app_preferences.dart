import 'package:chat_app/core/services/preferences/preference_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String prefix = 'AppPreference';

  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    return;
  }

  static String getPreKey(PreferenceItem item) {
    return '${AppPreferences.prefix}${item.key}';
  }

  // is null check
  static bool isNullable<T>() => null is T;

  ///
  /// set and update shared_preference
  ///
  static Future<bool> setValue<T>(PreferenceItem<T> item, T? value) async {
    // key prefix make
    final String key = getPreKey(item);
    // null check
    final isNull = isNullable<T>();

    if (isNull && value == null) {
      // null setting remove nit it 이면 변경해서 써도됨
      return _prefs.remove(item.key);
    }

    if (isNull) {
      switch (T.toString()) {
        case "int?":
          return _prefs.setInt(key, value as int);
        case "String?":
          return _prefs.setString(key, value as String);
        case "double?":
          return _prefs.setDouble(key, value as double);
        case "bool?":
          return _prefs.setBool(key, value as bool);
        case "List<String>?":
          return _prefs.setStringList(key, value as List<String>);
        case "DateTime?":
          return _prefs.setString(key, (value as DateTime).toIso8601String());
        default:
          throw Exception('$T 타입에 대한 저장을 함수로 만들어서 추가 해주세요.');
      }
    } else {
      switch (T) {
        case int:
          return _prefs.setInt(key, value as int);
        case String:
          return _prefs.setString(key, value as String);
        case double:
          return _prefs.setDouble(key, value as double);
        case bool:
          return _prefs.setBool(key, value as bool);
        case const (List<String>):
          return _prefs.setStringList(key, value as List<String>);
        case DateTime:
          return _prefs.setString(key, (value as DateTime).toIso8601String());
        default:
          throw Exception('$T 타입에 대한 저장을 함수로 만들어서 추가 해주세요.');
      }
    }
  }

  ///
  /// delete shared_preference
  ///
  static Future<bool> deleteValue<T>(PreferenceItem<T> item) async {
    final String key = getPreKey(item);
    return _prefs.remove(key);
  }

  ///
  /// get value shared_preference
  ///
  static T getValue<T>(PreferenceItem<T> item) {
    final String key = getPreKey(item);

    bool isNullableType = isNullable<T>();
    if (isNullableType) {
      switch (T.toString()) {
        case "int?":
          return _prefs.getInt(key) as T? ?? item.defaultValue;
        case "String?":
          return _prefs.getString(key) as T? ?? item.defaultValue;
        case "double?":
          return _prefs.getDouble(key) as T? ?? item.defaultValue;
        case "bool?":
          return _prefs.getBool(key) as T? ?? item.defaultValue;
        case "const (List<String>)?":
          return _prefs.getStringList(key) as T? ?? item.defaultValue;
        default:
          return transform(T, _prefs.getString(key)) ?? item.defaultValue;
      }
    } else {
      switch (T) {
        case int:
          return _prefs.getInt(key) as T? ?? item.defaultValue;
        case String:
          return _prefs.getString(key) as T? ?? item.defaultValue;
        case double:
          return _prefs.getDouble(key) as T? ?? item.defaultValue;
        case bool:
          return _prefs.getBool(key) as T? ?? item.defaultValue;
        case const (List<String>):
          return _prefs.getStringList(key) as T? ?? item.defaultValue;
        default:
          return transform(T, _prefs.getString(key)) ?? item.defaultValue;
      }
    }
  }

  static T? transform<T>(Type t, String? value) {
    if (value == null) {
      return null;
    }

    bool isNullableType = isNullable<T>();
    if (isNullableType) {
      switch (t.toString()) {
        // case "String?":
        //   return value as T;
        case "DateTime?":
          return DateTime.parse(value) as T?;
        default:
          throw Exception('$t 타입에 대한 transform 함수를 추가 해주세요.');
      }
    } else {
      switch (t) {
        case DateTime:
          return DateTime.parse(value) as T?;
        default:
          throw Exception('$t 타입에 대한 transform 함수를 추가 해주세요.');
      }
    }
  }
}
