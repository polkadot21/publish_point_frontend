import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';

class AboutProjectScreen extends StatelessWidget {
  const AboutProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (ResponsiveWidget.isSmallScreen(context) ||
                      ResponsiveWidget.isMediumScreen(context))
                    Image.asset(
                      'assets/images/logo_image.png',
                      height:
                          ResponsiveWidget.isSmallScreen(context) ? 400 : 500,
                      width:
                          ResponsiveWidget.isSmallScreen(context) ? 400 : 500,
                    ),
                  const Text(
                    'О проекте',
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
                    'возможность опубликовать свои научные достижения '
                    'аспирантам Рецензируемое научное издание, которое '
                    'предоставляет возможность опубликовать свои научные '
                    'достижения аспирантам Мы небольшая, самофинансируемая, '
                    'полностью распределенная команда, и мы активно набираем '
                    'сотрудников! Приходите и помогите нам масштабировать, '
                    'исследовать и создавать гуманистическую инфраструктуру, '
                    'ориентированную на развитие человеческого разума',
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
              Image.asset(
                'assets/images/logo_image.png',
                height: ResponsiveWidget.isCustomSize(context) ? 450 : 650,
                width: ResponsiveWidget.isCustomSize(context) ? 450 : 650,
              ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Команда',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                      color: AppColor.dark,
                      height: 58 / (48),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Мы небольшая, самофинансируемая, полностью распределенная '
                    'команда, и мы активно набираем сотрудников! Приходите '
                    'и помогите нам масштабировать, исследовать и создавать '
                    'гуманистическую инфраструктуру, ориентированную на развитие '
                    'человеческого разума и духа.',
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
            const SizedBox(width: 24),
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isCustomSize(context))
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Подробнее',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                        color: AppColor.dark,
                        height: 58 / (48),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Мы - небольшая самофинансируемая команда, специализирующаяся '
                      'на дизайне, человеческой инфраструктуре и искусственном '
                      'интеллекте. У нас 11 штатных сотрудников и невероятный '
                      'набор консультантов.',
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
          ],
        ),
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          const SizedBox(height: 16),
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Подробнее',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                  color: AppColor.dark,
                  height: 58 / (48),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Мы - небольшая самофинансируемая команда, специализирующаяся '
                'на дизайне, человеческой инфраструктуре и искусственном '
                'интеллекте. У нас 11 штатных сотрудников и невероятный '
                'набор консультантов.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.dark,
                  height: 24 / (16),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
