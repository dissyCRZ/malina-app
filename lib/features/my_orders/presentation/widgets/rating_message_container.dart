import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';

class RatingMessageContainer extends StatelessWidget {
  final String title;
  const RatingMessageContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/icons/rating_cloud.png',
          ),
          Positioned(
            top: 22,
            child: SizedBox(
              width: 75,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: h14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
