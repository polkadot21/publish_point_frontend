import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/dialog/bottom_dialog.dart';

class SortByMobileWidget extends StatelessWidget {
  final Function(String sort, int index) onSelect;
  final String selectedSort;

  const SortByMobileWidget({
    Key? key,
    required this.onSelect,
    required this.selectedSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BottomDialog.showSortByDialog(
          context,
          selected: selectedSort,
          onSelect: onSelect,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColor.lightGray,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Text(
              selectedSort.isEmpty ? 'Сортировать по' : selectedSort,
              style: const TextStyle(
                color: AppColor.dark,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 18 / 14,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/arrow_bottom.svg',
            ),
          ],
        ),
      ),
    );
  }
}
