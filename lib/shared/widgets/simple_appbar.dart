import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';

AppBar getAppBar(
  BuildContext context,
  String title, {
  bool hasNotification = false,
}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.keyboard_arrow_left,
        size: 25,
        color: Colors.black,
      ),
      onPressed: () => context.pop(),
    ),
    leadingWidth: 30,
    title: Text(
      title,
      style: h20,
    ),
    actions: [
      hasNotification
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 20,
                  child: Image.asset(
                    'assets/icons/notification.png',
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    ],
  );
}
