import 'service.dart';

class ServiceCategoryModel {
  final String id;
  final String name;
  List<ServiceModel> services;
  ServiceCategoryModel({
    required this.id,
    required this.name,
    required this.services,
  });
}
