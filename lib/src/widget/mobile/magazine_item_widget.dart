import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/dialog/bottom_dialog.dart';
import 'package:publishpoint/src/model/api/journal_list_model.dart';
import 'package:publishpoint/src/widget/app/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MagazineItemWidget extends StatelessWidget {
  final bool isExpanded;
  final Function() onTap;
  final JournalData data;

  const MagazineItemWidget({
    Key? key,
    required this.isExpanded,
    required this.onTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name,
          style: const TextStyle(
            fontSize: 15,
            color: AppColor.blue,
            fontWeight: FontWeight.w500,
            height: 18 / 15,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'Стоимость публикации',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.gray,
                  fontWeight: FontWeight.w400,
                  height: 18 / 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Spacer(),
            Text(
              text: '₽${data.pricePerPaper}',
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.dark,
                fontWeight: FontWeight.w400,
                height: 18 / 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'Дата следующего издания',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.gray,
                  fontWeight: FontWeight.w400,
                  height: 18 / 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Spacer(),
            Text(
              data.nextIssueDate,
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.dark,
                fontWeight: FontWeight.w400,
                height: 18 / 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'Окончание приема статей',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.gray,
                  fontWeight: FontWeight.w400,
                  height: 18 / 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Spacer(),
            Text(
              data.nextIssueDeadline,
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.dark,
                fontWeight: FontWeight.w400,
                height: 18 / 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'Процент принятых статей',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.gray,
                  fontWeight: FontWeight.w400,
                  height: 18 / 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Spacer(),
            Text(
              '${data.acceptedPerc}${data.acceptedPercUnits}',
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.dark,
                fontWeight: FontWeight.w400,
                height: 18 / 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'Общая оценка',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.gray,
                  fontWeight: FontWeight.w400,
                  height: 18 / 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Spacer(),
            Text(
              '${data.generalScore}${data.generalScoreUnits}',
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.dark,
                fontWeight: FontWeight.w400,
                height: 18 / 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomButton(
                onTap: () {
                  BottomDialog.showAboutMagazineDialog(
                    context,
                    title: data.name,
                    desc: data.descriptionInfo,
                  );
                },
                text: isExpanded ? 'Скрыть' : 'О журнале',
                textColor: isExpanded ? AppColor.white : AppColor.dark,
                color: isExpanded ? AppColor.dark : AppColor.white,
                borderRadius: BorderRadius.circular(8),
                border: isExpanded
                    ? null
                    : Border.all(
                        color: AppColor.lightGray,
                        width: 1,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: CustomButton(
                text: 'Отправить статью',
                color: AppColor.cyan,
                borderRadius: BorderRadius.circular(8),
                onTap: () async {
                  var url = data.submitPaperLink;
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    throw "Could not launch $url";
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
