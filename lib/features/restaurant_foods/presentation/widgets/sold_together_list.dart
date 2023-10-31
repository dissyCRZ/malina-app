import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/sold_together_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/models/product.dart';

class SoldTogetherList extends StatelessWidget {
  final AbstractProduct product;
  const SoldTogetherList({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Вместе берут',
          style: h18,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SoldTogetherContainer(
              product: product.relatedProducts![index],
            ),
            itemCount: product.relatedProducts!.length,
          ),
        )
      ],
    );
  }
}
