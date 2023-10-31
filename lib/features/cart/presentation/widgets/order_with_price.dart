import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class OrderWithPriceButton extends StatelessWidget {
  final Function function;
  final double price;

  const OrderWithPriceButton({
    Key? key,
    required this.function,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: marginH,
        decoration: BoxDecoration(
          color: AppColor.malina,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Заказать',
              style: h16.copyWith(color: AppColor.white),
            ),
            Text(
              '$price C',
              style: h18.copyWith(color: AppColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
