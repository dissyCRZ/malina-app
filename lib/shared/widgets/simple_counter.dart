import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class SimpleCounter extends StatefulWidget {
  final int? initialValue;
  const SimpleCounter({
    Key? key,
    this.initialValue,
  }) : super(key: key);

  @override
  State<SimpleCounter> createState() => _SimpleCounterState();
}

class _SimpleCounterState extends State<SimpleCounter> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      count = widget.initialValue ?? 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (count > 1) {
                count--;
              }
            });
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.lightGrey,
            child: Icon(
              Icons.remove,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          count.toString(),
          style: h16,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              count++;
            });
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.lightGrey,
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ],
    );
  }
}
