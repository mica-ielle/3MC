import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/PaymentOperator.dart';
import '../config/api_config.dart';

/* update a payment operator */
Future<bool> updatePaymentOperator(String paymentOpID, PaymentOperator paymentOp) async {
  final url = Uri.parse('$apiUrl/payment-operators/$paymentOpID');

  var queryParams = {
    'id': '$paymentOpID',
    'name': '${paymentOp.name}',
    'description': '${paymentOp.description}',
    'retrievalFieldName': '${paymentOp.retrievalFieldName}]',
    'retrievalFielRegex': '${paymentOp.retrievalFieldRegex}',
  };
  var headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  var request = http.Request('PUT',url);

  var url1 = request.url.replace(queryParameters: queryParams);

  request = http.Request('PUT',url1);

  request.headers.addAll(headers);

  var response = await request.send();


  if (response.statusCode == 200) {
    // updated
    return true;
  } else {
    // Erreur
    return false;
  }
}

/* get all payment operators */
Future<PaymentOperator> getAllPaymentOperator() async {
  final response = await http.get(Uri.parse("$apiUrl/payment-operators}"));

  if (response.statusCode == 200) {
    final dynamic data = json.decode(response.body);
    return data.map((json) => PaymentOperator.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load PaymentOperator');
  }
}

/* add a new payment operator for payment request of freelances */
Future<bool> createPaymentOperator(PaymentOperator paymentOp) async {
  final url = Uri.parse('$apiUrl/payment-operators/');

  var queryParams = {
    'name': '${paymentOp.name}',
    'description': '${paymentOp.description}',
    'retrievalFieldName': '${paymentOp.retrievalFieldName}]',
    'retrievalFielRegex': '${paymentOp.retrievalFieldRegex}',
  };
  var headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  var request = http.Request('POST',url);

  var url1 = request.url.replace(queryParameters: queryParams);

  request = http.Request('POST',url1);

  request.headers.addAll(headers);

  var response = await request.send();


  if (response.statusCode == 200) {
    // CREATED
    return true;
  } else {
    // Erreur
    return false;
  }
}

/* get the logo of a payment operator */
Future<String> getLogoPaymentOperator(String logoId) async {
  final url = Uri.parse("$apiUrl/payment-operators/logos/$logoId");

  var queryParams = {
    'logoId': '$logoId',
  };
  var headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  var request = http.Request('GET',url);

  var url1 = request.url.replace(queryParameters: queryParams);

  request = http.Request('GET',url1);

  request.headers.addAll(headers);

  var response = await request.send();

  if (response.statusCode == 200) {

    var jsonResponse = await response.stream.bytesToString();
    var decodedResponse = json.decode(jsonResponse);

    return decodedResponse.toString();

  } else {
    throw Exception('Failed to load paymentOperatorLogo');
  }
}