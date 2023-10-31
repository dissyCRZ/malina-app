import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/phone_field.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';
import '../cubit/address_page_controller.dart';

class AddressSheetEdit extends StatefulWidget {
  final AddressModel address;
  const AddressSheetEdit({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<AddressSheetEdit> createState() => _AddressSheetEditState();
}

class _AddressSheetEditState extends State<AddressSheetEdit> {
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
    return BottomSheetContainer(
      height: 750.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Изменить',
                style: h20,
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
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
                      //Todo: Add layered bottom sheets
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
                  initialValue: widget.address.name,
                ),
                OutlinedTextField(
                  controller: cityCont,
                  hint: 'Город, район',
                  validator: fieldRequired('Город, район'),
                  initialValue: widget.address.city,
                ),
                OutlinedTextField(
                  controller: streetCont,
                  hint: 'Проспекст, улица',
                  validator: fieldRequired('Проспекст, улица'),
                  initialValue: widget.address.street,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedTextField(
                        controller: houseCont,
                        hint: 'Дом',
                        validator: fieldRequired('Дом'),
                        initialValue: widget.address.house,
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
                        initialValue: widget.address.entrance,
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
                        initialValue: widget.address.floor,
                      ),
                    ),
                  ],
                ),
                PhoneField(
                  controller: phoneCont,
                  autofocus: false,
                  phoneNumber: widget.address.phoneNumber,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AddressCubit>().deleteAddress(
                                widget.address.id,
                              );
                          context.pop();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Удалить адрес',
                          style: h16.copyWith(
                            color: AppColor.malina,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AddressCubit>().editAddress(
                                AddressModel(
                                  id: widget.address.id,
                                  name: nameCont.text,
                                  city: cityCont.text,
                                  street: streetCont.text,
                                  house: houseCont.text,
                                  entrance: entranceCont.text,
                                  floor: floorCont.text,
                                  phoneNumber: phoneCont.text,
                                  location: widget.address.location,
                                ),
                              );
                          context.pop();
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
            ),
          ),
        ],
      ),
    );
  }
}
