import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportButton extends StatelessWidget {
  final Color? color;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Border? border;

  const SupportButton({
    Key? key,
    this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    this.child,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: InkWell(
          onTap: () async {
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
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              color: color ?? AppColor.cyan,
              border: border,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: SvgPicture.asset(
                        'assets/icons/send.svg',
                        // width: 16,
                        // height: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
