import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';

class HomeScreen extends StatelessWidget{


  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationProvider(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<_NavigationProvider>(context);

    return BottomNavigationBar(
      selectedItemColor: Colors.grey[300],
      unselectedItemColor: Colors.grey,
      currentIndex: navigationProvider._currentPage,
      onTap: (index){
        //print(index);
        navigationProvider.currentPage = index;

      },
      items: [

        BottomNavigationBarItem(
          icon: Icon(Icons.public, color: Colors.red,),
          label: 'Headlines',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, color: Colors.red,),
          label: 'For You',
        ),

      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<_NavigationProvider>(context);
    return PageView(
      controller: navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Screen(),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}


class _NavigationProvider with ChangeNotifier{
  int _currentPage = 0;
  PageController _pageController = PageController();




  //GETTER AND SETTER
  PageController get pageController => this._pageController;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    pageController.animateToPage(value, duration:Duration( milliseconds:250), curve: Curves.easeInOut);
    notifyListeners();
  }
}