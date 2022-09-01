import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      currentIndex: navigationProvider._currentPage,
      onTap: (index){
        //print(index);
        navigationProvider.currentPage = index;

      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'For You',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Headlines',
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
        Container(
          color: Colors.red,
        ),
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