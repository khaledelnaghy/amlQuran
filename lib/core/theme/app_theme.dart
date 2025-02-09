import 'package:aml/core/constant/route_path_assets.dart';
import 'package:aml/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: fontJannaLT,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      // fillColor: AppColors.primaryColor,
      // filled: true,
      hintStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 15,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      showSelectedLabels: true,
      unselectedIconTheme: IconThemeData(size: 18),
      backgroundColor: AppColors
          .primaryColor, //allows change Color bottomNavigationBar + type fixed
      type: BottomNavigationBarType.fixed, //change type of BottomNavigationBar
    ),
  );
}


 // another Solution for change Color of BottomNavigationBar => wrab bottomNavigationBar with Theme Widget 
 // Theme => data : Theme.of(context).copuWith(canvasColor : AppColors.primaryColor);
 