import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:medpocket/src/app_state/AppState.dart';
import 'package:medpocket/src/app_state/URL.dart';

final http.Client client = http.Client();
String baseUrl = URL().baseUrl;

Future<dynamic> auth(String mobileNumber) async {
  Uri url = Uri.parse('$baseUrl/api/v1/users/login');
  final response = await client.post(url, body: {"phone": mobileNumber});
  if (kDebugMode) {
    print("response ${response.body}");
  }
  final body = json.decode(response.body);
  return body;
}

Future<dynamic> verify(String mobileNumber, String otp) async {
  if (kDebugMode) {
    print("response mobile $mobileNumber $otp");
  }
  Uri url = Uri.parse('$baseUrl/api/v1/users/verify');
  final response = await client.post(url, body: {
    "phone": mobileNumber,
    "otp": otp,
  });
  if (kDebugMode) {
    print("response ${response.body} $otp");
  }
  final body = json.decode(response.body);
  return body;
}
