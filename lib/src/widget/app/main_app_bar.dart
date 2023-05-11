import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/dialog/top_dialog.dart';
import 'package:publishpoint/src/widget/app/support_button.dart';

class MainAppBar extends StatelessWidget {
  final Function(int screenIndex) onMenuTap;
  final Function(bool active) onSearch;
  final TextEditingController controller;
  final bool onSearchActive;

  const MainAppBar({
    Key? key,
    required this.onMenuTap,
    required this.controller,
    required this.onSearchActive,
    required this.onSearch,
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
        SizedBox(
          width: ResponsiveWidget.isSmallScreen(context)
              ? MediaQuery.of(context).size.width * 0.4
              : ResponsiveWidget.isMediumScreen(context)
                  ? MediaQuery.of(context).size.width * 0.5
                  : ResponsiveWidget.isCustomSize(context)
                      ? 160
                      : 320,
          height: 36,
          child: TextField(
            controller: controller,
            onTap: () {
              onSearch(true);
            },
            style: const TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.dark,
              height: 18 / (15),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              filled: true,
              fillColor: onSearchActive ? AppColor.white : AppColor.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.black,
                ),
              ),
              prefixIcon: GestureDetector(
                onTap: () {
                  if (onSearchActive) {
                    onSearch(false);
                  }
                },
                child: SvgPicture.asset(
                  onSearchActive
                      ? 'assets/icons/close.svg'
                      : 'assets/icons/search.svg',
                  color: onSearchActive ? AppColor.dark : null,
                  fit: BoxFit.none,
                  width: 16,
                  height: 16,
                ),
              ),
              hintText: 'Поиск...',
              hintStyle: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: onSearchActive ? AppColor.dark : AppColor.lightGray,
                height: 18 / (15),
              ),
            ),
            cursorColor: AppColor.lightGray,
          ),
        ),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          const SizedBox(width: 16),
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
                TopDialog().showTopModalSheet(
                  context,
                  onMenuTap: (index) {
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
