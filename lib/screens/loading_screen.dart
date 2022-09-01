import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';

class LoadingScreen extends StatelessWidget{
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: (newsService.isLoading == true)?CircularProgressIndicator(color: Colors.white,):HomeScreen(),
      ),
    );
  }
}