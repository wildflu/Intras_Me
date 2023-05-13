

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes extends GetxController{
  static ThemeData thetheme = CustumLight;

  static ThemeData CustumDark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0
    ),
    scaffoldBackgroundColor: Colors.black12,

  );

  static ThemeData CustumLight = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0
    ),
    scaffoldBackgroundColor: Colors.white,
  );
  
}