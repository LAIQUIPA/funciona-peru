import 'package:flutter/material.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:funciona_peru/theme/theme_text.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
    textTheme: darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(15),
            backgroundColor: mainColor600,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ))),

    //brightness: Brightness.dark,
    scaffoldBackgroundColor: scaffoldBackgroundColor, //Color(0xFFfcbc31),
    colorScheme: ColorScheme.dark(
      primary: Colors.grey.shade200,
      /*background: Colors.black,
      onBackground: Colors.deepOrange,*/
      onPrimary: mainColor600,
      //onPrimary: Colors.black87,
    ));
