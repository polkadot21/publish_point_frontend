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
      name: '13.00.00 - Спортивная наука',
      desc: '13.00.01 - Спортивная наука',
      status: 1,
    ),
    SpecData(
      id: 2,
      name: '13.00.01 - Информатика',
      desc: '13.00.01 - Информатика',
      status: 1,
    ),
    SpecData(
      id: 3,
      name: '13.00.02 Теория и методика обучения и воспитания',
      desc: '13.00.02 Теория и методика обучения и воспитания',
      status: 0,
    ),
    SpecData(
      id: 4,
      name: '13.00.03 Коррекционная педагогика',
      desc: '13.00.03 Коррекционная педагогика',
      status: 0,
    ),
    SpecData(
      id: 5,
      name: '13.00.04 Теория и методика физического воспитания',
      desc: '13.00.04 Теория и методика физического воспитания',
      status: 0,
    ),
    SpecData(
      id: 6,
      name: '19.00.02 - Психофизиология (биологические науки)',
      desc: '19.00.02 - Психофизиология (биологические науки)',
      status: 0,
    ),
    SpecData(
      id: 7,
      name: '19.00.02 - Психофизиология (психологические науки)',
      desc: '19.00.02 - Психофизиология (психологические науки)',
      status: 0,
    ),
    SpecData(
      id: 8,
      name:
          '19.00.03 - Психология труда, инженерная психология, эргономика (психологические науки)',
      desc:
          '19.00.03 - Психология труда, инженерная психология, эргономика (психологические науки)',
      status: 0,
    ),
    SpecData(
      id: 9,
      name: '19.00.04 - Медицинская психология (психологические науки)',
      desc: '19.00.04 - Медицинская психология (психологические науки)',
      status: 0,
    ),
  ];
}
