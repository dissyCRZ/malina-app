import 'dart:convert';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_tag.dart';

class BeautyCategoryModel extends BeautyTagModel {
  final String description;
  BeautyCategoryModel({
    required super.id,
    required super.name,
    required this.description,
  });

  factory BeautyCategoryModel.fromMap(Map<String, dynamic> map) {
    return BeautyCategoryModel(
      id: map['id'] as int,
      name: utf8.decode(map['category_name'].toString().codeUnits),
      description: utf8.decode(map['category'].toString().codeUnits),
    );
  }
}
