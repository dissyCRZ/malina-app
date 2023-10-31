import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';
import '../cubit/myinfo_controller.dart';

class FirstLastNameSheet extends StatelessWidget {
  FirstLastNameSheet({
    super.key,
  });
  final nameCont = TextEditingController();
  final lastCont = TextEditingController();
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
                'Имя фамилия',
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
                controller: nameCont,
                hint: 'Ваше имя',
                validator: fieldRequired('Ваше имя'),
              ),
              OutlinedTextField(
                controller: lastCont,
                hint: 'Ваша фамилия',
                validator: fieldRequired('Ваша фамилия'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().changeUserName(
                              nameCont.text,
                            );
                        context.read<LoginCubit>().changeSurname(
                              lastCont.text,
                            );
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
