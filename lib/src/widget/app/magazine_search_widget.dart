import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class MagazineSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String obj) onChanged;
  final Function() onDropDownTap;

  const MagazineSearchWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onDropDownTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 296,
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          fontFamily: AppColor.fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColor.dark,
          height: 18 / (14),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
          ),
          filled: true,
          fillColor: AppColor.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColor.lightGray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColor.lightGray,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColor.lightGray,
            ),
          ),
          prefixIcon: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              fit: BoxFit.none,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onDropDownTap,
            child: Container(
              color: Colors.transparent,
              height: 40,
              child: SvgPicture.asset(
                'assets/icons/arrow_bottom.svg',
                color: AppColor.gray,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
        cursorColor: AppColor.dark,
        cursorHeight: 18,
      ),
    );
  }
}
