import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutProjectScreen extends StatelessWidget {
  const AboutProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 20,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width -
                ResponsiveWidget.marginHorizontal(context),
            constraints: const BoxConstraints(
              minHeight: 518,
            ),
            child: Stack(
              alignment: Alignment.center,
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
                          'PublishPoint.org - Точка отправления в мир научных публикаций '
                          'PublishPoint.org - это не просто проект, это ваша точка '
                          'отправления в мир научных публикаций. Рожденный с амбицией '
                          'стать надежным источником информации, наша миссия заключается '
                          'в том, чтобы упростить и демократизировать процесс научной '
                          'публикации. Наш подход отличает сбор, анализ и представление '
                          'данных о научных журналах, делая их легко доступными и понятными. '
                          'Мы оцениваем каждый журнал по ряду критериев, включая его влияние, '
                          'репутацию и качество публикаций, чтобы помочь вам быстро определить '
                          'наиболее подходящий для вашего исследования журнал. Одной из наших '
                          'главных целей является продвижение открытого доступа к научной информации. '
                          'Мы верим в науку, которая открыта для всех, и наша работа направлена на '
                          'воплощение этой идеи в реальность.',
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
                    // top: ResponsiveWidget.isLargeScreen(context) ? 0 : null,
                    top: 0,
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
            ResponsiveWidget.isMediumScreen(context) ||
            ResponsiveWidget.isCustomSize(context))
          const SizedBox(height: 72),
        Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(24),
          ),
          width: ResponsiveWidget.isSmallScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context)
              ? MediaQuery.of(context).size.width -
                  ResponsiveWidget.marginHorizontal(context)
              : MediaQuery.of(context).size.width / 2 -
                  ResponsiveWidget.marginHorizontal(context),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Команда',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColor.dark,
                  height: 28 / (24),
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Мы - команда ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.gray,
                        height: 24 / (16),
                      ),
                    ),
                    TextSpan(
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "https://PublishPoint.org";
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw "Could not launch $url";
                          }
                        },
                      text: 'PublishPoint.org',
                      style: const TextStyle(
                        color: AppColor.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 24 / (16),
                      ),
                    ),
                    const TextSpan(
                      text: ', небольшой, самофинансируемый '
                          'и полностью децентрализованный коллектив, используемый '
                          'технологии во имя науки. Мы уделяем особое внимание тому, '
                          'чтобы наша работа была ориентирована на развитие и продвижение '
                          'открытой науки, поскольку мы считаем, что она способствует '
                          'прогрессу и общественному благу. Наша команда увлечена своей '
                          'миссией и всегда готова принять вызов, который стоит перед открытой наукой.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.gray,
                        height: 24 / (16),
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
