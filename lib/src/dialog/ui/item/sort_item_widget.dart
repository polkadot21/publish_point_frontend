import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class SortItemWidget extends StatelessWidget {
  final String name;
  final bool isChecked;

  const SortItemWidget({
    Key? key,
    required this.name,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 370),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.width,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.white,
        border: Border.all(
          color: AppColor.lightGray,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: isChecked ? FontWeight.w500 : FontWeight.w400,
                fontSize: 14,
                height: 18 / 14,
                color: isChecked ? AppColor.dark : AppColor.gray,
              ),
            ),
          ),
          if (isChecked) const SizedBox(width: 12),
          Center(
            child: Container(
              color: Colors.transparent,
              width: 24,
              height: 24,
              child: isChecked
                  ? SvgPicture.asset(
                      'assets/icons/check_circle.svg',
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
