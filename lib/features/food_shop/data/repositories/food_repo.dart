import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food_category.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';
import '../models/place.dart';

class FoodShopRepo {
   Future<BusinessModel?> getBusiness(int id) async {
    final response = await BaseHttpClient().get(
      'users/businesses/$id/',
    );
    if (response != null) {
      try {
        return BusinessModel.fromMap(
          jsonDecode(response),
        );
      } catch (e) {
        log('Someting wrong in getBusiness: $e');
      }
    }
    return null;
  }
  Future<List<BusinessModel>> businessList() async {
    List<BusinessModel> restaurants = [];
    final response = await BaseHttpClient().get(
      'users/businesses/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final restaurant in body) {
          try {
            if (restaurant['business_type'] == 1) {
              restaurants.add(
                BusinessModel.fromMap(
                  restaurant,
                ),
              );
            }
          } catch (e) {
            log('Restaurant from map - ${restaurant["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return restaurants;
  }

  Future<List<BusinessCategoryModel>> businessCategoryList() async {
    List<BusinessCategoryModel> categories = [];
    final response = await BaseHttpClient().get(
      'users/category/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response) as List;
        for (final product in body) {
          try {
            categories.add(
              BusinessCategoryModel.fromMap(
                product,
              ),
            );
          } catch (e) {
            log('businessCategoryList from map - ${product["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessCategoryList: $e');
      }
    }
    return categories;
  }

  Future<List<FoodModel>> productList() async {
    List<FoodModel> restaurants = [];
    final response = await BaseHttpClient().get(
      'products/product/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final product in body) {
          try {
            restaurants.add(
              FoodModel.fromMap(
                product,
              ),
            );
          } catch (e) {
            log('Food from map - ${product["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return restaurants;
  }

  Future<List<FoodCategoryModel>> categoryList() async {
    List<FoodCategoryModel> categories = [];
    final response = await BaseHttpClient().get(
      'products/product-category/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response) as List;
        for (final category in body) {
          try {
            categories.add(
              FoodCategoryModel.fromMap(
                category,
              ),
            );
          } catch (e) {
            log('Food categories from map - ${category["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in categoryList: $e');
      }
    }
    return categories;
  }
}
