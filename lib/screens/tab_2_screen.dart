import 'package:flutter/material.dart';

class Tab2Screen extends StatefulWidget{
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tab2Screen'),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}