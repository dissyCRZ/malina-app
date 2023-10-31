import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_product_cont.dart';
import 'package:malina_mobile_app/features/barbershop_products/presentation/widgets/product_container.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_tag.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_products_cubit.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';

class BarbershopProductsSliver extends StatelessWidget {
  const BarbershopProductsSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final allProducts = context.read<BeautyProductsCubit>().state;
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
        bottom: 80.h,
      ),
      sliver: BlocBuilder<SelectedBeautyProductCategory, BeautyTagModel>(
        builder: (context, state) {
          final products = state.name == allOfThemString
              ? allProducts
              : allProducts
                  .where(
                    (element) => element.category == state.id,
                  )
                  .toList();
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.66,
            ),
            itemBuilder: (context, index) => BarbershopProductContainer(
              product: products[index],
            ),
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
