import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:malina_mobile_app/features/restaurant_info/data/models/comment.dart';

class CommentsRepository {
  static const url = 'https://jsonplaceholder.typicode.com/comments?_limit=20';
  Future<List<CommentModel>> getComments() async {
    List<CommentModel> comments = [];
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode < 300) {
        final data = jsonDecode(response.body) as List;
        for (final comment in data) {
          try {
            comments.add(
              CommentModel.fromMap(comment),
            );
          } catch (e) {
            log('Individual comment:$e');
          }
        }
      }
    } catch (e) {
      log(
        'All comments:$e',
      );
    }
    return comments;
  }
}
