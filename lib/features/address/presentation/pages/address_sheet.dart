import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_page_controller.dart';
import 'package:malina_mobile_app/features/address/presentation/widgets/address_sheet_add.dart';
import 'package:malina_mobile_app/features/address/presentation/widgets/address_sheet_map.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import '../cubit/selected_address_cubit.dart';
import '../widgets/address_sheet_main.dart';

class AddressSheet extends StatelessWidget {
  const AddressSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddressPageContCubit(),
        ),
        BlocProvider(
          create: (context) => SelectedAddressCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: BottomSheetContainer(
            height: 750.h,
            child: BlocBuilder<AddressPageContCubit, int>(
              builder: (context, state) {
                final List<Widget> pages = [
                  const AddressSheetMain(),
                  const AddressSheetAdd(),
                  const AddressSheetMap(),
                ];
                return pages[state];
              },
            ),
          ),
        );
      }),
    );
  }
}
