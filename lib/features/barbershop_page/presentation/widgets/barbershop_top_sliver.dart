import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/widgets/barbershop_appbar_items.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class BarbershopTopSliver extends StatelessWidget {
  const BarbershopTopSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final barbershop = context.read<BarbershopContCubit>().state;
    return SliverAppBar(
      backgroundColor: AppColor.white,
      pinned: true,
      elevation: 0,
      title: const RestaurantTopSliverTitle(),
      automaticallyImplyLeading: false,
      expandedHeight: 390.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'restaurant-page-image${barbershop.id}',
          child: CachedWithDefaultImage(
            imageUrl: barbershop.image,
            defautImage: 'assets/debug/barbershops/1.jpg',
          ),
        ),
      ),
      floating: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: BarbershopTopSliverBottom(),
      ),
    );
  }
}

class BarbershopTopSliverBottom extends StatelessWidget {
  const BarbershopTopSliverBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final barbershop = context.read<BarbershopContCubit>().state;
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Image.asset(
              'assets/icons/back.png',
              height: 12,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              barbershop.name,
              style: h18,
            ),
          ),
          SizedBox(
            width: 120.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BarbershopAppBarItem(
                  icon: 'search',
                ),
                const BarbershopAppBarItem(
                  icon: 'upload',
                ),
                BarbershopAppBarItem(
                  icon: 'heart-outlined',
                  function: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantTopSliverTitle extends StatelessWidget {
  const RestaurantTopSliverTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BarbershopAppBarItem(
          icon: 'back',
          function: () {
            context.pop();
          },
        ),
        SizedBox(
          width: 120.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BarbershopAppBarItem(
                icon: 'search',
              ),
              const BarbershopAppBarItem(
                icon: 'upload',
              ),
              BarbershopAppBarItem(
                icon: 'heart-outlined',
                function: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
