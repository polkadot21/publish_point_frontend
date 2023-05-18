import 'package:flutter/material.dart';
import 'package:publishpoint/src/dialog/ui/show_top_menu_dialog.dart';

class TopDialog {
  Future<T?> showTopModalSheet<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    required Function(int index) onMenuTap,
    required Function(String obj) onSearch,
  }) {
    return showGeneralDialog<T?>(
      context: context,
      barrierDismissible: barrierDismissible,
      transitionDuration: const Duration(milliseconds: 250),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.transparent,
      pageBuilder: (context, _, __) => SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: ShowTopMenuDialog(
          onMenuTap: onMenuTap,
          onSearch: onSearch,
        ),
      ),
      transitionBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ).drive(
            Tween<Offset>(
              begin: const Offset(0, -1.0),
              end: Offset.zero,
            ),
          ),
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Column(
              children: [
                Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShowTopMenuDialog(
                        onMenuTap: onMenuTap,
                        onSearch: onSearch,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
