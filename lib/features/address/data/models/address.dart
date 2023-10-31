import 'package:malina_mobile_app/features/yandex_map/data/models/app_lat_long.dart';

class AddressModel {
  final String id;
  final String name;
  final String city;
  final String street;
  final String house;
  final String entrance;
  final String floor;
  final String phoneNumber;
  final AppLatLong location;
  AddressModel({
    required this.id,
    required this.name,
    required this.city,
    required this.street,
    required this.house,
    required this.entrance,
    required this.floor,
    required this.phoneNumber,
    required this.location,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'].toString(),
      name: map['name'] as String,
      city: map['city'] as String,
      street: map['street'] as String,
      house: map['house_number'] as String,
      entrance: map['entrance'] as String,
      floor: map['floor'] as String,
      phoneNumber: map['phone_number'] as String,
      location: AppLatLong(
        lat: double.parse(
          map['latitude'],
        ),
        long: double.parse(
          map['longitude'],
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'city': city,
      'street': street,
      'house_number': house,
      'entrance': entrance,
      'floor': floor,
      'phone_number': phoneNumber,
      'location': '$city, $street, $house',
      'latitude': location.lat,
      'longitude': location.long,
    };
  }
}
