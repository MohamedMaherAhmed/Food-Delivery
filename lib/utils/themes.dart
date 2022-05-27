import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF2D2D3A),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFFE724C),
      disabledColor: Color(0xFF393948),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFFE724C),
      disabledColor: Colors.white,
    ),
  );
}
