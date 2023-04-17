import 'package:flutter/material.dart';
import 'package:goomba/theme/theme.dart';

ThemeData generateThemeData({
  required Brightness brightness,
  required Color primary,
  required Color background,
  required Color card,
  required Color text,
}) {
  return ThemeData(
    splashColor: Colors.transparent,
    brightness: brightness,
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    cardColor: card,
    appBarTheme: AppBarTheme(
      elevation: 1,
      centerTitle: true,
      color: background,
      iconTheme: IconThemeData(
        color: text,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: text,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 1,
      color: background,
      padding: const EdgeInsets.all(kSafeArea),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: background,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: text,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: text,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: text,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: text,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ).apply(),
  );
}
