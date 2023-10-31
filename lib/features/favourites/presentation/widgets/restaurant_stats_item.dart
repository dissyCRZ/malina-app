import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';

class RestaurantStatsItem extends StatelessWidget {
  final String icon;
  final String value;
  const RestaurantStatsItem({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 12,
          child: Image.asset(
            'assets/icons/$icon.png',
          ),
        ),
        Text(
          value,
          style: st12,
        ),
      ],
    );
  }
}
