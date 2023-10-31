import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/selected_address_cubit.dart';
import 'package:malina_mobile_app/features/yandex_map/presentation/cubit/yandex_map_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import '../../../address/presentation/cubit/address_page_controller.dart';
import '../widgets/yandex_map.dart';
import 'yandex_search.dart';

class YandexColumn extends StatelessWidget {
  const YandexColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YandexMapCubit(),
      child: Column(
        children: [
          const YandexSearchContainer(),
          const YandexMapContainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<SelectedAddressCubit, SelectedAddressState>(
                builder: (context, state) {
                  if (state is Selected) {
                    return GestureDetector(
                      onTap: () {
                        context.read<AddressPageContCubit>().change(1);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Сохранить',
                          style: h16.copyWith(
                            color: AppColor.green,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
