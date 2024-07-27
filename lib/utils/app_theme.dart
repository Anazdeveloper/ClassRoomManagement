import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
            headline6: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
        ),
        canvasColor:AppColors.backgroundLight,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor, disabledForegroundColor: AppColors.primaryColor.withOpacity(0.38),
            textStyle: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        fontFamily: 'Inter',
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          // 4
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          buttonColor: AppColors.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
        )
    );
  }
}