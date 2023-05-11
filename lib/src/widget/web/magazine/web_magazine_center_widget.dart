import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/widget/app/custom_button.dart';
import 'package:publishpoint/src/constants/responsivness.dart';

class WebMagazineCenterWidget extends StatelessWidget {
  final Function() onTap;

  const WebMagazineCenterWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ResponsiveWidget.isSmallScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                Image.asset(
                  'assets/images/logo_image.png',
                  height: ResponsiveWidget.isSmallScreen(context) ? 400 : 500,
                  width: ResponsiveWidget.isSmallScreen(context) ? 400 : 500,
                ),
              const Text(
                'Большая разница между журналами',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                  color: AppColor.dark,
                  height: 58 / (48),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Рецензируемое научное издание, которое предоставляет '
                'возможность опубликовать свои научные достижения аспирантам',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.dark,
                  height: 24 / (16),
                ),
              ),
              const SizedBox(height: 24),
              FittedBox(
                child: CustomButton(
                  color: AppColor.cyan,
                  text: 'Изучить список',
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          Image.asset(
            'assets/images/logo_image.png',
            height: ResponsiveWidget.isCustomSize(context) ? 450 : 650,
            width: ResponsiveWidget.isCustomSize(context) ? 450 : 650,
          ),
      ],
    );
  }
}
