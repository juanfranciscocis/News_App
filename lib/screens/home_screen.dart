import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _BottomNavigation(),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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
    return PageView(
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