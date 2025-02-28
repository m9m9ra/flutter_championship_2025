import 'package:flutter/cupertino.dart';

class ColorSettings {
  Color red = const Color.fromRGBO(248, 114, 101, 1);

  Color accent = const Color.fromRGBO(72, 178, 231, 1);

  Color disable = const Color.fromRGBO(43, 107, 139, 1);

  Color subTextLight = const Color.fromRGBO(216, 216, 216, 1);

  Color background = const Color.fromRGBO(247, 247, 249, 1);

  Color block = const Color.fromRGBO(255, 255, 255, 1);

  Color text = const Color.fromRGBO(43, 43, 43, 1);

  Color hint = const Color.fromRGBO(106, 106, 106, 1);

  Color subTextDark = const Color.fromRGBO(112, 123, 129, 1);

  ColorSettings._privateConstructor();

  static final ColorSettings _instance = ColorSettings._privateConstructor();

  factory ColorSettings () {
    return _instance;
  }
}