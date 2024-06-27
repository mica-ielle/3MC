import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class Authenticationservices{

  /* regenerate token from refresh token */
  static Future<String> generateToken(String refreshToken) async {
    final url = Uri.parse('$apiUrl/auth/regenerate-token');

    var body = {
      'refreshToken': '$refreshToken'
    };

    var jsonBody = jsonEncode(body);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var request = http.Request('POST',url);

    request.body = jsonBody;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      // token generation
      var rep = await response.stream.bytesToString();
      var data = json.decode(rep);
      return data.toString();

    } else {
      // Erreur lors de la génération du token
      throw Exception('Failed to generate token');
    }
  }

}