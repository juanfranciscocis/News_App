import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';
import '../widgets/headlines_show_widget.dart';

class Tab1Screen extends StatefulWidget{
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin{
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}