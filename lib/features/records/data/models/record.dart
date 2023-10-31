import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/records/data/enums/record_type.dart';
import '../../../food_shop/data/models/place.dart';

class RecordModel {
  final int id;
  final DateTime time;
  final BusinessModel place;
  final RecordTypeEnum type;
  final List<int> services;
  final SpecialistModel specialist;
  final String name;
  final String phone;
  final String? comment;
  RecordModel({
    required this.id,
    required this.time,
    required this.place,
    required this.type,
    required this.services,
    required this.specialist,
    required this.name,
    required this.phone,
    this.comment,
  });
  factory RecordModel.fromMap(
    Map<String, dynamic> map,
    SpecialistModel specialist,
    BusinessModel place,
  ) {
    final time = DateTime.parse(
      map['appointment_time'],
    );
    return RecordModel(
      id: map['id'],
      time: time,
      place: place,
      type: time.compareTo(DateTime.now()) > 0
          ? RecordTypeEnum.upcoming
          : RecordTypeEnum.visited,
      services: (map['appointment_services'] as List)
          .map((e) => e['id'] as int)
          .toList(),
      specialist: specialist,
      name: map['name'],
      phone: map['phone'],
      comment: map['comment'],
    );
  }
}
