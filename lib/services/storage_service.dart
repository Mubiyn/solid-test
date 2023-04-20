import 'package:shared_preferences/shared_preferences.dart';

/// Base class for the local preferences
class StorageService {
  /// initialize shared preferences
  static Future<void> init() async {
    final preferences = await SharedPreferences.getInstance();

    // set a default value if the key doesn't exist
    if (!preferences.containsKey('color')) {
      await preferences.setString('color', '0xffFFFFFF');
    }
  }

  /// get last color from local preferences
  static Future<String> getString() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getString('color') ?? '0xffFFFFFF';
  }

  /// save last color to local preferences
  static Future<void> setString(String value) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('color', value);
  }
}
