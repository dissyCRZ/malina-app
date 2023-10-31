import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/models/product.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import 'package:malina_mobile_app/shared/widgets/row_with_divider.dart';

class ProductDescription extends StatefulWidget {
  final AbstractProduct product;
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: h22,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Image.asset(
                    'assets/icons/info.png',
                    width: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${widget.product.price}C',
              style: h20.copyWith(
                color: AppColor.malina,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Состав',
                  style: h18,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.product.shortDescription} (${widget.product.sizeOptions[0]} гр)',
                  style: st14,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product.longDescription,
                  style: st14,
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 10,
          right: 20,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isVisible ? 1 : 0,
            child: RoundedShadowContainer(
              width: 300.w,
              child: const Column(
                children: [
                  Text(
                    'Ценность на 100 гр',
                    style: h18,
                  ),
                  RowWithDivider(
                    title: 'Ккал',
                    data: '449',
                    isDashed: true,
                  ),
                  RowWithDivider(
                    title: 'белки',
                    data: '31',
                    isDashed: true,
                  ),
                  RowWithDivider(
                    title: 'Жиры',
                    data: '34',
                    isDashed: true,
                  ),
                  RowWithDivider(
                    title: 'Углеводы',
                    data: '32',
                    isDashed: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
