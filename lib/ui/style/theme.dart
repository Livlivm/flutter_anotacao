import 'package:flutter/material.dart';
import 'colors.dart';

abstract class AppTheme {
  static final ValueNotifier<ThemeMode> modo = ValueNotifier(ThemeMode.light);

  static void alternarTema() {
    if (modo.value == ThemeMode.light) {
      modo.value = ThemeMode.dark;
    } else {
      modo.value = ThemeMode.light;
    }
  }

  static ThemeData temaClaro = ThemeData(
    useMaterial3: true,
    fontFamily: 'DancingScript',

    scaffoldBackgroundColor: AppColors.c1,

    colorScheme: const ColorScheme.light(
      primary: AppColors.c4,
      secondary: AppColors.c2,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.c2,
      foregroundColor: AppColors.c5,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.c5,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'DancingScript',
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.c4,
      foregroundColor: Colors.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.c4,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: const TextStyle(
          fontFamily: 'DancingScript',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.c3),
        borderRadius: BorderRadius.circular(18),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.c4, width: 2),
        borderRadius: BorderRadius.circular(18),
      ),

      hintStyle: const TextStyle(
        color: AppColors.c3,
        fontFamily: 'DancingScript',
        fontSize: 18,
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    dialogTheme: const DialogThemeData(
      backgroundColor: Colors.white,

      titleTextStyle: TextStyle(
        color: AppColors.c5,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: 'DancingScript',
      ),

      contentTextStyle: TextStyle(
        color: AppColors.c5,
        fontSize: 20,
        fontFamily: 'DancingScript',
      ),
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.c4,
      textColor: AppColors.c5,

      titleTextStyle: TextStyle(
        color: AppColors.c5,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'DancingScript',
      ),
    ),
  );

  static ThemeData temaEscuro = ThemeData(
    useMaterial3: true,
    fontFamily: 'DancingScript',
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.c5,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.c2,
      secondary: AppColors.c3,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.c5,
      foregroundColor: AppColors.c2,
      centerTitle: true,

      titleTextStyle: TextStyle(
        color: AppColors.c1,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'DancingScript',
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.c2,
      foregroundColor: AppColors.c5,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.c2,
        foregroundColor: AppColors.c5,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        textStyle: const TextStyle(
          fontFamily: 'DancingScript',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF5A3949),
      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    dialogTheme: const DialogThemeData(
      backgroundColor: Color(0xFF5A3949),

      titleTextStyle: TextStyle(
        color: AppColors.c1,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: 'DancingScript',
      ),

      contentTextStyle: TextStyle(
        color: AppColors.c1,
        fontSize: 20,
        fontFamily: 'DancingScript',
      ),
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.c2,
      textColor: AppColors.c1,

      titleTextStyle: TextStyle(
        color: AppColors.c1,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'DancingScript',
      ),
    ),
  );
}
