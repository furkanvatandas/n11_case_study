import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCallHandler {
  ApiCallHandler._();

  static final ApiCallHandler _instance = ApiCallHandler._();

  factory ApiCallHandler() => _instance;

  Future<Map<String, dynamic>> get(String url) async {
    http.Response response = await http.get("$url");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else
      throw Exception("Hata: ${response.statusCode}");
  }
}
