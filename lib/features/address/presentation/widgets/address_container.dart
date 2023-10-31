import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/address/domain/utils/address_edit_sheet.dart';
import 'package:malina_mobile_app/features/address/presentation/widgets/address_checkbox.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import '../../data/models/address.dart';

class AddressContainer extends StatelessWidget {
  final AddressModel address;
  const AddressContainer({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  style: h14,
                ),
                Text(
                  address.city,
                  style: h14,
                ),
                Text(
                  "${address.street}${address.house}/${address.floor}",
                  style: it12,
                ),
                Text(
                  address.phoneNumber,
                  style: it12,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddressCheckbox(
                address: address,
              ),
              GestureDetector(
                onTap: () {
                  addressEditBottomSheet(context, address);
                },
                child: Image.asset(
                  'assets/icons/edit.png',
                  height: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
