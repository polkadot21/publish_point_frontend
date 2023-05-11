import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Border? border;
  final String text;
  final Function() onTap;

  const CustomButton({
    Key? key,
    this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    this.child,
    this.border,
    required this.text,
    required this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        overlayColor: MaterialStateProperty.all(
          AppColor.white,
        ),
        radius: 100,
        hoverColor: Colors.green,
        highlightColor: Colors.red,
        splashColor: Colors.yellow,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            color: color ?? AppColor.cyan,
            border: border,
          ),
          child: Center(
            child: FittedBox(
              child: child ??
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 18 / 14,
                      color: textColor ?? AppColor.dark,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
