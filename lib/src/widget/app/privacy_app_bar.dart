import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/dialog/top_dialog.dart';
import 'package:publishpoint/src/widget/app/support_button.dart';

class PrivacyAppBar extends StatelessWidget {
  final Function(int screenIndex) onMenuTap;

  const PrivacyAppBar({
    Key? key,
    required this.onMenuTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ResponsiveWidget.marginHorizontal(context),
        ),
        MouseRegion(
          cursor: MaterialStateMouseCursor.clickable,
          child: GestureDetector(
            onTap: () {
              onMenuTap(0);
            },
            child: SvgPicture.asset(
              'assets/icons/logo.svg',
              width: 104,
              height: 36,
            ),
          ),
        ),
        const SizedBox(width: 56),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          MouseRegion(
            cursor: MaterialStateMouseCursor.clickable,
            child: GestureDetector(
              onTap: () {
                onMenuTap(0);
              },
              child: const Text(
                'Журналы',
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.white,
                  height: 20 / (16),
                ),
              ),
            ),
          ),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          const SizedBox(width: 32),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          MouseRegion(
            cursor: MaterialStateMouseCursor.clickable,
            child: GestureDetector(
              onTap: () {
                onMenuTap(1);
              },
              child: const Text(
                'О проекте',
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.white,
                  height: 20 / (16),
                ),
              ),
            ),
          ),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          const SizedBox(width: 32),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          MouseRegion(
            cursor: MaterialStateMouseCursor.clickable,
            child: GestureDetector(
              onTap: () {
                onMenuTap(2);
              },
              child: const Text(
                'Контакты',
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.white,
                  height: 20 / (16),
                ),
              ),
            ),
          ),
        SizedBox(
          width: ResponsiveWidget.isSmallScreen(context) ? 0 : 12,
        ),
        const Spacer(),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          const SupportButton(),
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          const SizedBox(width: 16),
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(200),
              onTap: () {
                TopDialog().showPrivacyTopSheet(
                  context,
                  onMenuTap: (index) {
                    Navigator.pop(context);
                    onMenuTap(index);
                  },
                );
              },
              child: Container(
                color: Colors.transparent,
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  'assets/icons/drawer.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        SizedBox(
          width: ResponsiveWidget.marginHorizontal(context),
        ),
      ],
    );
  }
}
