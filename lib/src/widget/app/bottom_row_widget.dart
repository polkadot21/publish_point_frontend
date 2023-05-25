import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';

class BottomRowWidget extends StatelessWidget {
  final Function() onTap;

  const BottomRowWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.dark,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.marginHorizontal(context),
        vertical: 28,
      ),
      child: Row(
        children: [
          const Text(
            '© 2023 Publish Point. Все права защищены. ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 20 / 16,
              color: AppColor.white,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 32),
          InkWell(
            onTap: onTap,
            child: const Text(
              'Политика конфиденциальности',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 20 / 16,
                color: AppColor.lightGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
