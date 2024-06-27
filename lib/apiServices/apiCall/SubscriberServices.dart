import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../models/User.dart';
import '../config/api_config.dart';


class Subscriberservices{

  /* add a new user */
  Future<String> registerUser(User user, { File? picture}) async {
    final url = Uri.parse('$apiUrl/subscriber-accounts/signup');

    var request = http.MultipartRequest('POST', url);
    request.fields['firstName'] = user.firstName;
    request.fields['lastName'] = user.lastName;
    request.fields['email'] = user.email;
    request.fields['password'] = user.password;
    request.fields['phone'] = "${user.phonePrefix} ${user.phone}";
    request.fields['username'] = user.username;


    // Ajouter l'image en tant que fichier multipart
    if (picture != null) {
      request.files.add(
        http.MultipartFile(
          'picture',
          picture.readAsBytes().asStream(),
          picture.lengthSync(),
          filename: picture.path.split('/').last, // Utilisez le nom de fichier de l'image
          contentType: MediaType('image', '*'), // Utilisez le bon type MIME de votre image
        ),
      );
    }

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

  /* update user informations */
  Future<String> updateUser(String userID, User user, { File? picture}) async {
    final url = Uri.parse('$apiUrl/Users/updateUser/${userID}');

    var request = http.MultipartRequest('PUT', url);
    request.fields['firstName'] = user.firstName;
    request.fields['lastName'] = user.lastName;
    request.fields['email'] = user.email;
    request.fields['password'] = user.password;
    request.fields['phone'] = "${user.phonePrefix} ${user.phone}";
    request.fields['username'] = user.username;


    // Ajouter l'image en tant que fichier multipart
    if (picture != null) {
      request.files.add(
        http.MultipartFile(
          'picture',
          picture.readAsBytes().asStream(),
          picture.lengthSync(),
          filename: picture.path.split('/').last, // Utilisez le nom de fichier de l'image
          contentType: MediaType('image', '*'), // Utilisez le bon type MIME de votre image
        ),
      );
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print('mise à jour réussie');
      var jsonResponse = await response.stream.bytesToString();
      var decodedResponse = json.decode(jsonResponse);
      var userId = decodedResponse['id'];
      return userId;

    } else {
      print('Erreur lors de la mise à jour: ${response.statusCode}');
      print('Response body: ${await response.stream.bytesToString()}');
      throw Exception('Erreur lors de la mise à jour');
    }
  }


}

