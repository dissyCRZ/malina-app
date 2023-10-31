import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/custom_checkbox.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';

class PasswordSheet extends StatelessWidget {
  PasswordSheet({
    Key? key,
  }) : super(key: key);

  final firstpasswordCont = TextEditingController();
  final secondpasswordCont = TextEditingController();
  final lastpasswordCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final currentState = context.read<LoginCubit>().state;
    final hasPassword =
        currentState is LoggedIn && currentState.user.password != null;
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Пароль',
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
              hasPassword
                  ? OutlinedTextField(
                      controller: firstpasswordCont,
                      hint: 'Введите текуший пароль',
                    )
                  : const SizedBox.shrink(),
              OutlinedTextField(
                controller: secondpasswordCont,
                hint: 'Введите новый пароль',
                validator: fieldRequired('новый пароль'),
              ),
              OutlinedTextField(
                controller: lastpasswordCont,
                hint: 'Введите пароль повторно',
                validator: fieldRequired('пароль повторно'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CustomCheckbox(),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Запомнить пароль',
                        style: it14,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final currentState = context.read<LoginCubit>().state;
                        if (currentState is LoggedIn) {
                          if (currentState.user.password != null) {
                            if (firstpasswordCont.text != '' &&
                                firstpasswordCont.text ==
                                    currentState.user.password) {
                              context
                                  .read<LoginCubit>()
                                  .changePassword(lastpasswordCont.text);
                              context.read<MyInfoSheetContCubit>().change(0);
                            }
                          } else {
                            context
                                .read<LoginCubit>()
                                .changePassword(lastpasswordCont.text);
                            context.read<MyInfoSheetContCubit>().change(0);
                          }
                        } else {
                          context
                              .read<LoginCubit>()
                              .changePassword(lastpasswordCont.text);
                          context.read<MyInfoSheetContCubit>().change(0);
                        }
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
