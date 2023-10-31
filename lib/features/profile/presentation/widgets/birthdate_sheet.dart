import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';

class BirtDateSheet extends StatelessWidget {
  BirtDateSheet({
    super.key,
  });
  final formKey = GlobalKey<FormState>();
  final dayCont = TextEditingController();
  final monthCont = TextEditingController();
  final yearCont = TextEditingController();

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
                'Дата рождения',
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
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: OutlinedTextField(
                      controller: dayCont,
                      hint: 'ДД',
                      type: TextInputType.number,
                      validator: fieldRequired('ДД'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: OutlinedTextField(
                      controller: monthCont,
                      hint: 'ММ',
                      type: TextInputType.number,
                      validator: fieldRequired('ММ'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: OutlinedTextField(
                      controller: yearCont,
                      hint: 'ГГГГ',
                      type: TextInputType.number,
                      validator: fieldRequired('ГГГГ'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        try {
                          context.read<LoginCubit>().changeBirtdate(
                                DateTime(
                                  double.parse(yearCont.text).toInt(),
                                  double.parse(monthCont.text).toInt(),
                                  double.parse(dayCont.text).toInt(),
                                ),
                              );
                          context.read<MyInfoSheetContCubit>().change(0);
                        } catch (e) {
                          debugPrint(e.toString());
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
