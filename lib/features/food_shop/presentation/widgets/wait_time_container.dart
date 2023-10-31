import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class WaitTimeContainer extends StatelessWidget {
  final double waitTime;
  const WaitTimeContainer({
    Key? key,
    required this.waitTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/time-filled.png',
            width: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '$waitTime мин',
            style: st14,
          ),
        ],
      ),
    );
  }
}
