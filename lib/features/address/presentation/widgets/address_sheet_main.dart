import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_cubit.dart';
import 'package:malina_mobile_app/features/address/presentation/widgets/add_address_button.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'address_container.dart';

class AddressSheetMain extends StatelessWidget {
  const AddressSheetMain({
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
                context.pop();
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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500.h,
          ),
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => AddressContainer(
                  address: state.addresses[index],
                ),
                itemCount: state.addresses.length,
              );
            },
          ),
        ),
        const AddAddressButton(),
      ],
    );
  }
}
