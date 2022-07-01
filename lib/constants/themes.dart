import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme baseTextTheme = TextTheme(
  displayLarge: TextStyle(),
);

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    actionsIconTheme: IconThemeData(color: Colors.white)
  ),
  backgroundColor: Colors.green,
  // bannerTheme: MaterialBannerThemeData(),
  bottomAppBarColor: Colors.white,
  // bottomAppBarTheme: BottomAppBarTheme(),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(),
  // bottomSheetTheme: BottomSheetThemeData(),
  brightness: Brightness.light,
  // buttonBarTheme: ButtonBarThemeData(),
  // buttonTheme: ButtonThemeData(),
  canvasColor: Colors.white,
  cardColor: Color(0xfff5f5f5),
  // cardTheme: CardTheme(),
  // checkboxTheme: CheckboxThemeData(),
  // chipTheme: ChipThemeData(),
  // colorScheme: ColorScheme(),
  // dataTableTheme: DataTableThemeData(),
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  primaryColorDark: Colors.blue[800],
  primaryColorLight: Colors.blue[200],
  fontFamily: GoogleFonts.poppins().fontFamily,
);