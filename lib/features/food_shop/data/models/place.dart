import 'package:malina_mobile_app/features/restaurant_page/data/enums/affordability.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/app_lat_long.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';

class BusinessModel {
  final int id;
  final String name;
  final double rating;
  final int category;
  final double distance;
  final String description;
  final Affordability affordability;
  final int tip;
  final String addressName;
  final double waitTime;
  final AppLatLong coordinates;
  final String? workTime;
  final String? slogan;
  final String? image;
  final String? phoneNumber;
  final String? email;
  final String? instagram;
  final String? whatsapp;
  final String? telegram;

  BusinessModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.category,
    required this.distance,
    required this.description,
    required this.affordability,
    required this.tip,
    required this.addressName,
    required this.waitTime,
    required this.coordinates,
    this.workTime,
    this.slogan,
    this.image,
    this.phoneNumber,
    this.email,
    this.instagram,
    this.whatsapp,
    this.telegram,
  });
  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      id: map['id'],
      name: map['name'],
      description: map['description'] ?? '',
      category: map['category'] ?? 0,
      affordability: Affordability.values[random.nextInt(
        Affordability.values.length,
      )],
      image: map['image'],
      addressName: map['business_address']['name'] ?? '',
      rating: map['rating'] ?? (random.nextInt(6) + 4) / 2,
      tip: map['service_charge'] ?? 0,
      coordinates: AppLatLong(
        lat: 55.75 + random.nextDouble() * 10,
        long: 37.6 + random.nextDouble() * 10,
      ),
      distance: random.nextInt(10) + 10,
      waitTime: random.nextInt(10) * 5 + 10,
      slogan: map['slogan'],
      workTime: map['work_time'],
      email: map['email'],
      phoneNumber: map['phone'],
      instagram: map['instagram'],
      whatsapp: map['whatsapp'],
      telegram: map['telegram'],
    );
  }
}
