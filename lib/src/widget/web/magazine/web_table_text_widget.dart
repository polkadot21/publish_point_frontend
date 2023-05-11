import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class WebTableTextWidget extends StatelessWidget {
  final double width;
  final String text;
  final Color? color;

  const WebTableTextWidget({
    Key? key,
    required this.width,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color ?? AppColor.dark,
          height: 18 / 14,
        ),
      ),
    );
  }
}
