// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/phone_field.dart';

import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/configs/validators.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_multiline_field.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_text_field.dart';

import '../../../../shared/constants/margin.dart';

class RecordCommentForm extends StatelessWidget {
  const RecordCommentForm({
    Key? key,
    required this.formKey,
    required this.nameCont,
    required this.phoneCont,
    required this.commentCont,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCont;
  final TextEditingController phoneCont;
  final TextEditingController commentCont;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginHV20,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Введите данные',
              style: h18,
            ),
            const SizedBox(
              height: 12,
            ),
            OutlinedTextField(
              controller: nameCont,
              hint: 'Ваше имя',
              validator: fieldRequired('Ваше имя'),
              action: TextInputAction.next,
            ),
            PhoneField(
              controller: phoneCont,
              autofocus: false,
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedMultilineField(
              controller: commentCont,
              hint: 'Коментарий',
              action: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
