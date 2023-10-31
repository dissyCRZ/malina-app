import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String? phoneNumber;
  final bool? isEnabled;
  final bool? autofocus;
  const PhoneField({
    Key? key,
    required this.controller,
    this.phoneNumber,
    this.isEnabled,
    this.autofocus,
  }) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  PhoneNumber initNumber = PhoneNumber(isoCode: 'RU');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        if (widget.phoneNumber != null) {
          initNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
            widget.phoneNumber!,
          );
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      isEnabled: widget.isEnabled ?? true,
      onInputChanged: (PhoneNumber number) {
        setState(
          () {
            widget.controller.text = number.phoneNumber!;
          },
        );
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 20,
        useEmoji: true,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: initNumber,
      formatInput: true,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      errorMessage: 'Неправильный номер телефона',
      autoFocus: widget.autofocus ?? true,
      inputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.grey,
            width: 1,
          ),
          borderRadius: borderR10,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.grey,
            width: 1,
          ),
          borderRadius: borderR10,
        ),
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.grey,
            width: 1,
          ),
          borderRadius: borderR10,
        ),
        hintText: '_ _ _  _ _ _  _ _ _ ',
        hintStyle: it14,
      ),
      onSaved: (PhoneNumber number) {},
    );
  }
}
