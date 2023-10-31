import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/domain/utils/address_sheet.dart';
import 'package:malina_mobile_app/features/booking/domain/utils/my_booking_sheet.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/features/profile/data/datasources/last_visits.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/last_visit_container.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/personal_account_item.dart';
import 'package:malina_mobile_app/features/records/domain/utils/records_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';

class PersonalAccount extends StatelessWidget {
  const PersonalAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressContCubit(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(26),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalAccountItem(
                  title: 'Мои записи',
                  icon: 'note',
                  function: () {
                    recordsBottomSheet(
                      context,
                    );
                  },
                ),
                PersonalAccountItem(
                  title: 'Бронирования',
                  icon: 'note',
                  function: () {
                    myBookingBottomSheet(
                      context,
                    );
                  },
                ),
                const PersonalAccountItem(
                  title: 'Мои купоны',
                  icon: 'coupon',
                ),
                Builder(
                  builder: (context) {
                    return PersonalAccountItem(
                      title: 'Адреса',
                      icon: 'location',
                      function: () {
                        addressBottomSheet(
                          context,
                          context.read<AddressContCubit>(),
                        );
                      },
                    );
                  },
                ),
                const PersonalAccountItem(
                  title: 'Вакансии',
                  icon: 'vacation',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Последние посещения',
                  style: h18,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 90,
                  child: ListView.separated(
                    itemBuilder: (context, index) => LastVisitContainer(
                      visit: lastVisitsList[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: lastVisitsList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'О приложении',
                  style: h18,
                ),
                SizedBox(
                  height: 15,
                ),
                PersonalAccountItem(
                  title: 'Пользовательское соглашение',
                  icon: 'info',
                ),
                PersonalAccountItem(
                  title: 'Оферта',
                  icon: 'offer',
                ),
                PersonalAccountItem(
                  title: 'Оценить приложение',
                  icon: 'star',
                ),
                PersonalAccountItem(
                  title: 'О приложении',
                  icon: 'app',
                ),
              ],
            ),
            const MalinaFilledButton(
              title: 'Для бизнеса',
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
