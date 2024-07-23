import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData themeMain = ThemeData(
    primaryColor: Color.fromARGB(255, 205, 19, 19),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color.fromARGB(255, 240, 240, 240),
    cardColor: Colors.white,
    errorColor: Color.fromARGB(255, 205, 19, 19),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 205, 19, 19),
            textStyle: TextStyle(
                fontSize: 16, fontFamily: 'inter', fontWeight: FontWeight.w700),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)))),
                shadowColor: Color.fromARGB(63, 0, 0, 0),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 48,
            color: Colors.black,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic),
        titleMedium: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,height: 1.125),
        labelLarge: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'inter'),
        labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: 'inter'),
        labelSmall: TextStyle(
            fontFamily: 'inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 205, 19, 19)),
        bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'inter',
            color: Color.fromARGB(255, 255, 255, 255)),
        bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'inter',
            color: Color.fromARGB(255, 205, 19, 19)),
        displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'montserrat',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700),
        titleSmall: TextStyle(
            fontFamily: 'inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        
        ));
