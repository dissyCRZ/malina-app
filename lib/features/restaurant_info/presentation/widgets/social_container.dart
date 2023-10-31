import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.grey,
          width: 1,
        ),
        borderRadius: borderR10,
      ),
      child: const IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SocialContainerItem(
              icon: 'whatsapp',
            ),
            VerticalDivider(
              color: AppColor.grey,
              thickness: 1,
              width: 1,
            ),
            SocialContainerItem(
              icon: 'telegram',
            ),
            VerticalDivider(
              color: AppColor.grey,
              thickness: 1,
              width: 1,
            ),
            SocialContainerItem(
              icon: 'instagram',
            ),
          ],
        ),
      ),
    );
  }
}

class SocialContainerItem extends StatelessWidget {
  final String icon;
  const SocialContainerItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: Image.asset('assets/icons/social/$icon.png'),
      ),
    );
  }
}
