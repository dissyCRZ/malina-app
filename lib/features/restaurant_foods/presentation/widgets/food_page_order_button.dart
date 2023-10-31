import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import '../../domain/utils/non_working_hours.dart';

class FoodPageOrderButton extends StatefulWidget {
  final double price;
  final Function function;
  const FoodPageOrderButton({
    Key? key,
    required this.price,
    required this.function,
  }) : super(key: key);

  @override
  State<FoodPageOrderButton> createState() => _FoodPageOrderButtonState();
}

class _FoodPageOrderButtonState extends State<FoodPageOrderButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final time = DateTime.now();
        if (time.hour < 7 || time.hour >= 22) {
          nonWorkingHoursBottomSheet(context);
        } else if (!isPressed) {
          widget.function();
          setState(() {
            isPressed = true;
          });
        }
      },
      child: Container(
        height: 60,
        width: 350.w,
        decoration: BoxDecoration(
          color: AppColor.malina,
          borderRadius: borderR12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isPressed
                ? const Row(
                    children: [
                      Text(
                        '-',
                        style: h18white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '1',
                        style: h18white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '+',
                        style: h18white,
                      ),
                    ],
                  )
                : const Text(
                    'Order',
                    style: h16white,
                  ),
            Text(
              '${widget.price} C',
              style: h18white,
            ),
          ],
        ),
      ),
    );
  }
}
