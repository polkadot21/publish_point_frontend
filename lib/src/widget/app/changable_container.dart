import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class ChangeableContainer extends StatelessWidget {
  final bool isChosen;
  final String text;
  final Function() onTap;

  const ChangeableContainer({
    Key? key,
    required this.isChosen,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 370),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isChosen ? AppColor.dark : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isChosen ? AppColor.white : AppColor.gray,
              fontSize: 15,
              height: 18 / 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
