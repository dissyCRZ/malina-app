// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/configs/texts.dart';
import '../../../../shared/constants/colors.dart';

class OutlinedTextField extends StatefulWidget {
  final String? title;
  final String? initialValue;
  final String? hint;
  final double? width;
  final String? Function(String?)? validator;
  final TextInputType? type;
  final TextInputAction? action;
  const OutlinedTextField({
    Key? key,
    this.title,
    this.initialValue,
    this.hint,
    this.width,
    this.validator,
    this.type,
    this.action,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<OutlinedTextField> createState() => _OutlinedTextFieldState();
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.initialValue != null) {
      widget.controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: it14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )
            : const SizedBox.shrink(),
        Container(
          width: widget.width,
          height: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.grey,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: TextFormField(
            controller: widget.controller,
            textInputAction: widget.action,
            keyboardType: widget.type,
            validator: widget.validator,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              hintText: widget.hint,
              hintStyle: it14,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
