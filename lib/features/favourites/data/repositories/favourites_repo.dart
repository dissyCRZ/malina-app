import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';
import 'package:malina_mobile_app/features/favourites/data/enums/favourite_item_type.dart';
import 'package:malina_mobile_app/features/favourites/data/models/favourite_product.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';
import '../../../food_shop/data/models/place.dart';

class FavouritesRepo {
  Future<BeautyProductModel?> getBeautyProduct(int id) async {
    try {
      return BeautyProductModel.fromMap(
        jsonDecode(
          await BaseHttpClient().get('beauty/beauty-products/$id'),
        ),
      );
    } catch (e) {
      log('Someting wrong in getProduct: $e');
    }
    return null;
  }

  Future<BusinessModel?> getBarbershop(int id) async {
    try {
      return BusinessModel.fromMap(
        jsonDecode(
          await BaseHttpClient().get('users/businesses/$id'),
        ),
      );
    } catch (e) {
      log('Someting wrong in getProduct: $e');
    }
    return null;
  }

  Future<List<FavouriteProductModel>> favouriteBeautyProducts() async {
    List<FavouriteProductModel> favourites = [];
    final response = await BaseHttpClient().get('beauty/beauty-favorites/');
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final favourite in body) {
          try {
            final product = await getBeautyProduct(
              favourite['favorite_product']['id'],
            );
            final barbershop = await getBarbershop(
              product!.supplierId,
            );
            favourites.add(
              FavouriteProductModel(
                id: DateTime.now().millisecondsSinceEpoch,
                barbershop: barbershop!,
                product: product,
              ),
            );
          } catch (e) {
            log('favouriteBeautyProducts - ${favourite['favorite_product']['id']}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return favourites;
  }

  Future<List<FoodModel>> favouriteFoodProducts() async {
    List<FoodModel> favourites = [];
    final response = await BaseHttpClient().get('products/favourite-product/');
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final favourite in body) {
          try {
            final food = FoodModel.fromMap(favourite);
            favourites.add(
              food,
            );
          } catch (e) {
            log('favouriteFoodProducts - ${favourite['favorite_product']}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return favourites;
  }

  Future<List<BusinessModel>> favouriteBusinesses() async {
    List<BusinessModel> favourites = [];
    final response = await BaseHttpClient().get('users/favourite-businesses/');
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final favourite in body) {
          try {
            final place = BusinessModel.fromMap(favourite['business']);
            favourites.add(
              place,
            );
          } catch (e) {
            log('favouriteBusinesses - ${favourite['favorite_product']}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return favourites;
  }

  addFavouriteProducts(int id, FavouriteItemTypeEnum type) async {
    try {
      final response = await BaseHttpClient().put(getFavouriteUrl(type), {
        "favorite_product": id,
      });
      if (response != null) {
        log(
          response.toString(),
        );
      }
    } catch (e) {
      log('Someting wrong in addresses: $e');
    }
  }

  deleteFavouriteProducts(int id, FavouriteItemTypeEnum type) async {
    String url = '${getFavouriteUrl(type)}$id/';
    if (type == FavouriteItemTypeEnum.product) {
      url = '${url}delete/';
    }
    try {
      final response = await BaseHttpClient().delete(url);
      if (response != null) {
        log(
          response.toString(),
        );
      }
    } catch (e) {
      log('Someting wrong in addresses: $e');
    }
  }

  String getFavouriteUrl(FavouriteItemTypeEnum type) {
    switch (type) {
      case FavouriteItemTypeEnum.food:
        return 'products/favourite-product/';
      case FavouriteItemTypeEnum.product:
        return 'beauty/beauty-favorites/';
      case FavouriteItemTypeEnum.business:
        return 'users/favourite-businesses/';
    }
  }
}
