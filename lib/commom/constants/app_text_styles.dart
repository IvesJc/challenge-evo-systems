

import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle bigTextRed = TextStyle(
    fontFamily: 'Inter',
    fontSize: 50.00,
    fontWeight: FontWeight.w800,
    color: AppColors.redLight
  );
  static TextStyle mediumTextWhite = TextStyle(
    fontFamily: 'Inter',
    fontSize: 30.00,
    fontWeight: FontWeight.normal,
    color: AppColors.white
  );  
  static TextStyle smallTextWhite = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.00,
    fontWeight: FontWeight.normal,
    color: AppColors.white
  );  
  static TextStyle minTextWhite = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.00,
    fontWeight: FontWeight.normal,
    color: AppColors.white
  );
}