import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/popups/presentation/pages/popup_sheet.dart';

Future<dynamic> popupBottomSheet(
  BuildContext buildContext,
  String title,
  String subtitle,
  String firstButton,
  String? secondButton,
  Function firstFunction,
  Function? secondFunction,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => PopupSheet(
      title: title,
      subtitle: subtitle,
      firstButton: firstButton,
      secondButton: secondButton,
      firstFunction: firstFunction,
      secondFunction: secondFunction,
    ),
    isScrollControlled: true,
  );
}
