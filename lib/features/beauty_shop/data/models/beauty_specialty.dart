import 'dart:convert';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_tag.dart';

class BeautySpecialtyModel extends BeautyTagModel {
  BeautySpecialtyModel({
    required super.id,
    required super.name,
  });

  factory BeautySpecialtyModel.fromMap(Map<String, dynamic> map) {
    return BeautySpecialtyModel(
      id: map['id'] as int,
      name: utf8.decode(map['specialty_name'].toString().codeUnits),
    );
  }
}
