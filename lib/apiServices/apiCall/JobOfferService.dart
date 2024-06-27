import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/job/JobOffer.dart';
import '../config/api_config.dart';


class JobOfferServices {

  /* apply to a jobOffer */
  static Future<bool> applyToJobOffer(String token, String jobId, int amount, String userId) async {
    final url = Uri.parse('$apiUrl/job-offers/${jobId}/apply');

    var queryParams = {
      'jobOfferId': '$jobId',
      'subscriberId': '$userId',
      'amount': '$amount',
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
      // application added
      return true;
    } else {
      // Erreur when sending application
      return false;
    }
  }

  /* get all jobOffer */
  Future<List<JobOffer>> getJobOffers(String IdCategorie , int page, int taille, String dateposted) async {
    final response = await http.get(Uri.parse("$apiUrl/job-offers"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load JobOffer');
    }
  }

  /* get the details of a jobOffer */
  Future<JobOffer> getDetailJobOffer(String jobId) async {
    final response = await http.get(Uri.parse("$apiUrl/job-offers/${jobId}"));

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load JobOffer');
    }
  }

  /* get the image of a jobOffer */
  Future<JobOffer> getImageJobOffer(String pictureId) async {
    final response = await http.get(Uri.parse("$apiUrl/job-offers/pictures/${pictureId}"));

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load JobOffer');
    }
  }

}
