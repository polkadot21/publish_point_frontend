import 'package:flutter/material.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_item_widget.dart';

class WebTableHeaderWidget extends StatelessWidget {
  final Function(
    String sortType,
    int index,
    String sort,
  ) onSort;
  final int sortIndex;
  final String sortType;

  const WebTableHeaderWidget({
    Key? key,
    required this.onSort,
    required this.sortIndex,
    required this.sortType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> sorts = [
      'Стоимость публикации',
      'Дата следующего издания',
      'Окончание приема статей',
      'Процент принятых статей',
      'Общая оценка',
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 160,
          child: Text(
            'Наименование',
          ),
        ),
        // WebTableItemWidget(
        //   width: 160,
        //   isFirst: true,
        //   text: 'Наименование',
        // ),
        const Spacer(),
        WebTableItemWidget(
          width: 104,
          text: sorts[0],
          isSorted: sortIndex == 0,
          onTap: () {
            if (sortIndex == 0) {
              if (sortType == 'asc') {
                onSort('desc', 0, sorts[0]);
              } else {
                onSort('asc', 0, sorts[0]);
              }
            } else {
              onSort('asc', 0, sorts[0]);
            }
          },
        ),
        const Spacer(),
        WebTableItemWidget(
          width: 134,
          text: 'Дата следующего издания',
          isSorted: sortIndex == 1,
          onTap: () {
            if (sortIndex == 1) {
              if (sortType == 'asc') {
                onSort('desc', 1, sorts[1]);
              } else {
                onSort('asc', 1, sorts[1]);
              }
            } else {
              onSort('asc', 1, sorts[1]);
            }
          },
        ),
        const Spacer(),
        WebTableItemWidget(
          width: 124,
          text: 'Окончание приема статей',
          isSorted: sortIndex == 2,
          onTap: () {
            if (sortIndex == 2) {
              if (sortType == 'asc') {
                onSort('desc', 2, sorts[2]);
              } else {
                onSort('asc', 2, sorts[2]);
              }
            } else {
              onSort('asc', 2, sorts[2]);
            }
          },
        ),
        const Spacer(),
        WebTableItemWidget(
          width: 88,
          text: '% принятых статей',
          isSorted: sortIndex == 3,
          onTap: () {
            if (sortIndex == 3) {
              if (sortType == 'asc') {
                onSort('desc', 3, sorts[3]);
              } else {
                onSort('asc', 3, sorts[3]);
              }
            } else {
              onSort('asc', 3, sorts[3]);
            }
          },
        ),
        const Spacer(),
        WebTableItemWidget(
          width: 76,
          text: 'Общая оценка',
          isSorted: sortIndex == 4,
          onTap: () {
            if (sortIndex == 4) {
              if (sortType == 'asc') {
                onSort('desc', 4, sorts[4]);
              } else {
                onSort('asc', 4, sorts[4]);
              }
            } else {
              onSort('asc', 4, sorts[4]);
            }
          },
        ),
        const Spacer(),
        const SizedBox(
          width: 288,
          child: Text(
            'Действие',
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
