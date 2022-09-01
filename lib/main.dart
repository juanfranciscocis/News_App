import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const AppState());
}

class AppState extends StatelessWidget{
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => NewsService()),
    ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget{
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute:'/loading',
      theme: theme,
      routes: {
        '/home': (_) => const HomeScreen(),
        '/tab1': (_) => const Tab1Screen(),
        '/tab2': (_) => const Tab2Screen(),
        '/news': (_) => const NewsScreen(),
        '/loading': (_) => const LoadingScreen(),
      },
    );
  }




}