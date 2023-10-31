import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/phone_field.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';

class PhoneEditSheet extends StatelessWidget {
  PhoneEditSheet({
    super.key,
  });
  final phoneCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Номер телефона',
                style: h20,
              ),
              GestureDetector(
                onTap: () {
                  context.read<MyInfoSheetContCubit>().change(0);
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
          Column(
            children: [
              PhoneField(
                controller: phoneCont,
                phoneNumber: context.read<LoginCubit>().getPhoneNumber(),
              ),
              MalinaFilledButton(
                title: 'Подтвердить',
                height: 60,
                function: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().changePhone(phoneCont.text);
                    context.read<MyInfoSheetContCubit>().change(0);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
