import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; // for kIsWeb check if running on web

class ApiService {
  static String get baseUrl {
    if (kIsWeb) {
      // For Flutter Web or desktop testing
      return 'http://127.0.0.1:8000';
    } else {
      // For Android emulator
      return 'http://10.0.2.2:8000';
    }
  }

  static Future<Map<String, dynamic>> checkStatement(String text) async {
    final url = Uri.parse('$baseUrl/check');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'result': data['result'] as List, // List of [question, answer] tuples
        'verdict': data['verdict'] as bool,
      };
    } else {
      throw Exception('Failed to get response from backend: ${response.statusCode}');
    }
  }
}