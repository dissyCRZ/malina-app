import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import '../../../../shared/configs/texts.dart';
import '../../../../shared/constants/colors.dart';

class OutlinedDropdown extends StatefulWidget {
  final List<String> items;
  final String? title;
  final String? initialValue;
  final String? hint;
  final double? width;
  final Function? changeFunction;
  final TextInputType? type;
  const OutlinedDropdown({
    Key? key,
    required this.items,
    this.title,
    this.initialValue,
    this.hint,
    this.width,
    this.changeFunction,
    this.type,
  }) : super(key: key);

  @override
  State<OutlinedDropdown> createState() => _OutlinedDropdownState();
}

class _OutlinedDropdownState extends State<OutlinedDropdown> {
  String? selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.initialValue != null) {
      selectedValue = widget.initialValue!;
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
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            value: selectedValue,
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: st16,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (widget.changeFunction != null) {
                widget.changeFunction!(value);
              }
              setState(() {
                selectedValue = value!;
              });
            },
            hint: Text(
              widget.hint ?? 'Выберите',
              style: it14,
            ),
            buttonStyleData: ButtonStyleData(
              width: widget.width ?? double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.grey,
                  width: 1,
                ),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColor.grey,
              ),
              iconSize: 25,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  smallShadow,
                ],
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
