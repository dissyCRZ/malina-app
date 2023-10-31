import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/home/domain/utils/upcoming.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';

class UpcomingContainer extends StatelessWidget {
  final String title;
  final Color color;
  const UpcomingContainer({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        upcomingBottomSheet(context);
      },
      child: Container(
        width: 85,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderR10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: st12,
            ),
          ],
        ),
      ),
    );
  }
}
