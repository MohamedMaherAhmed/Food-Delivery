import 'package:flutter/material.dart';
import 'package:food_delivery/utils/route_generator.dart';
import 'package:food_delivery/utils/themes.dart';

void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.system,
    theme: MyThemes.lightTheme,
    darkTheme: MyThemes.darkTheme,
    initialRoute: 'SplashScreen',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
