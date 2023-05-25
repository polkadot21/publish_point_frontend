import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/widget/app/support_button.dart';

class ShowTopMenuDialog extends StatefulWidget {
  final Function(int index) onMenuTap;
  final Function(String obj) onSearch;

  const ShowTopMenuDialog({
    Key? key,
    required this.onMenuTap,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<ShowTopMenuDialog> createState() => _ShowTopMenuDialogState();
}

class _ShowTopMenuDialogState extends State<ShowTopMenuDialog> {
  bool onSearchActive = false;
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColor.dark,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onTap: () {
                      onSearchActive = true;
                      setState(() {});
                    },
                    onChanged: widget.onSearch,
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: onSearchActive ? AppColor.dark : AppColor.white,
                      height: 18 / (15),
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      filled: true,
                      fillColor:
                          onSearchActive ? AppColor.white : AppColor.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColor.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColor.black,
                        ),
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () {
                          if (onSearchActive) {
                            onSearchActive = false;
                            controller.clear();
                            setState(() {});
                          }
                        },
                        child: SvgPicture.asset(
                          onSearchActive
                              ? 'assets/icons/close.svg'
                              : 'assets/icons/search.svg',
                          color: onSearchActive ? AppColor.dark : null,
                          fit: BoxFit.none,
                          width: 16,
                          height: 16,
                        ),
                      ),
                      hintText: onSearchActive ? '' : 'Поиск...',
                      hintStyle: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color:
                            onSearchActive ? AppColor.dark : AppColor.lightGray,
                        height: 18 / (15),
                      ),
                    ),
                    cursorColor: AppColor.lightGray,
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      'assets/icons/close.svg',
                      color: AppColor.cyan,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(
            color: AppColor.gray,
            height: 0,
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              widget.onMenuTap(0);
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Журналы',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 18 / 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              widget.onMenuTap(1);
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'О проекте',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 18 / 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              widget.onMenuTap(2);
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Контакты',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 18 / 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 48),
          const SupportButton(
            margin: EdgeInsets.only(
              right: 16,
              left: 16,
              bottom: 8,
            ),
          ),
        ],
      ),
    );
  }
}
