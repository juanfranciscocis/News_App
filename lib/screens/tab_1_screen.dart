import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';
import '../widgets/headlines_show_widget.dart';

class Tab1Screen extends StatelessWidget{
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: HeadlinesShowWidget(news: newsService.headlines),
      ),
    );
  }
}