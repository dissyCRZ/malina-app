// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/records/domain/utils/added_record_thanks.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/record_comment_form.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';

import '../../../food_shop/data/models/place.dart';
import '../../data/enums/record_type.dart';
import '../../data/models/record.dart';
import '../cubit/records_cubit.dart';
import '../widgets/record_comment_services_list.dart';

class AddRecordCommentSheet extends StatefulWidget {
  final List<int> services;
  final SpecialistModel specialist;
  final BusinessModel barbershop;
  final DateTime time;
  const AddRecordCommentSheet({
    Key? key,
    required this.services,
    required this.specialist,
    required this.barbershop,
    required this.time,
  }) : super(key: key);

  @override
  State<AddRecordCommentSheet> createState() => _AddRecordCommentSheetState();
}

class _AddRecordCommentSheetState extends State<AddRecordCommentSheet> {
  final formKey = GlobalKey<FormState>();
  final nameCont = TextEditingController();
  final phoneCont = TextEditingController();
  final commentCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomSheetContainer(
          height: 750.h,
          hasPadding: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: marginHV20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Запись',
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
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RecordCommentServicesList(
                        services: widget.services,
                        specialist: widget.specialist,
                        business: widget.barbershop,
                        time: widget.time,
                      ),
                      RecordCommentForm(
                        formKey: formKey,
                        nameCont: nameCont,
                        phoneCont: phoneCont,
                        commentCont: commentCont,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20.w,
          child: MalinaFilledButton(
            width: 350.w,
            height: 60,
            title: 'Записаться',
            function: () async {
              if (formKey.currentState!.validate()) {
                log(phoneCont.text);
                Navigator.popUntil(
                  context,
                  (route) => route.settings.name == 'barbershop',
                );
                final record = await context.read<RecordsCubit>().addRecord(
                      RecordModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        place: widget.barbershop,
                        time: DateTime.now(),
                        specialist: widget.specialist,
                        services: widget.services,
                        type: RecordTypeEnum.upcoming,
                        name: nameCont.text,
                        phone: phoneCont.text,
                        comment: commentCont.text,
                      ),
                    );
                if (record != null && context.mounted) {
                  addedRecordThanksBottomSheet(
                    context,
                    record.id.toString(),
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
