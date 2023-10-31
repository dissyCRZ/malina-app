import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/favourites/data/enums/favourite_item_type.dart';
import 'package:malina_mobile_app/features/favourites/data/models/favourite_product.dart';
import 'package:malina_mobile_app/features/favourites/data/repositories/favourites_repo.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import '../../../food_shop/data/models/place.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit()
      : super(
          FavouritesEmpty(),
        );
  load() async {
    final products = await FavouritesRepo().favouriteBeautyProducts();
    final places = await FavouritesRepo().favouriteBusinesses();
    final foods = await FavouritesRepo().favouriteFoodProducts();
    emit(
      FavouritesLoaded(
        foods: foods,
        restaurants: places,
        products: products,
      ),
    );
  }

  empty() {
    emit(
      FavouritesEmpty(),
    );
  }

  favouriteAction([
    FoodModel? food,
    BusinessModel? restaurant,
    FavouriteProductModel? favouriteProduct,
  ]) {
    final currentState = super.state;
    if (currentState is FavouritesLoaded) {
      List<FoodModel> newFoods = [...currentState.foods];
      List<BusinessModel> newRestaurants = [...currentState.restaurants];
      List<FavouriteProductModel> newProducts = [...currentState.products];
      if (food != null) {
        if (newFoods.any((element) => element.id == food.id)) {
          newFoods.removeWhere((element) => element.id == food.id);
          FavouritesRepo().deleteFavouriteProducts(
            food.id,
            FavouriteItemTypeEnum.food,
          );
        } else {
          newFoods.add(food);
          FavouritesRepo().addFavouriteProducts(
            food.id,
            FavouriteItemTypeEnum.food,
          );
        }
        emit(
          FavouritesLoaded(
            foods: newFoods,
            restaurants: currentState.restaurants,
            products: currentState.products,
          ),
        );
      }
      if (restaurant != null) {
        if (newRestaurants.any((element) => element.id == restaurant.id)) {
          newRestaurants.removeWhere((element) => element.id == restaurant.id);
          FavouritesRepo().deleteFavouriteProducts(
            restaurant.id,
            FavouriteItemTypeEnum.business,
          );
        } else {
          newRestaurants.add(restaurant);
          FavouritesRepo().addFavouriteProducts(
            restaurant.id,
            FavouriteItemTypeEnum.business,
          );
        }
        emit(
          FavouritesLoaded(
            foods: currentState.foods,
            restaurants: newRestaurants,
            products: currentState.products,
          ),
        );
      }
      if (favouriteProduct != null) {
        if (newProducts.any(
          (element) =>
              element.barbershop.id == favouriteProduct.barbershop.id &&
              element.product.id == favouriteProduct.product.id,
        )) {
          newProducts.removeWhere(
            (element) =>
                element.barbershop.id == favouriteProduct.barbershop.id &&
                element.product.id == favouriteProduct.product.id,
          );
          FavouritesRepo().deleteFavouriteProducts(
            favouriteProduct.product.id,
            FavouriteItemTypeEnum.product,
          );
        } else {
          newProducts.add(favouriteProduct);
          FavouritesRepo().addFavouriteProducts(
            favouriteProduct.product.id,
            FavouriteItemTypeEnum.product,
          );
        }
        emit(
          FavouritesLoaded(
            foods: currentState.foods,
            restaurants: currentState.restaurants,
            products: newProducts,
          ),
        );
      }
    }
  }

  bool? isFavourite([
    FoodModel? food,
    BusinessModel? restaurant,
    FavouriteProductModel? favouriteProduct,
  ]) {
    final currentState = super.state;
    if (currentState is FavouritesLoaded) {
      if (food != null) {
        return currentState.foods.any(
          (element) => element.id == food.id,
        );
      }
      if (restaurant != null) {
        return currentState.restaurants.any(
          (element) => element.id == restaurant.id,
        );
      }
      if (favouriteProduct != null) {
        return currentState.products.any(
          (element) =>
              element.barbershop.id == favouriteProduct.barbershop.id &&
              element.product.id == favouriteProduct.product.id,
        );
      }
    }
    return null;
  }
}
