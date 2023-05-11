import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class WebTableItemWidget extends StatelessWidget {
  final double width;
  final String text;
  final bool isFirst;
  final bool isSorted;
  final Function() onTap;

  const WebTableItemWidget({
    Key? key,
    required this.width,
    required this.text,
    this.isFirst = false,
    required this.isSorted,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isFirst
                ? Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.gray,
                      height: 18 / 14,
                    ),
                  )
                : Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSorted ? AppColor.blue : AppColor.gray,
                        height: 18 / 14,
                      ),
                    ),
                  ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              'assets/icons/up_down.svg',
            ),
          ],
        ),
      ),
    );
  }
}
