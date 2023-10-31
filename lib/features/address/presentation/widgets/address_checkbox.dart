import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class AddressCheckbox extends StatefulWidget {
  final AddressModel address;
  const AddressCheckbox({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<AddressCheckbox> createState() => _AddressCheckboxState();
}

class _AddressCheckboxState extends State<AddressCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AddressContCubit>().select(
              widget.address,
            );
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          border: Border.all(
            color: isChecked ? AppColor.green : AppColor.grey,
            width: 1,
          ),
          color: isChecked ? AppColor.green : AppColor.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                color: AppColor.white,
                size: 20,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
