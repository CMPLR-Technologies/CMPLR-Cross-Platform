import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Hilds the themes of the app
class CMPLRTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static IconThemeData lightIconTheme = const IconThemeData(
    color: Colors.grey,
  );

  static IconThemeData darkIconTheme = const IconThemeData(
    color: Colors.white,
  );

  static ThemeData trueBlue() {
    return ThemeData(
        iconTheme: lightIconTheme,
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: TextStyle(color: Colors.black),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(0xFF, 0, 26, 53),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        canvasColor: const Color.fromARGB(
            0xFF, 0, 26, 53), //related to the BottomNavigationBarThemeData
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
        ),
        textTheme: lightTextTheme,
        scaffoldBackgroundColor: Colors.white,
        secondaryHeaderColor: Colors.blue[700]);
  }

  static ThemeData darkTheme() {
    return ThemeData(
        iconTheme: darkIconTheme,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          toolbarTextStyle: TextStyle(color: Colors.white),
          foregroundColor: Colors.black,
          backgroundColor: Colors.black,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        canvasColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        textTheme: darkTextTheme,
        scaffoldBackgroundColor: const Color.fromARGB(0xFF, 34, 34, 34),
        secondaryHeaderColor: Colors.blue[700]);
  }
}
