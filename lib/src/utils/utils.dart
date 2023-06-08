import 'package:flutter/cupertino.dart';
import 'package:publishpoint/src/model/api/category_enum.dart';

class Utils {
  static void closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
  }

  static void phoneFormat(TextEditingController controller) {
    String oldText = "+998 ";
    controller.addListener(() {
      if (controller.text.length < 5) {
        controller.text = "+998 ";
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      } else if (controller.text.length == 7 ||
          controller.text.length == 11 ||
          controller.text.length == 14) {
        if (oldText.length < controller.text.length) {
          controller.text = "${controller.text} ";
        } else {
          controller.text = controller.text.substring(
            0,
            controller.text.length - 1,
          );
        }
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      }
      oldText = controller.text;
    });
  }

  // static String errorMessage(HttpResult response) {
  //   try {
  //     String msg = response.result["msg"] ?? response.status == 1
  //         ? translate("internet_error")
  //         : translate("socket_error");
  //     return "$msg\n${response.status}";
  //   } catch (_) {
  //     return "${translate("error_title")}\n${response.status}";
  //   }
  // }

  static String numberFormat(int number) {
    return number > 9 ? number.toString() : "0$number";
  }

  static String category(CategoryEnum category) {
    switch (category) {
      case CategoryEnum.computerScience:
        return 'computer-science';
      case CategoryEnum.psychology:
        return 'psychology';
      default:
        throw ArgumentError('Invalid Category');
    }
  }
}
