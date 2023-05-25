import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/constants/strings.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

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
                      ? 480
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
                        const Text(
                          'Политика в отношении обработки персональных данных',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 48,
                            color: AppColor.dark,
                            height: 58 / (48),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (ResponsiveWidget.isLargeScreen(context) ||
                    ResponsiveWidget.isCustomSize(context))
                  Positioned(
                    width: ResponsiveWidget.isCustomSize(context)
                        ? 580
                        : width < 1600
                            ? 720
                            : 800,
                    right: -16,
                    height: ResponsiveWidget.isCustomSize(context)
                        ? 360
                        : width < 1600
                            ? 480
                            : 518,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: ResponsiveWidget.isLargeScreen(context)
                            ? 140
                            : ResponsiveWidget.isCustomSize(context)
                                ? 112
                                : ResponsiveWidget.isCustomSize(context)
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
              Text(
                Strings.privacyTitle1,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColor.dark,
                  height: 29 / (24),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                Strings.privacySubTitle11,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle12,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle13,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                Strings.privacyTitle2,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColor.dark,
                  height: 29 / (24),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                Strings.privacySubTitle21,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle22,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle23,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle24,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle25,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle26,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle27,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle28,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle29,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle210,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle211,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle212,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle213,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Strings.privacySubTitle214,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColor.gray,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
