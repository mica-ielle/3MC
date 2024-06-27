import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/Like.dart';
import '../config/api_config.dart';

class LikesServices {

  /* unlike a jobOffer */
  static Future<bool> removeLike(String token, String idJob, String idUser) async {
    final url = Uri.parse('$apiUrl/like/${idUser}/unlike');

    var queryParams = {
      'userID': '$idUser',
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
      return true;
    } else {
      return false;
    }
  }

  /* like a jobOffer */
  static Future<bool> addLike(String token, String idJob, String idUser) async {
    final url = Uri.parse('$apiUrl/like/${idUser}/like');

    var queryParams = {
      'userID': '$idUser',
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
      return true;
    } else {
      return false;
    }
  }

  /* get all the likes */
  Future<List<Like>> getLikes() async {
    final response = await http.get(Uri.parse('$apiUrl/like/Likes'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Like.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load likes');
    }
  }

  /* get all the likes setted by a specific user */
  Future<List<Like>> getUserLikes(String token, String userId) async {
    final response = await http.get(
        Uri.parse('$apiUrl/like/getUserLikes/${userId}'),
      headers: <String, String>{
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Like.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load likes');
    }
  }

  /* get all likes setter for a jobOffer */
  Future<List<Like>> getJobLikes(String jobId) async {
    final response = await http.get(Uri.parse('$apiUrl/comment/getJobLikes/${jobId}'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Like.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load likes');
    }
  }
}
