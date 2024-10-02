import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/assets/color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      textTheme:
          GoogleFonts.robotoTextTheme(Theme.of(context).textTheme).copyWith(
        titleLarge: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: Colors.blueAccent, secondary: Colors.blue),
    );
  }
}
