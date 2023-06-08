import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/widget/app/custom_button.dart';

class ShowAboutMagazineDialog extends StatefulWidget {
  final String title;
  final String desc;

  const ShowAboutMagazineDialog({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  State<ShowAboutMagazineDialog> createState() =>
      _ShowAboutMagazineDialogState();
}

class _ShowAboutMagazineDialogState extends State<ShowAboutMagazineDialog> {
  final sc = ScrollController();

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromView(
        // ignore: deprecated_member_use
        WidgetsBinding.instance.window,
      ),
      child: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 24 / 20,
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
              const SizedBox(height: 16),
              Flexible(
                child: SingleChildScrollView(
                  controller: sc,
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.bg,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      widget.desc,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Отправить статью',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
