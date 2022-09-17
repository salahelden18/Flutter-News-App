import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_2/constants/api_key.dart';

class NewsProvider with ChangeNotifier {
  Future<List<dynamic>> getArticles([String segment = '']) async {
    try {
      final url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY&pageSize=40&category=$segment');

      final response = await http.get(url);

      final decodedData = jsonDecode(response.body);

      notifyListeners();
      print(decodedData['articles'].length);
      return decodedData['articles'];
    } catch (e) {
      rethrow;
    }
  }
}
