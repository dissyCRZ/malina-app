import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';

class MyOrderImage extends StatelessWidget {
  final String image;
  const MyOrderImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderR6,
      child: SizedBox(
        height: 40,
        width: 40,
        child: image.contains('food')
            ? Image.asset(
                'assets/debug/$image.png',
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/debug/$image.png',
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
