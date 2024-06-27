import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:troismconsulting/models/Pack.dart';

import '../config/api_config.dart';


class Packservices{

  /*  */
  Future<bool> renewableStatus(String renewableStatus) async {
    final response = await http.post(Uri.parse('$apiUrl/pack/${renewableStatus}'));

    if (response.statusCode == 200) {
      // done
      return true;
    } else {
      // Erreur
      return false;
    }
  }

  /* get all packs */
  Future<List<Pack>> getPacks() async {
    final response = await http.get(Uri.parse('$apiUrl/packs'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Pack.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load packs');
    }
  }

  /* get pack by name */
  Future<List<Pack>> packByName(String name) async {
    final url = Uri.parse('$apiUrl/packByName/$name');

    var queryParams = {
      'name': '$name',
    };

    var request = http.Request('GET',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('GET',url1);

    var response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      final List<dynamic> data = json.decode(jsonResponse);
      return data.map((json) => Pack.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pack');
    }
  }

  /* get pack by id */
  Future<List<Pack>> packById(String packID) async {
    final url = Uri.parse('$apiUrl/packById/$packID');

    var queryParams = {
      'name': '$packID',
    };

    var request = http.Request('GET',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('GET',url1);

    var response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      final List<dynamic> data = json.decode(jsonResponse);
      return data.map((json) => Pack.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pack');
    }
  }

}