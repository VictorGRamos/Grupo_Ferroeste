import 'package:flutter/material.dart';
import 'theme_colors.dart';

ThemeData mainTheme = ThemeData(

  primarySwatch: Colors.blue,
  primaryColor: MainThemeColors.primaryColor,
  brightness: Brightness.dark,
  fontFamily: 'Open Sans',

);

class Font {

  static var titleFont = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static var sumRowFont = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  
}