import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

/// Shared HTTP helper that automatically attaches API key and optional JWT.
class VHHttpClient {
  static Future<Map<String, String>> _headers({bool auth = true}) async {
    if (auth) {
      return ApiConfig.authenticatedHeaders();
    }
    return ApiConfig.jsonHeaders;
  }

  static Future<http.Response> get(String path, {bool auth = true}) async {
    final headers = await _headers(auth: auth);
    return http.get(Uri.parse('${ApiConfig.baseUrl}$path'), headers: headers);
  }

  static Future<http.Response> post(
    String path,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    final headers = await _headers(auth: auth);
    return http.post(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> put(
    String path,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    final headers = await _headers(auth: auth);
    return http.put(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> patch(
    String path,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    final headers = await _headers(auth: auth);
    return http.patch(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> delete(String path, {bool auth = true}) async {
    final headers = await _headers(auth: auth);
    return http.delete(Uri.parse('${ApiConfig.baseUrl}$path'), headers: headers);
  }
}
