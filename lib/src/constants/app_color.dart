import 'package:flutter/material.dart';
import 'package:publishpoint/src/model/api/spec_model.dart';

class AppColor {
  static const dark = Color(0xFF264A5B);
  static const black = Color(0xFF183543);
  static const bg = Color(0xFFEAF2F5);
  static const white = Colors.white;
  static const gray = Color(0xFF60727B);
  static const lightGray = Color(0xFFC8D7DE);
  static const cyan = Color(0xFFC4E9FB);
  static const divider = Color(0xFFDFEBEF);
  static const blue = Color(0xFF0586C2);

  /// font family

  static const fontFamily = 'Golos';

  static List<SpecData> specData = [
    SpecData(
      id: 1,
      name: '19.00.01 - Общая психология, психология личности, история психологии',
      desc: '19.00.01 - Общая психология, психология личности, история психологии',
      status: 1,
    ),
    SpecData(
      id: 2,
      name: '09.04.01 - Информатика и вычислительная техника ',
      desc: '09.04.01 - Информатика и вычислительная техника ',
      status: 1,
    ),
  ];
}
