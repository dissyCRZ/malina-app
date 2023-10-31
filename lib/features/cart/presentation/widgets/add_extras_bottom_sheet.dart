import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart/domain/utils/get_extras_by_enum.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../../../../shared/configs/texts.dart';
import '../../../../shared/widgets/bottomsheet_container.dart';
import '../cubit/extras_cubit.dart';
import 'extra_container.dart';

class OrderExtrasBottomSheet extends StatefulWidget {
  final RestaurantOrderModel restaurant;
  final FoodOrderModel food;
  const OrderExtrasBottomSheet({
    Key? key,
    required this.restaurant,
    required this.food,
  }) : super(key: key);

  @override
  State<OrderExtrasBottomSheet> createState() => _OrderExtrasBottomSheetState();
}

class _OrderExtrasBottomSheetState extends State<OrderExtrasBottomSheet> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: BottomSheetContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Выберите добавки',
                  style: h20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.grey,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60.w,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.food.product.name,
                            style: st16,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            'assets/icons/plus-outlined.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        FoodExtraEnum.values.length,
                        (index) => OrderFoodExtraContainer(
                          extra: FoodExtraEnum.values.elementAt(
                            index,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            MalinaFilledButton(
              height: 60,
              title: 'Добавить',
              function: () {
                context.read<CartCubit>().addExtra(
                      widget.restaurant,
                      widget.food,
                      getExtrasByEnum(
                        context.read<OrderExtrasCubit>().state.extras,
                      ),
                    );
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
