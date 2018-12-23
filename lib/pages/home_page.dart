import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/pages/captures_page.dart';
import 'package:seelang/pages/camera_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    new CapturesPage(),
    new CameraPage(),
    new CapturesPage(),
  ];

  int _currentPageIndex = 0;

  void goToPage(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: 
      BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: goToPage,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.image),
            title: new Text('Captures'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.camera_alt),
            title: new Text('Camera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
          )
        ],
      ),
    );
  }
}