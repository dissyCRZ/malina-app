import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/extra_container.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import '../../../../shared/configs/texts.dart';
import '../../../../shared/widgets/bottomsheet_container.dart';

class AddIngredientsBottomSheet extends StatefulWidget {
  final String name;
  const AddIngredientsBottomSheet({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<AddIngredientsBottomSheet> createState() =>
      _AddIngredientsBottomSheetState();
}

class _AddIngredientsBottomSheetState extends State<AddIngredientsBottomSheet> {
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
                            widget.name,
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
                        (index) => FoodExtraContainer(
                          extra: FoodExtraEnum.values.elementAt(
                            index,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
