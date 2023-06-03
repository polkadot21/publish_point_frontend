import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/model/api/spec_model.dart';

class ShowSearchResultDialog extends StatelessWidget {
  final List<SpecData> data;
  final int chosen;
  final Function(String name, int index) onChoose;

  const ShowSearchResultDialog({
    Key? key,
    required this.data,
    required this.onChoose,
    required this.chosen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.lightGray,
        ),
      ),
      height: data.isEmpty
          ? 44
          : data.length == 1
              ? 76
              : data.length == 2
                  ? 108
                  : 160,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index != 0 && data[index - 1].status == 1) {
                onChoose(data[index - 1].name, data[index - 1].id - 1);
              }
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      index == 0
                          ? 'Все научные специальности'
                          : data[index - 1].name,
                      style: TextStyle(
                        color: index == 0
                            ? AppColor.gray.withOpacity(0.7)
                            : data[index - 1].status == 0
                                ? AppColor.gray.withOpacity(0.7)
                                : AppColor.dark,
                        fontSize: 14,
                        fontWeight: index == 0
                            ? FontWeight.w400
                            : chosen == data[index - 1].id - 1
                                ? FontWeight.w500
                                : FontWeight.w400,
                        height: 18 / 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (index != 0 && chosen == data[index - 1].id - 1)
                    SvgPicture.asset(
                      'assets/icons/check.svg',
                    ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(height: 12);
        },
        itemCount: data.length + 1,
      ),
    );
  }
}
