import 'package:flutter/material.dart';
import 'package:work9/CocoPage.dart';

import 'TabViwe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แอปพลิเคชั่น Cocomap',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: tabviwe(),
    );
  }
}

