import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_category.dart';

class ServiceModel {
  final int id;
  final int businessId;
  final int specialistId;
  final String name;
  final int timeMinutes;
  final double price;
  final BeautyCategoryModel category;
  ServiceModel({
    required this.id,
    required this.businessId,
    required this.specialistId,
    required this.name,
    required this.timeMinutes,
    required this.price,
    required this.category,
  });
  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      businessId: map['beauty_service_business'],
      specialistId: map['beauty_service_master'],
      name: map['beauty_service_name'],
      timeMinutes: map['beauty_service_duration_minutes'],
      price: map['beauty_service_price'] as double,
      category: BeautyCategoryModel.fromMap(
        map['beauty_service_category'],
      ),
    );
  }
}
