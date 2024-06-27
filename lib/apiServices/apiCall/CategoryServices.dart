import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/Category.dart';
import '../config/api_config.dart';


class CategoryService {

  /* get all categories */
  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('$apiUrl/Admin/category/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  /* get a categorie informations using the ID */
  Future<Map<String, dynamic>> getCategoryInfo(String id) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/Admin/category/findCategory/$id'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load category info');
      }
    } catch (e) {
      throw Exception('Error loading category info: $e');
    }
  }

}
