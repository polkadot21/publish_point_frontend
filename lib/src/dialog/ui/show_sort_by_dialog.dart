import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/dialog/ui/item/sort_item_widget.dart';
import 'package:publishpoint/src/widget/app/custom_button.dart';

class ShowSortByDialog extends StatefulWidget {
  final String selected;
  final Function(String sort, int index) onSelect;

  const ShowSortByDialog({
    Key? key,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<ShowSortByDialog> createState() => _ShowSortByDialogState();
}

class _ShowSortByDialogState extends State<ShowSortByDialog> {
  int currentIndex = -1;
  List<String> sorts = [
    'Стоимость публикации',
    'Дата следующего издания',
    'Окончание приема статей',
    'Процент принятых статей',
    'Общая оценка',
  ];

  @override
  void initState() {
    for (int i = 0; i < sorts.length; i++) {
      if (widget.selected == sorts[i]) {
        currentIndex = i;
        break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Сортировать по',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 24 / 20,
                    color: AppColor.dark,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 24,
                  height: 24,
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    'assets/icons/close.svg',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: SortItemWidget(
                  name: sorts[index],
                  isChecked: currentIndex == index,
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 16);
            },
            itemCount: sorts.length,
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Выбрать',
            onTap: () {
              if (currentIndex != -1) {
                widget.onSelect(
                  sorts[currentIndex],
                  currentIndex,
                );
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
