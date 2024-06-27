import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/job/JobOffer.dart';
import '../config/api_config.dart';


class SubscribersJobOfferAPIServices {

  /* modify a jobOffer */
  static Future<bool> modifyJobOffer(String token, String jobId, String userId, String title, String description, String location, int realisationTime, String picture) async {
    final url = Uri.parse('$apiUrl/subscribers/${userId}/job-offers/${jobId}');

    var queryParams = {
      'subscriberId': '$userId',
      'jobOfferId': '$jobId',
      'title': '$title',
      'description': '$description',
      'location': '$location',
      'realisationTime': '$realisationTime',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var body = {
      'picture':'$picture',
    };
    var jsonBody = jsonEncode(body);



    var request = http.Request('PUT',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('PUT',url1);

    request.headers.addAll(headers);

    request.body = jsonBody;

    var response = await request.send();


    if (response.statusCode == 200) {
      // application added
      return true;
    } else {
      // Erreur when sending application
      return false;
    }
  }

  /* update a payment request */
  static Future<bool> updatePaymentRequest(String token, String jobId, String userId, String paymentRequestID, String newPaymentOperationID, String newReceiver) async {
    final url = Uri.parse('$apiUrl/subscribers/${userId}/job-offers/${jobId}/payment-requests/${paymentRequestID}');

    var queryParams = {
      'subscriberId': '$userId',
      'jobOfferId': '$jobId',
      'paymentRequestId': '$paymentRequestID',
      'newpaymentOperatorId': '$newPaymentOperationID',
      'newReceiver': '$newReceiver',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };


    var request = http.Request('PUT',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('PUT',url1);

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

  /* change the statut of a jobOffer */
  static Future<bool> changeStatutOfJobOffer(String token, String jobId, String userId, String status) async {
    final url = Uri.parse('$apiUrl/subscribers/${userId}/job-offers/${jobId}/change-status');

    var queryParams = {
      'subscriberId': '$userId',
      'jobOfferId': '$jobId',
      'status': '$status',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };


    var request = http.Request('PUT',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('PUT',url1);

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

  /* send a payment request for a realisation */
  static Future<bool> paymentRequestForRealise(String token, String jobId, String userId, String paymentOperationID, String receiver) async {
    final url = Uri.parse('$apiUrl/subscribers/${userId}/job-offers/${jobId}/payment-requests');

    var queryParams = {
      'subscriberId': '$userId',
      'jobOfferId': '$jobId',
      'paymentOperatorId': '$paymentOperationID',
      'receiver': '$receiver',
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

  /* submit a delivrable for a jobOffer */
  static Future<bool> submitDelivrable(String token, String jobId, String name, String userId, String deliverable) async {
    final url = Uri.parse('$apiUrl/subscribers/${userId}/job-offers/${jobId}/deliverables/');

    var queryParams = {
      'subscriberId': '$userId',
      'jobOfferId': '$jobId',
      'name': '$name',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var body = {
      'deliverable':'$deliverable',
    };
    var jsonBody = jsonEncode(body);

    var request = http.Request('POST',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('POST',url1);

    request.headers.addAll(headers);

    request.body = jsonBody;

    var response = await request.send();


    if (response.statusCode == 200) {
      // application added
      return true;
    } else {
      // Erreur when sending application
      return false;
    }
  }

  /* publish a jobOffer */
  static Future<bool> publishJobOffer(String token, String userId, String title, String description, String categoryID, String location, int budget, int realisationTime, String picture) async {
    final url = Uri.parse('$apiUrl/subscribers/${userId}/job-offers/');

    var queryParams = {
      'subscriberId': '$userId',
      'title': '$title',
      'description': '$description',
      'categoryId': '$categoryID',
      'location': '$location',
      'budget ': '$budget',
      'realisationTime': '$realisationTime',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var body = {
      'picture':'$picture',
    };
    var jsonBody = jsonEncode(body);



    var request = http.Request('POST',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('POST',url1);

    request.headers.addAll(headers);

    request.body = jsonBody;

    var response = await request.send();


    if (response.statusCode == 200) {
      // application added
      return true;
    } else {
      // Erreur when sending application
      return false;
    }
  }

  /* get the jobOffer published by a specific user */
  Future<List<JobOffer>> getJobOfferPublishedBySubscriber(String token, String userId,) async {
    final url = Uri.parse('$apiUrl/subscribers/${userId}/job-offers/');

    var queryParams = {
      'subscriberId': '$userId',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var request = http.Request('GET',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('GET',url1);

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      final List<dynamic> data = json.decode(body);
      return data.map((json) => JobOffer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load JobOffer');
    }
  }

  /* get a delivrable */
  Future<Object> getDeliverable(String token, String jobId, String userId, String fileID) async {
    final url = Uri.parse("$apiUrl/subscribers/${userId}/job-offers/${jobId}/deliverable/${fileID}");

    var queryParams = {
      'subscriberId': '$userId',
      'jobOfferId': '$jobId',
      'fileId': '$fileID',
    };
    var headers = {
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var request = http.Request('GET',url);

    var url1 = request.url.replace(queryParameters: queryParams);

    request = http.Request('GET',url1);

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      var data = json.decode(body);
      return data;
    } else {
      throw Exception('Failed to load JobOffer');
    }
  }

}
