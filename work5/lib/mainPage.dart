import 'package:flutter/material.dart';
import 'menu/page1.dart';
import 'menu/page2.dart';
import 'menu/page3.dart';
import 'menu/page4.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);
  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int _currentIndex = 0;

  final tabs = [
    MyDashboard(),
    page2(),
    page3(),
    page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Page1',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Page2',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Page3',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'Page4',
              backgroundColor: Colors.greenAccent),
        ],
        onTap: (index){
          setState((){
            _currentIndex=index;
          });
        },
      ),
    );
  }
}


