import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_products_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';
import 'package:malina_mobile_app/features/favourites/data/models/favourite_product.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import 'package:malina_mobile_app/shared/widgets/favourite_button.dart';
import '../../../../shared/configs/routes.dart';

class BarbershopProductContainer extends StatelessWidget {
  final BeautyProductModel product;
  const BarbershopProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final extra = <String, Cubit>{
          'barbershopContCubit': context.read<BarbershopContCubit>(),
          'beautyProductsCubit': context.read<BeautyProductsCubit>(),
        };
        context.goNamed(
          RoutesNames.aboutProduct,
          extra: extra,
          pathParameters: {
            'productId': product.id.toString(),
          },
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: borderR20,
              boxShadow: [
                smallShadow,
              ],
            ),
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(
                  child: CachedWithDefaultImage(
                    imageUrl: product.image,
                    defautImage: 'assets/debug/products/1.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: h16,
                      ),
                      Text(
                        product.shortDescription,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: st12,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: borderR12,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${product.price} C',
                    style: st16,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: BlocBuilder<FavouritesCubit, FavouritesState>(
              builder: (context, state) {
                final barbershop = context.read<BarbershopContCubit>().state;
                final isFavourite = context.read<FavouritesCubit>().isFavourite(
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
                  hasShadow: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
