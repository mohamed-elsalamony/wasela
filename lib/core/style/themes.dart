import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';


class Apptheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kWhite,
    // fontFamily: "Montserrat",
    colorScheme: ColorScheme.light(
      primary: kBlue,
    ),
    textTheme: TextTheme(
      
      /// the headline text
      headline1: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: kBlue,
      ),

      /// the subtitle text
      subtitle1: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: kBlack,
      ),

      /// the hint subtitle
      subtitle2: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: kBlack,
      ),
    ),
  );
}
