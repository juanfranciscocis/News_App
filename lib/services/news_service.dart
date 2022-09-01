import 'package:flutter/material.dart';

import '../models/news_response_model.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier{

  List<Article> headlines = [];
  final _URL_NEWS = 'https://newsapi.org/v2';
  final _APIKEY = '3d6a6a6e2d614abeba7bc3dd4a6a07b8';


  NewsService(){
    this.getTopHeadlines();
  }

  getTopHeadlines() async{
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    this.headlines.addAll(newsResponse.articles!);
    notifyListeners();
  }






}