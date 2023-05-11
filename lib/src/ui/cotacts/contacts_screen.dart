import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/widget/app/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

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
                    'Наши контакты',
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
                      text: 'text',
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Задать вопрос',
                            style: TextStyle(
                              fontFamily: AppColor.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.dark,
                              height: 18 / (14),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            'assets/icons/send.svg',
                            width: 16,
                            height: 16,
                          ),
                        ],
                      ),
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
        if (ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          const SizedBox(height: 56),
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
                              text: 'Если есть вопросы, то вам сюда ',
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
                              text: 'support@publish-point.ru',
                              style: const TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 24 / 16,
                                color: AppColor.blue,
                              ),
                            ),
                            const TextSpan(
                              text: ' Свои научные достижения аспирантам',
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
                                text: 'Если хотите почитать, то вам сюда ',
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
                                text: 'Publish_Point',
                                style: const TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 24 / 16,
                                  color: AppColor.blue,
                                ),
                              ),
                              const TextSpan(
                                text: ' Свои научные достижения аспирантам',
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
            width: MediaQuery.of(context).size.width,
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
                        text: 'Если хотите почитать, то вам сюда ',
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
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: 'Publish_Point',
                        style: const TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 24 / 16,
                          color: AppColor.blue,
                        ),
                      ),
                      const TextSpan(
                        text: ' Свои научные достижения аспирантам',
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
