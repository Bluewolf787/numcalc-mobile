import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomTheme {
  AppTheme darkTheme() {
    return AppTheme(
      id: 'dark_theme',
      description: 'Custom dark color theme',
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Color.fromARGB(255, 245, 59, 87),
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 39, 46),
        canvasColor: Color.fromARGB(255, 72, 84, 96),
        dividerColor: Color.fromARGB(255, 210, 218, 226),
      ),
    );
  }
}