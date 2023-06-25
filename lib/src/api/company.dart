import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:medpocket/src/app_state/AppState.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_state/URL.dart';

final http.Client client = http.Client();
String baseUrl = URL().baseUrl;

Future<dynamic> companySearch(String query) async {
  final prefs = await SharedPreferences.getInstance();
  Uri url = Uri.parse('$baseUrl/api/v1/company/search');
  final response = await client.post(url, body: {"query": query},headers: {
    "Authorization":"Bearer ${prefs.get("token")}"
  });
  if (kDebugMode) {
    print("response ${response.body}");
  }
  final body = json.decode(response.body);
  return body;
}
Future<dynamic> companyToStockiest(String query,bool isList) async {
  final prefs = await SharedPreferences.getInstance();
  Uri url = Uri.parse('$baseUrl/api/v1/company/to-stockiest${isList?"/search":""}/$query');
  final response = await client.get(url,headers: {
    "Authorization":"Bearer ${prefs.get("token")}"
  });
  if (kDebugMode) {
    print("response ${response.body}");
  }
  final body = json.decode(response.body);
  return body;
}

Future<dynamic> stockiestToCompany(String query,bool isList) async {
  final prefs = await SharedPreferences.getInstance();
  Uri url = Uri.parse('$baseUrl/api/v1/company/from-stockiest${isList?"/search":""}/$query');
  final response = await client.get(url,headers: {
    "Authorization":"Bearer ${prefs.get("token")}"
  });
  if (kDebugMode) {
    print("response ${response.body}");
  }
  final body = json.decode(response.body);
  return body;
}