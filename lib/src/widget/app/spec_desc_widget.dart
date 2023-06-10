import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';

class SpecDescWidget extends StatelessWidget {
  final String desc;
  final Function() onClose;

  const SpecDescWidget({
    Key? key,
    required this.desc,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.bg,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              desc,
              style: const TextStyle(
                color: AppColor.dark,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onClose,
            child: Container(
              width: 24,
              height: 24,
              color: Colors.transparent,
              child: SvgPicture.asset(
                'assets/icons/close.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
