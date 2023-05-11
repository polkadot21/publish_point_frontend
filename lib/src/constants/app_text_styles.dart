import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class AppTextStyles {
  static const fontFamily = AppColor.fontFamily;

  static const w400s16h20white = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 20 / 16,
    fontFamily: fontFamily,
    color: AppColor.white,
  );
  static const w400s15h18lightGray = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 18 / 15,
    fontFamily: fontFamily,
    color: AppColor.lightGray,
  );
  static const w500s15h18lightGray = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 18 / 15,
    fontFamily: fontFamily,
    color: AppColor.lightGray,
  );
  static const w500s14h18gray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 18 / 14,
    fontFamily: fontFamily,
    color: AppColor.gray,
  );
}
