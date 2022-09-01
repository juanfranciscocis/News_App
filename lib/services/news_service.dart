import 'package:flutter/material.dart';

import '../models/news_response_model.dart';

class NewsService extends ChangeNotifier{

  List<Article> headlines = [];


  NewsService(){
    this.getTopHeadlines();
  }

  getTopHeadlines() async{
    print('loafing headlines......');
  }






}