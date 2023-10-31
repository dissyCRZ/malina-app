// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../shared/configs/texts.dart';
import '../../../../shared/constants/colors.dart';

class OutlinedMultilineField extends StatefulWidget {
  final String? title;
  final String? initialValue;
  final String? hint;
  final double? width;
  final TextInputType? type;
  final TextInputAction? action;
  const OutlinedMultilineField({
    Key? key,
    this.title,
    this.initialValue,
    this.hint,
    this.width,
    this.type,
    this.action,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<OutlinedMultilineField> createState() => _OutlinedMultilineFieldState();
}

class _OutlinedMultilineFieldState extends State<OutlinedMultilineField> {
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
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.grey,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.multiline,
            textInputAction: widget.action,
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
