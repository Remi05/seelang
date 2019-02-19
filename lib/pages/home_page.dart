import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/blocs/captures_bloc.dart';
import 'package:seelang/pages/captures_page.dart';
import 'package:seelang/pages/camera_page.dart';

class HomePage extends StatefulWidget {
  final CapturesBloc _capturesBloc;

  HomePage(this._capturesBloc, {Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState(_capturesBloc);
}

class _HomePageState extends State<HomePage> {
  final CapturesBloc _capturesBloc;
  List<Widget> _pages;
  int _currentPageIndex = 0;

  _HomePageState(this._capturesBloc) {
    _pages = [
      new CapturesPage(_capturesBloc),
      new CameraPage(_capturesBloc),
      new CapturesPage(_capturesBloc),
    ];
  }

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