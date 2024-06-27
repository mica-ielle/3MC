import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/User.dart';
import '../config/api_config.dart';

class Adminservices{

  /* add a new admin */
  Future<String> registerAdmin(User user,) async {
    final url = Uri.parse('$apiUrl/admin-accounts/signup');

    var body = {
      "username": "${user.username}",
      "password": "${user.password}",
      "email": "${user.email}",
      "phone": "${user.phonePrefix} ${user.phone}",
      "firstname": "${user.firstName}",
      "lastname": "${user.lastName}"
    };
    var jsonBody = jsonEncode(body);

    var request = http.Request('POST', url);

    request.body = jsonBody;

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Inscription réussie');
      var jsonResponse = await response.stream.bytesToString();
      var decodedResponse = json.decode(jsonResponse);
      var userId = decodedResponse['id'];
      return userId;

    } else {
      print('Erreur lors de l\'inscription: ${response.statusCode}');
      print('Response body: ${await response.stream.bytesToString()}');
      throw Exception('Erreur lors de l\'inscription');
    }
  }


}


