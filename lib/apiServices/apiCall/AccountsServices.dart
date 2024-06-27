import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:troismconsulting/models/User.dart';

import '../../models/Account.dart';
import '../config/api_config.dart';

class AuthService {

  /* log into a user account */
  static Future<bool> login(String username, String password) async {
    final url = Uri.parse('$apiUrl/accounts/login');

    var base64Credentials = base64Encode(utf8.encode('$username:$password'));

    final response = await http.post(
      url,
      headers: <String, String>{
        'Authorization':'Basic $base64Credentials',
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );

    if (response.statusCode == 200) {
      // Connexion réussie
      return true;
    } else {
      // Erreur lors de la connexion
      return false;
    }
  }

  /* verification of the code sended to the user while registrating */
  Future<bool> verifyVerificationCode(String accountId , String code) async {
    var url = Uri.parse('$apiUrl/accounts/verify');

    var queryParams = {
      'accountId':'$accountId',
      'code':'$code'
    };

    var request = http.Request('POST',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('POST',url1);

    print(request.url.queryParameters);

    var response = await request.send();

    if (response.statusCode == 200) {
      return true; // Code de validation valide
    } else {
      return false; // Code de validation invalide
    }
  }

  /* get a profile picture */
  Future<Object> getProfilePicture(String pictureID) async {
    final response = await http.get(Uri.parse('$apiUrl/accounts/profile-pictures/${pictureID}'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data.toString();
    } else {
      throw Exception('Failed to load picture');
    }
  }

  /* check if an email, username or phone number is already used */
  Future<bool> checkIfExist(String email, String phone, String username) async {
    final url = Uri.parse('$apiUrl/accounts/check');

    var queryParams = {
      'email': '$email',
      'phone': '$phone',
      'username': '$username',
    };

    var request = http.Request('GET',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('GET',url1);

    var response = await request.send();

    if (response.statusCode == 200) {
      // parameter passed is already used in the application
      return true;
    } else {
      // parameter passed is not used in the application
      return false;
    }
  }

  /* get all accounts */
  Future<List<Account>> getAccounts() async {
    final response = await http.get(Uri.parse('$apiUrl/accounts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }
}
