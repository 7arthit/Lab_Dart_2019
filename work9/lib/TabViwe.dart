import 'package:flutter/material.dart';
import 'package:work9/CocoPage.dart';
import 'Map.dart';

class tabviwe extends StatefulWidget {
  const tabviwe({Key? key}) : super(key: key);

  @override
  State<tabviwe> createState() => _tabviweState();
}

class _tabviweState extends State<tabviwe> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).padding.top;
    kToolbarHeight;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.green,
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
          ),
          title: const Text('Cocoworks', style: TextStyle(color: Colors.white)),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "สวนของฉัน",
              ),
              Tab(text: "แผนที่สวนมะพร้าว")
            ],
          ),
        ),
        body: TabBarView(children: [CocoPage(), mappage()]),
      ),
    );
  }
}

