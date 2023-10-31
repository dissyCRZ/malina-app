import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/filter_sheet/presentation/cubit/filter_sheet_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';

class FilterSheet extends StatelessWidget {
  final List<String> titles;
  const FilterSheet({
    Key? key,
    required this.titles,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Фильтр',
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
            height: 15,
          ),
          const Text(
            'Показать',
            style: h18,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<FilterSheetCubit, int>(
              builder: (context, state) {
                return ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      context.read<FilterSheetCubit>().select(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: borderR10,
                        color: state == index + 1
                            ? AppColor.lightGrey
                            : AppColor.white,
                      ),
                      height: 45,
                      child: Text(
                        titles[index],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: titles.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
