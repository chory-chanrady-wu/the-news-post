import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NewsService {
  // Prefer passing the key via: flutter run --dart-define=GNEWS_API_KEY=YOUR_KEY
  static const String _apiKey = String.fromEnvironment(
    'GNEWS_API_KEY',
    defaultValue: '402e66f2b4cf4d5c7e7c5f73af163f8b',
  );

  static const String _baseUrl = 'https://gnews.io/api/v4';

  Future<List<Article>> fetchNews(String category) async {
    final url = '$_baseUrl/top-headlines?category=$category&lang=en&country=us&apikey=$_apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<Article>> searchNews(String query, {String? category}) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return fetchNews(category ?? 'general');

    final encodedQuery = Uri.encodeQueryComponent(trimmed);
    final topicParam = (category != null && category.isNotEmpty)
        ? '&category=$category'
        : '';

    final url = '$_baseUrl/search?q=$encodedQuery&lang=en&country=us$topicParam&apikey=$_apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to search news');
    }
  }
}
