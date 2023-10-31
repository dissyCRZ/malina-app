import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_abstract_cont.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_product_cont.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_service_cont.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_specialist_cont.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_tag.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_product_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_service_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialist_category_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import '../../data/enums/barbershop_action.dart';
import '../cubit/barbershop_action_cubit.dart';

class BarbershopPageTags extends StatelessWidget {
  const BarbershopPageTags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: marginHV10,
      decoration: const BoxDecoration(
        color: AppColor.white,
      ),
      child: BlocBuilder<BarbershopActionCubit, BarbershopActionEnum>(
        builder: (context, state) {
          switch (state) {
            case BarbershopActionEnum.services:
              return BlocBuilder<SelectedBeautyServiceCategory, BeautyTagModel>(
                builder: (context, state) {
                  return BarbershopTagsList(
                    allTags: context.read<BeautyServiceCategoryCubit>().state,
                    tag: state,
                    cubit: context.read<SelectedBeautyServiceCategory>(),
                  );
                },
              );
            case BarbershopActionEnum.specialists:
              return BlocBuilder<SelectedBeautySpecialistCategory,
                  BeautyTagModel>(
                builder: (context, state) {
                  return BarbershopTagsList(
                    allTags:
                        context.read<BeautySpecialistCategoryCubit>().state,
                    tag: state,
                    cubit: context.read<SelectedBeautySpecialistCategory>(),
                  );
                },
              );
            case BarbershopActionEnum.products:
              return BlocBuilder<SelectedBeautyProductCategory, BeautyTagModel>(
                builder: (context, state) {
                  return BarbershopTagsList(
                    allTags: context.read<BeautyProductCategoryCubit>().state,
                    tag: state,
                    cubit: context.read<SelectedBeautyProductCategory>(),
                  );
                },
              );
            case BarbershopActionEnum.sale:
              break;
            case BarbershopActionEnum.info:
              break;
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class BarbershopTagsList extends StatelessWidget {
  final BeautyTagModel tag;
  final List<BeautyTagModel> allTags;
  final BarbershopAbstractCubit cubit;
  const BarbershopTagsList({
    Key? key,
    required this.tag,
    required this.allTags,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return allTags.isNotEmpty
        ? ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isSelected = tag == allTags[index];
              return GestureDetector(
                onTap: () {
                  cubit.change(
                    allTags[index],
                  );
                },
                child: BarbershopCategoryTagItem(
                  isSelected: isSelected,
                  tag: allTags[index],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemCount: allTags.length,
          )
        : BarbershopCategoryTagItem(
            isSelected: true,
            tag: BeautyCategoryModel(
              id: 0,
              name: allOfThemString,
              description: allOfThemString,
            ),
          );
  }
}

class BarbershopCategoryTagItem extends StatelessWidget {
  const BarbershopCategoryTagItem({
    super.key,
    required this.isSelected,
    required this.tag,
  });

  final bool isSelected;
  final BeautyTagModel tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: isSelected
            ? Border.all(
                color: AppColor.malina,
              )
            : Border.all(
                color: AppColor.grey,
                width: 1,
              ),
        color: isSelected ? AppColor.malina : AppColor.white,
      ),
      alignment: Alignment.center,
      child: Text(
        tag.name,
        style: isSelected
            ? st16.copyWith(
                color: AppColor.white,
              )
            : st16,
      ),
    );
  }
}
