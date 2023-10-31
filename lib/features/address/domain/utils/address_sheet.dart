import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_cubit.dart';
import 'package:malina_mobile_app/features/address/presentation/pages/address_sheet.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';

Future<dynamic> addressBottomSheet(
  BuildContext buildContext,
  AddressContCubit addressContCubit,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<AddressCubit>(context),
        ),
        BlocProvider.value(
          value: addressContCubit,
        ),
      ],
      child: const AddressSheet(),
    ),
    isScrollControlled: true,
  );
}
