import 'package:publishpoint/src/model/api/category_enum.dart';
import 'package:publishpoint/src/model/api/spec_model.dart';

class AppData {
  static List<SpecData> specData = [
    SpecData(
      id: 1,
      name:
          '19.00.01 - Общая психология, психология личности, история психологии',
      desc:
          '19.00.01 - Общая психология, психология личности, история психологии',
      status: 1,
      category: CategoryEnum.psychology,
    ),
    SpecData(
      id: 2,
      name: '09.04.01 - Информатика и вычислительная техника ',
      desc: '09.04.01 - Информатика и вычислительная техника ',
      status: 1,
      category: CategoryEnum.computerScience,
    ),
    SpecData(
      id: 3,
      name:
          '19.00.01 - Общая психология, психология личности, история психологии',
      desc:
          '19.00.01 - Общая психология, психология личности, история психологии',
      status: 0,
      category: CategoryEnum.computerScience,
    ),
  ];
}
