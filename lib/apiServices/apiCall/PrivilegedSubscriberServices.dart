import 'package:troismconsulting/models/Category.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:troismconsulting/models/job/JobOffer.dart';

import '../../models/Pack.dart';
import '../config/api_config.dart';

class Privilegedsubscriberservices{

  /* update a pack */
  Future<bool> updatePack(String packID, Pack pack) async {
    final url = Uri.parse('$apiUrl/Admin/pack/updatePack/${packID}');

    var body = {
      'id':'$packID',
      'name':'${pack.name}',
      'priceOfSubscripion':'${pack.priceOfSubscripion}',
      'maximumBudgetForJobPosting':'${pack.maximumBudgetForJobPosting}',
      'description':'${pack.description}',
      'numberOfDayDuration':'${pack.numberOfDayDuration}',
    };
    var jsonBody = jsonEncode(body);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };


    var request = http.Request('PUT',url);

    request.headers.addAll(headers);

    request.body = jsonBody;

    var response = await request.send();

    if (response.statusCode == 200) {
      // pack updated
      return true;
    } else {
      // Erreur when updating the pack
      return false;
    }
  }

  /* update a category */
  Future<bool> updateCategory(String categoryID, Category category) async {
    final url = Uri.parse('$apiUrl/Admin/category/updateCategory/${categoryID}');

    var body = {
      'id':'$categoryID',
      'name':'${category.name}',
      'description':'${category.description}',
    };
    var jsonBody = jsonEncode(body);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };


    var request = http.Request('PUT',url);

    request.headers.addAll(headers);

    request.body = jsonBody;

    var response = await request.send();

    if (response.statusCode == 200) {
      // category updated
      return true;
    } else {
      // Erreur when updating the category
      return false;
    }
  }

  /* create a new pack */
  Future<bool> createPack(Pack pack) async {
    final url = Uri.parse('$apiUrl/Admin/pack/createPack');
    var body = {
      'name':'${pack.name}',
      'priceOfSubscripion':'${pack.priceOfSubscripion}',
      'maximumBudgetForJobPosting':'${pack.maximumBudgetForJobPosting}',
      'description':'${pack.description}',
      'numberOfDayDuration':'${pack.numberOfDayDuration}',
    };
    var jsonBody = jsonEncode(body);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };


    var request = http.Request('POST',url);

    request.headers.addAll(headers);

    request.body = jsonBody;

    var response = await request.send();

    if (response.statusCode == 200) {
      // pack created
      return true;
    } else {
      // Erreur when creating the pack
      return false;
    }
  }

  /* block a jobOffer */
  Future<bool> blockJob(String jobID) async {
    final response = await http.post(Uri.parse('$apiUrl/Admin/jobOffer/blockJob/${jobID}'));

    if (response.statusCode == 200) {
      // jobOffer blocked
      return true;
    } else {
      // Erreur when blocking the jobOffer
      return false;
    }
  }

  /* unblock a jobOffer */
  Future<bool> unblockJob(String jobID) async {
    final response = await http.post(Uri.parse('$apiUrl/Admin/jobOffer/unblockJob/${jobID}'));

    if (response.statusCode == 200) {
      // jobOffer unblocked
      return true;
    } else {
      // Erreur when unblocking the jobOffer
      return false;
    }
  }

  /* block or unblock a subscriber account */
  Future<bool> changeAccountStatut(String accountID, bool blocked) async {
    final url = Uri.parse('$apiUrl/Admin/change-account-status');

    var queryParams = {
      'blocked': '$blocked',
      'accountId': '$accountID',
    };

    var request = http.Request('POST',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('POST',url1);

    var response = await request.send();

    if (response.statusCode == 200) {
      // account statut succesfully change
      return true;
    } else {
      // error while changing the account statut
      return false;
    }
  }

  /* create a category */
  Future<bool> createCategory(Category category) async {
    final url = Uri.parse('$apiUrl/Admin/category/createCategory');

    var body = {
      'name':'${category.name}',
      'description':'${category.description}',
    };
    var jsonBody = jsonEncode(body);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };


    var request = http.Request('POST',url);

    request.headers.addAll(headers);

    request.body = jsonBody;

    var response = await request.send();

    if (response.statusCode == 200) {
      // category created
      return true;
    } else {
      // Erreur when creating the category
      return false;
    }
  }

  /* find all JobOffer */
  Future<List<JobOffer>> findAllJobsOffer() async {
    final response = await http.get(Uri.parse('$apiUrl/Admin/jobOffer/findAllJobsOffer'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  /* find all blocked jobOffer */
  Future<List<JobOffer>> findAllBlockedJobOffer() async {
    final response = await http.get(Uri.parse('$apiUrl/Admin/jobOffer/findAllBlockedJobsOffer'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  /* delete pack */
  Future<Object> deletePack(String packID) async {
    final response = await http.delete(Uri.parse('$apiUrl/Admin/pack/deletePack/$packID'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to delete pack');
    }
  }

  /* delete category */
  Future<Object> deleteCategory(String categoryID) async {
    final response = await http.delete(Uri.parse('$apiUrl/Admin/category/delete/$categoryID'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to delete category');
    }
  }

}