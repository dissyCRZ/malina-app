import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_specialty.dart';

class SpecialistModel {
  final int id;
  final int businessId;
  final String name;
  final String? imageUrl;
  final double? averageRating;
  final BeautySpecialtyModel category;
  final List<String> portfolio;
  SpecialistModel({
    required this.id,
    required this.businessId,
    required this.name,
    this.imageUrl,
    this.averageRating,
    required this.category,
    required this.portfolio,
  });

//*Fix the constructor

  factory SpecialistModel.fromMap(Map<String, dynamic> map) {
    return SpecialistModel(
      id: map['id'],
      businessId: map['master_business'],
      name: map['master_name'],
      imageUrl: map['master_profile_picture'],
      averageRating: map['average_rating'],
      category: BeautySpecialtyModel.fromMap(map['master_specialty']),
      portfolio: List<String>.from(
        map['master_works'] ?? [],
      ),
    );
  }
}
