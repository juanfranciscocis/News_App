import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/theme/theme.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: '/home',
      theme: theme,
      routes: {
        '/home': (_) => const HomeScreen(),
        '/tab1': (_) => const Tab1Screen(),
        '/tab2': (_) => const Tab2Screen(),
      },
    );
  }




}