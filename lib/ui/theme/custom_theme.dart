import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomTheme {
  AppTheme defaultTheme() {
    return AppTheme(
      id: 'default_theme',
      description: 'The default color theme',
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

   AppTheme greenTheme() {
    return AppTheme(
      id: 'green_theme',
      description: 'Green dark color theme',
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Color.fromARGB(255, 5, 196, 107),
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 39, 46),
        canvasColor: Color.fromARGB(255, 72, 84, 96),
        dividerColor: Color.fromARGB(255, 210, 218, 226),
      ),
    );
  }
}