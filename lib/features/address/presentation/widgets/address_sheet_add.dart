import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_cubit.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_page_controller.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/selected_address_cubit.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/cubit/address_cont_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/phone_field.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';

class AddressSheetAdd extends StatefulWidget {
  const AddressSheetAdd({
    super.key,
  });

  @override
  State<AddressSheetAdd> createState() => _AddressSheetAddState();
}

class _AddressSheetAddState extends State<AddressSheetAdd> {
  final formKey = GlobalKey<FormState>();
  final nameCont = TextEditingController();
  final cityCont = TextEditingController();
  final streetCont = TextEditingController();
  final houseCont = TextEditingController();
  final entranceCont = TextEditingController();
  final floorCont = TextEditingController();
  final phoneCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Добавить адрес',
              style: h20,
            ),
            GestureDetector(
              onTap: () {
                context.read<AddressPageContCubit>().change(0);
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
        Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<AddressPageContCubit>().change(2);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        'Указать на карте',
                        style: st14,
                      ),
                    ),
                  ),
                ],
              ),
              OutlinedTextField(
                controller: nameCont,
                hint: 'Название адреса',
                validator: fieldRequired('Название адреса'),
              ),
              OutlinedTextField(
                controller: cityCont,
                hint: 'Город, район',
                validator: fieldRequired('Город, район'),
              ),
              OutlinedTextField(
                controller: streetCont,
                hint: 'Проспекст, улица',
                validator: fieldRequired('Проспекст, улица'),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedTextField(
                      controller: houseCont,
                      hint: 'Дом',
                      validator: fieldRequired('Дом'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: OutlinedTextField(
                      controller: entranceCont,
                      hint: 'Подъезд',
                      validator: fieldRequired('Подъезд'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: OutlinedTextField(
                      controller: floorCont,
                      hint: 'Этаж',
                      validator: fieldRequired('Этаж'),
                    ),
                  ),
                ],
              ),
              PhoneField(
                controller: phoneCont,
                autofocus: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      final selectedAddress =
                          context.read<SelectedAddressCubit>().state;
                      if (selectedAddress is Selected) {
                        if (formKey.currentState!.validate()) {
                          final address = AddressModel(
                            id: uuid.v1(),
                            name: nameCont.text,
                            city: cityCont.text,
                            street: streetCont.text,
                            house: houseCont.text,
                            entrance: entranceCont.text,
                            floor: floorCont.text,
                            phoneNumber: phoneCont.text,
                            location: selectedAddress.location.location,
                          );
                          context.read<AddressCubit>().addAddress(
                                address,
                              );
                          context.read<AddressContCubit>().select(
                                address,
                              );
                          context.read<SelectedAddressCubit>().empty();
                          context.read<AddressPageContCubit>().change(0);
                        }
                      } else {
                        context.read<AddressPageContCubit>().change(2);
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
