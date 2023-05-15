import 'package:flutter/material.dart';

import '../models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '786445baf9de45faa64024f111a64e99';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }


  getTopHeadlines() async {
    final url =
      Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=mx');

    final res = await http.get(url);

    final NewsResponse newsResponse = NewsResponse.fromJson(res.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}