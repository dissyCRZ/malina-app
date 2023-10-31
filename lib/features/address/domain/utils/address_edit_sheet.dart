import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_cubit.dart';
import 'package:malina_mobile_app/features/address/presentation/widgets/address_sheet_edit.dart';

Future<dynamic> addressEditBottomSheet(
  BuildContext buildContext,
  AddressModel address,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider<AddressCubit>.value(
      value: BlocProvider.of<AddressCubit>(context),
      child: AddressSheetEdit(
        address: address,
      ),
    ),
    isScrollControlled: true,
  );
}
