import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work4/menu/page1.dart';
import 'package:work4/menu/page2.dart';
import 'package:work4/menu/page3.dart';
import 'package:work4/menu/page4.dart';
import 'package:work4/service/covidservice.dart';

void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create: (_) => Covidservice())
] ,child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpdateDataStudentID',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [
    page1(),
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
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Page2',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Page3',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'Page4',
              backgroundColor: Colors.blue),
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
