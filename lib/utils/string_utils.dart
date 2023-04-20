import 'dart:ui';

import 'package:solid_test/utils/utils.dart';

///String formatting class
class StringUtils {
  ///Converts the list to a string and adds hex color prefix to it.
  static String addColorPrefix(List<String> value) {
    return '$kColorPrefix${value.join()}';
  }

  /// returns the hex color
  static Color parseColor(String value) {
    return Color(int.parse(value));
  }
}
