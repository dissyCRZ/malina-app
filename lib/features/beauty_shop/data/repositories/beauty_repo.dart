import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_specialty.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';
import '../../../food_shop/data/models/place.dart';

class BeautyRepo {
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
  Future<BeautyProductModel?> getProduct(int id) async {
    final response = await BaseHttpClient().get(
      'beauty/beauty-products/$id/',
    );
    if (response != null) {
      try {
        return BeautyProductModel.fromMap(
          jsonDecode(response),
        );
      } catch (e) {
        log('Someting wrong in getBusiness: $e');
      }
    }
    return null;
  }

  Future<SpecialistModel?> getSpecialist(int id) async {
    final response = await BaseHttpClient().get(
      'beauty/masters/$id/',
    );
    if (response != null) {
      try {
        return SpecialistModel.fromMap(
          jsonDecode(response),
        );
      } catch (e) {
        log('Someting wrong in getSpecialist: $e');
      }
    }
    return null;
  }

  Future<List<BusinessModel>> businessList() async {
    List<BusinessModel> places = [];
    final response = await BaseHttpClient().get(
      'users/businesses/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final barbershop in body) {
          try {
            if (barbershop['business_type'] == 2) {
              places.add(
                BusinessModel.fromMap(
                  barbershop,
                ),
              );
            }
          } catch (e) {
            log('Barbershop from map - ${barbershop["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return places;
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

  Future<List<BeautyProductModel>> productList() async {
    List<BeautyProductModel> products = [];
    final response = await BaseHttpClient().get(
      'beauty/beauty-products/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final product in body) {
          try {
            products.add(
              BeautyProductModel.fromMap(
                product,
              ),
            );
          } catch (e) {
            log('product from map - ${product["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in productList: $e');
      }
    }
    return products;
  }

  Future<List<ServiceModel>> servicesList() async {
    List<ServiceModel> services = [];
    final response = await BaseHttpClient().get(
      'beauty/beauty_services/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final service in body) {
          try {
            services.add(
              ServiceModel.fromMap(
                service,
              ),
            );
          } catch (e) {
            log('service from map - ${service["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in servicesList: $e');
      }
    }
    return services;
  }

  Future<List<SpecialistModel>> specialistsList() async {
    List<SpecialistModel> specialists = [];
    final response = await BaseHttpClient().get(
      'beauty/masters/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final specialist in body) {
          try {
            specialists.add(
              SpecialistModel.fromMap(
                specialist,
              ),
            );
          } catch (e) {
            log('specialist from map - ${specialist["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in specialistsList: $e');
      }
    }
    return specialists;
  }

  Future<List<BeautyCategoryModel>> categoryList(String url) async {
    List<BeautyCategoryModel> categories = [];
    final response = await BaseHttpClient().get(
      'beauty/$url/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final category in body) {
          try {
            categories.add(
              BeautyCategoryModel.fromMap(
                category,
              ),
            );
          } catch (e) {
            log('Categories from map - ${category["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return categories;
  }

  Future<List<BeautySpecialtyModel>> specialtyList() async {
    List<BeautySpecialtyModel> specialties = [];
    final response = await BaseHttpClient().get(
      'beauty/master-specialty/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final specialty in body) {
          try {
            specialties.add(
              BeautySpecialtyModel.fromMap(
                specialty,
              ),
            );
          } catch (e) {
            log('Specialties from map - ${specialty["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return specialties;
  }
}
