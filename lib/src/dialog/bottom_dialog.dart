import 'package:flutter/material.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/dialog/ui/show_about_magazine_dialog.dart';
import 'package:publishpoint/src/dialog/ui/show_sort_by_dialog.dart';

class BottomDialog {
  static void showAboutMagazineDialog(
    BuildContext context, {
    required String title,
    required String desc,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColor.dark.withOpacity(0.7),
      isScrollControlled: true,
      builder: (context) {
        return ShowAboutMagazineDialog(
          title: title,
          desc: desc,
        );
      },
    );
  }

  static void showSortByDialog(
    BuildContext context, {
    required String selected,
    required Function(String sort, int index) onSelect,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColor.dark.withOpacity(0.7),
      isScrollControlled: true,
      builder: (context) {
        return ShowSortByDialog(
          selected: selected,
          onSelect: onSelect,
        );
      },
    );
  }
}
