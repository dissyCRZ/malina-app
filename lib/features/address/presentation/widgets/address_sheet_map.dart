import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_page_controller.dart';
import 'package:malina_mobile_app/features/yandex_map/presentation/pages/yandex_column.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';

class AddressSheetMap extends StatelessWidget {
  const AddressSheetMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Адреса',
              style: h20,
            ),
            GestureDetector(
              onTap: () {
                context.read<AddressPageContCubit>().change(1);
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
      const YandexColumn(),
      ],
    );
  }
}
