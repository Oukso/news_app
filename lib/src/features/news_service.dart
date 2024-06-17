import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_key.dart';

class NewsService {
  Future<List<dynamic>> fetchNews(String query) async {
    final url = 'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
