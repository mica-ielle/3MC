import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/Comment.dart';
import '../config/api_config.dart';

class CommentsServices {

  /* add a comment to a jobOffer */
  static Future<bool> addComment(String token, String commantaire, String idJob, String idUser) async {
    final url = Uri.parse('$apiUrl/comment/${idUser}/new-comment');

    var queryParams = {
      'userID': '$idUser',
      'contenu': '$commantaire',
      'jobId': '$idJob',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var request = http.Request('POST',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('POST',url1);

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      // commentaire ajouté
      return true;
    } else {
      // Erreur lors de l'ajout du commentaire
      return false;
    }
  }

  /* get all comments */
  Future<List<Comment>> getComments() async {
    final response = await http.get(Uri.parse('$apiUrl/comment/comments'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  /* get all the comments setted by a specific user */
  Future<List<Comment>> getUserComments(String token, String userId) async {
    final response = await http.get(
        Uri.parse('$apiUrl/comment/getUserComments/${userId}'),
      headers: <String, String>{
        'Authorization':'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  /* get all comments setter for a jobOffer */
  Future<List<Comment>> getJobComments(String jobId) async {
    final response = await http.get(Uri.parse('$apiUrl/comment/getJobComments/${jobId}'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

}
