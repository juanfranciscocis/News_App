import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/category_model.dart';

import '../models/news_response_model.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier{

  //PROPERTIES
  List<Article> headlines = [];
  List<Article> byCategory = [];
  final String _URL_NEWS = 'https://newsapi.org/v2';
  final String _APIKEY = '3d6a6a6e2d614abeba7bc3dd4a6a07b8';
  bool isLoading = false;
  
  List<CategoryModel> categories = [
    CategoryModel(FontAwesomeIcons.dollarSign, 'business'),
    CategoryModel(FontAwesomeIcons.tv, 'entretainment'),
    CategoryModel(FontAwesomeIcons.addressCard, 'general'),
    CategoryModel(FontAwesomeIcons.headSideVirus, 'health'),
    CategoryModel(FontAwesomeIcons.vials, 'science'),
    CategoryModel(FontAwesomeIcons.volleyball, 'sports'),
    CategoryModel(FontAwesomeIcons.memory, 'technology'),
  ];

  String? categoryElection;

  //CONSTRUCTOR
  NewsService({this.categoryElection}){
    this.getTopHeadlines();
  }



  //METHODS



  getTopHeadlines() async{
    isLoading = true;
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&pageSize=99&apiKey=$_APIKEY');
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    this.headlines.addAll(newsResponse.articles!);
    isLoading = false;
    notifyListeners();

  }

  getNewsByCategory(String category) async{
    isLoading = true;
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&category=$category&pageSize=99&apiKey=$_APIKEY');
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    this.byCategory.addAll(newsResponse.articles!);
    print(byCategory.length);
    isLoading = false;
    notifyListeners();
  }






}