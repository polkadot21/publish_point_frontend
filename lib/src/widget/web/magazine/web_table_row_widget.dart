import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/model/api/journal_list_model.dart';
import 'package:publishpoint/src/widget/app/custom_button.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class WebTableRowWidget extends StatelessWidget {
  final bool isExpanded;
  final Function() onTap;
  final JournalData data;

  const WebTableRowWidget({
    Key? key,
    required this.isExpanded,
    required this.onTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: WebTableTextWidget(
                width: 160,
                color: AppColor.blue,
                text: data.name,
              ),
            ),
            // const Spacer(),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: WebTableTextWidget(
                width: 104,
                text: '\$${data.pricePerPage}',
              ),
            ),
            // const Spacer(),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: WebTableTextWidget(
                width: 134,
                text: data.nextIssueDate,
              ),
            ),
            // const Spacer(),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: WebTableTextWidget(
                width: 124,
                text: data.nextIssueDeadline,
              ),
            ),
            const SizedBox(width: 16),
            // const Spacer(),
            Expanded(
              flex: 2,
              child: WebTableTextWidget(
                width: 88,
                text: '${data.acceptedPerc}${data.acceptedPercUnits}',
              ),
            ),
            // const Spacer(),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: WebTableTextWidget(
                width: 76,
                text: '${data.generalScore}${data.generalScoreUnits}',
              ),
            ),
            // const Spacer(),
            Expanded(
              flex: MediaQuery.of(context).size.width > 1500
                  ? 5
                  : MediaQuery.of(context).size.width > 1600
                      ? 4
                      : MediaQuery.of(context).size.width > 1700
                          ? 3
                          : 6,
              child: SizedBox(
                width: 288,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        onTap: onTap,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              color: AppColor.bg,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              data.descriptionInfo,
              style: const TextStyle(
                color: AppColor.dark,
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        else
          Container(),
      ],
    );
  }
}
