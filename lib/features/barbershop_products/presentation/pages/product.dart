import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_products_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/beauty_cart_cubit.dart';
import 'package:malina_mobile_app/features/favourites/data/models/favourite_product.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_description.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_page_main_image.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/food_page_order_button.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/favourite_button.dart';
import '../../../restaurant_foods/presentation/widgets/sold_together_list.dart';
import '../cubit/product_controller.dart';

class BarbershopProductPage extends StatelessWidget {
  final int productId;
  const BarbershopProductPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barbershop = context.read<BarbershopContCubit>().state;
    final product = context.read<BeautyProductsCubit>().getById(productId);
    return BlocProvider(
      create: (context) => ProductContCubit(product),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 390.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ProductPageMainImage(
                      product: product,
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 25,
                      color: Colors.black,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  leadingWidth: 30,
                  title: Text(
                    product.name,
                    style: h20,
                  ),
                  actions: [
                    BlocBuilder<FavouritesCubit, FavouritesState>(
                      builder: (context, state) {
                        final isFavourite =
                            context.read<FavouritesCubit>().isFavourite(
                                  null,
                                  null,
                                  FavouriteProductModel(
                                    id: DateTime.now().millisecondsSinceEpoch,
                                    barbershop: barbershop,
                                    product: product,
                                  ),
                                );
                        return FavouriteButton(
                          isFavourite: isFavourite,
                          function: () {
                            context.read<FavouritesCubit>().favouriteAction(
                                  null,
                                  null,
                                  FavouriteProductModel(
                                    id: DateTime.now().millisecondsSinceEpoch,
                                    barbershop: barbershop,
                                    product: product,
                                  ),
                                );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: 390.w,
                    padding: marginHV20,
                    margin: const EdgeInsets.only(
                      top: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(22),
                      ),
                      boxShadow: [
                        bigShadow,
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDescription(
                          product: product,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (product.relatedProducts != null &&
                            product.relatedProducts!.isNotEmpty)
                          SoldTogetherList(
                            product: product,
                          ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 10,
              child: FoodPageOrderButton(
                price: product.price,
                function: () {
                  context.read<BeautyCartCubit>().addOrder(product, 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
