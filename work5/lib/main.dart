import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work5/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  late SharedPreferences Logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    Logindata = await SharedPreferences.getInstance();
    newuser = (Logindata.getBool('Login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => mainPage()));
    }
  }

  @override
  void dispose() {
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                "ALLSMILE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: username_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: password_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'password'),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  String username = username_controller.text;
                  String password = password_controller.text;
                  if (username != '' && password != '') {
                    print('Successfull');
                    Logindata.setBool('login', false);
                    Logindata.setString('username', username);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mainPage()));
                    }
                  },
                child: Text("Login"),
              ),
            ]
          ),
        ),
      );
    }
}
