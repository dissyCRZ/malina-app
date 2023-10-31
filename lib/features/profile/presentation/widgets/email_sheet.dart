import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';

class EmailSheet extends StatelessWidget {
  EmailSheet({
    super.key,
  });
  final emailCont = TextEditingController();
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
                'Email',
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
              OutlinedTextField(
                controller: emailCont,
                hint: 'Введите эл. адрес',
                validator: fieldRequired('Email'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().changeEmail(emailCont.text);
                        context.read<MyInfoSheetContCubit>().change(0);
                      }
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
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
