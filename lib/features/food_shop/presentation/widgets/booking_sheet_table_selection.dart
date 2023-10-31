import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:malina_mobile_app/features/booking/data/enum/booking_type.dart';
import 'package:malina_mobile_app/features/booking/data/models/booking.dart';
import 'package:malina_mobile_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/guest_count_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_date_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/cubit/restaurant_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_multiline_field.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class BookingSheetTableSelection extends StatefulWidget {
  const BookingSheetTableSelection({
    super.key,
  });

  @override
  State<BookingSheetTableSelection> createState() =>
      _BookingSheetTableSelectionState();
}

class _BookingSheetTableSelectionState
    extends State<BookingSheetTableSelection> {
  final nameCont = TextEditingController();

  final phoneCont = TextEditingController();

  final commentCont = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Stack(
        children: [
          SizedBox(
            width: 390.w,
            height: 750.h,
            child: Column(
              children: [
                Padding(
                  padding: marginHV20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Бронирование стола',
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
                RoundedShadowContainer(
                  margin: marginHV10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.read<RestaurantContCubit>().state.name,
                        style: h18.copyWith(
                          color: AppColor.grey,
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: AppColor.grey,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: borderR6,
                              color: AppColor.lightGrey,
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Image.asset(
                              'assets/icons/calendar-outlined.png',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            context
                                .read<SelectedDateCubit>()
                                .state
                                .localizedTimeOfDay(context),
                            style: st16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: borderR6,
                              color: AppColor.lightGrey,
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Image.asset(
                              'assets/icons/user.png',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          BlocBuilder<GuestCountCubit, int>(
                            builder: (context, state) {
                              return Text(
                                '$state чел',
                                style: st16,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: marginHV20,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Введите данные',
                          style: h18,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        OutlinedTextField(
                          controller: nameCont,
                          hint: 'Ваше имя',
                          validator: fieldRequired('Ваше имя'),
                          action: TextInputAction.next,
                        ),
                        OutlinedTextField(
                          controller: phoneCont,
                          hint: '+ 996 --- --- ---',
                          type: TextInputType.number,
                          validator: fieldRequired('Номер телефона'),
                          action: TextInputAction.next,
                        ),
                        OutlinedMultilineField(
                          controller: commentCont,
                          hint: 'Коментарий',
                          action: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 390.w,
              padding: marginHV10,
              child: MalinaFilledButton(
                title: 'Забронировать',
                height: 60,
                function: () {
                  if (formKey.currentState!.validate()) {
                    context.read<BookingCubit>().book(
                          BookingModel(
                            id: DateTime.now().millisecondsSinceEpoch,
                            business: context.read<RestaurantContCubit>().state,
                            dateTime: context.read<SelectedDateCubit>().state,
                            guests: context.read<GuestCountCubit>().state,
                            status: BookingTypeEnum.confirmed,
                            name: nameCont.text,
                            phone: phoneCont.text,
                            comment: commentCont.text,
                          ),
                        );
                    context.pop();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
