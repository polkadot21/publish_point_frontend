import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/widget/app/support_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 20,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width -
                ResponsiveWidget.marginHorizontal(context),
            constraints: BoxConstraints(
              minHeight: ResponsiveWidget.isSmallScreen(context)
                  ? 360
                  : width < 1600
                      ? 360
                      : 518,
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: ResponsiveWidget.isCustomSize(context) ||
                            ResponsiveWidget.isLargeScreen(context)
                        ? MediaQuery.of(context).size.width / 2 -
                            ResponsiveWidget.marginHorizontal(context)
                        : MediaQuery.of(context).size.width -
                            ResponsiveWidget.marginHorizontal(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
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
                        Text(
                          'Наши контакты',
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
                          'Не имеет значения, насколько сложной является область вашего исследования '
                          '- мы здесь, чтобы помочь Вам пройти путь к научной публикации.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColor.dark,
                            height: 24 / (16),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const FittedBox(child: SupportButton()),
                      ],
                    ),
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
        ),
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          const SizedBox(height: 56)
        else
          const SizedBox(height: 92),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColor.lightGray,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Электронная почта',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: AppColor.dark,
                          height: 29 / (24),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text:
                                  'Если у вас есть вопросы или нужна дополнительная информация, '
                                  'пожалуйста, не стесняйтесь обращаться к нам по электронной почте ',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 24 / 16,
                                color: AppColor.gray,
                              ),
                            ),
                            TextSpan(
                              mouseCursor: MaterialStateMouseCursor.clickable,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url =
                                      "${"mailto:" 'support@publish-point.ru'}"
                                      "?subject=&body=";
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url));
                                  } else {
                                    throw "Could not launch $url";
                                  }
                                },
                              text: 'support@publish-point.ru.',
                              style: const TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 24 / 16,
                                color: AppColor.blue,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ' Мы с нетерпением ждем возможности помочь вам!',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 24 / 16,
                                color: AppColor.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isCustomSize(context))
                const SizedBox(width: 24),
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isCustomSize(context))
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColor.lightGray,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Телеграм канал',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: AppColor.dark,
                            height: 29 / (24),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Присоединяйтесь к нашему ',
                                style: TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  height: 24 / 16,
                                  color: AppColor.gray,
                                ),
                              ),
                              TextSpan(
                                mouseCursor: MaterialStateMouseCursor.clickable,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    var url = 'https://t.me/publishpoint';
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(
                                        Uri.parse(url),
                                        mode: LaunchMode.externalApplication,
                                      );
                                    } else {
                                      throw "Could not launch $url";
                                    }
                                  },
                                text: 'Telegram-каналу',
                                style: const TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 24 / 16,
                                  color: AppColor.blue,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' для получения самой свежей и актуальной информации о нашей '
                                    'платформе! Мы регулярно обновляем канал новостями, советами и '
                                    'подробностями о нашей работе. Мы ждем вас в нашем сообществе!',
                                style: TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  height: 24 / 16,
                                  color: AppColor.gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          const SizedBox(height: 24),
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColor.lightGray,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Телеграм канал',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColor.dark,
                    height: 29 / (24),
                  ),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Присоединяйтесь к нашему ',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 24 / 16,
                          color: AppColor.gray,
                        ),
                      ),
                      TextSpan(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = 'http://t.me/publishpointbot';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              throw "Could not launch $url";
                            }
                          },
                        text: 'Telegram-каналу',
                        style: const TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          color: AppColor.blue,
                        ),
                      ),
                      const TextSpan(
                        text:
                            ' для получения самой свежей и актуальной информации о нашей '
                            'платформе! Мы регулярно обновляем канал новостями, советами и '
                            'подробностями о нашей работе. Мы ждем вас в нашем сообществе!',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 24 / 16,
                          color: AppColor.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
