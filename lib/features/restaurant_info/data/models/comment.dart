import 'dart:math';
import 'package:malina_mobile_app/shared/constants/names.dart';

class CommentModel {
  final int id;
  final String name;
  final String email;
  final double rating;
  final String comment;
  final DateTime date;
  CommentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as int,
      name:
          '${firstNames[Random().nextInt(firstNames.length)]} ${firstNames[Random().nextInt(firstNames.length)]}',
      email: map['email'] as String,
      rating: Random().nextInt(6) / 2 + 2,
      comment: map['body'] as String,
      date: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(20),
        ),
      ),
    );
  }
}
