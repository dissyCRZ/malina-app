import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/abstract_order.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/complainment_sheet.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/my_order_rating_thanks_sheet.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/rating_controllerd.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_order_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_multiline_field.dart';
import '../widgets/my_order_rating.dart';

class MyOrderRatingSheet extends StatelessWidget {
  final AbstractOrderModel order;
  MyOrderRatingSheet({
    Key? key,
    required this.order,
  }) : super(key: key);
  final commentCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrderRatingContCubit(),
      child: BottomSheetContainer(
        height: 750.h,
        hasPadding: false,
        child: Column(
          children: [
            Padding(
              padding: marginHV20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Оценить заказ',
                    style: h20,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            MyOrderContainer(
              order: order,
              hasFunction: false,
            ),
            const MyOrderRatingContainer(),
            Padding(
              padding: marginHV20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Отзыв',
                    style: h18,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedMultilineField(
                    controller: commentCont,
                    hint: 'Написать комментарий',
                  ),
                ],
              ),
            ),
            Builder(builder: (context) {
              return MalinaFilledButton(
                width: 350.w,
                title: 'Оценить',
                height: 60,
                function: () {
                  context.pop();
                  if (context.read<MyOrderRatingContCubit>().state < 3) {
                    complainmentBottomSheet(
                      context,
                      order.place,
                    );
                  } else {
                    myOrderRatingThanksBottomSheet(
                      context,
                    );
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
