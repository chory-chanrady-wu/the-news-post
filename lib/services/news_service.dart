import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NewsService {
  static const String _apiKey = '402e66f2b4cf4d5c7e7c5f73af163f8b';
  static const String _baseUrl = 'https://gnews.io/api/v4';

  Future<List<Article>> fetchNews(String category) async {
    final url =
        '$_baseUrl/top-headlines?category=$category&lang=en&country=us&apikey=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];

      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
