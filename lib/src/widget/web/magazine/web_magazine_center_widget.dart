import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';

class WebMagazineCenterWidget extends StatelessWidget {
  const WebMagazineCenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width -
              ResponsiveWidget.marginHorizontal(context),
          constraints: BoxConstraints(
            minHeight: ResponsiveWidget.isSmallScreen(context)
                ? 360
                : width < 1600
                    ? 360
                    : 518,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: ResponsiveWidget.isCustomSize(context) ||
                        ResponsiveWidget.isLargeScreen(context)
                    ? MediaQuery.of(context).size.width / 2 -
                        ResponsiveWidget.marginHorizontal(context)
                    : MediaQuery.of(context).size.width -
                        ResponsiveWidget.marginHorizontal(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (ResponsiveWidget.isSmallScreen(context) ||
                        ResponsiveWidget.isMediumScreen(context))
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 60,
                        ),
                        child: Image.asset(
                          'assets/images/logo_image2.png',
                        ),
                      ),
                    if (ResponsiveWidget.isSmallScreen(context) ||
                        ResponsiveWidget.isMediumScreen(context))
                      const SizedBox(height: 80),
                    Text(
                      'Точка отправления в мир научных публикаций',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveWidget.isSmallScreen(context) ||
                                ResponsiveWidget.isMediumScreen(context)
                            ? 32
                            : 48,
                        color: AppColor.dark,
                        height: ResponsiveWidget.isSmallScreen(context) ||
                                ResponsiveWidget.isMediumScreen(context)
                            ? 38 / 32
                            : 58 / 48,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Не имеет значения, насколько сложной является область вашего '
                      'исследования - мы здесь, чтобы помочь Вам пройти путь к научной публикации.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.dark,
                        height: 24 / (16),
                      ),
                    ),
                  ],
                ),
              ),
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isCustomSize(context))
                Positioned(
                  width: ResponsiveWidget.isCustomSize(context)
                      ? 600
                      : width < 1600
                          ? 600
                          : 800,
                  right: -16,
                  height: ResponsiveWidget.isCustomSize(context)
                      ? 360
                      : width < 1600
                          ? 360
                          : 518,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: ResponsiveWidget.isLargeScreen(context)
                          ? 40
                          : ResponsiveWidget.isCustomSize(context)
                              ? 80
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? 40
                                  : 20,
                    ),
                    child: Image.asset(
                      'assets/images/logo_image2.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
