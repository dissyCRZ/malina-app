import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SettingButton extends StatelessWidget {
  final String icon;
  final String title;
  final Function function;
  const SettingButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function(title);
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/icons/profile/$icon.png',
                  fit: BoxFit.contain,
                  color: AppColor.background,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(title),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: AppColor.grey,
          )
        ],
      ),
    );
  }
}
