import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work5/status.dart';
import '../main.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_outlined),
            color: Colors.black,
            onPressed: () async {
              SharedPreferences prefernces = await SharedPreferences.getInstance();
              prefernces.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => MyApp()),
                      (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(children: <Widget>[
            Card(
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.analytics,
                      size: 50.0,
                      color: Colors.black,
                    ),
                    textColor: Colors.black,
                    title: Text("สถานะ"),
                    subtitle: Text("ดูสถานะการเข้าใช้งาน"),
                  ),
                  Row(
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black87,
                        ),
                        child: Text('Enter'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => status()));
                        },
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.account_tree_outlined,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    title: Text("อุปกรณ์อื่นๆ"),
                  ),
                  Row(
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text('Enter'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => status()));
                        },
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


