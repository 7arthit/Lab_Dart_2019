import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Layout'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); //Stateful
}

class _MyHomePageState extends State<MyHomePage> {
 final List<String> _filters = <String>[];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: <Widget>[
            new Icon(
              Icons.account_circle,
              color: const Color(0xFF026C6DA),
              size: 160.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                FlatButton(onPressed: null,child: Text('Row 01',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent[400]),)),
                FlatButton(onPressed: null,child: Text('Row 02',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent[400]),)),
              ],
            ),
            Text('Column',
              style: new TextStyle(fontSize: 36.0,
                color: const Color(0xFFf22fa4),
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto"),),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: new TextField(
                decoration: InputDecoration(
                  hintText: 'Text Fild 01',
                  filled: true,
                  fillColor: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Text Fild 02',
                    filled: true,
                    fillColor: Colors.white),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(onPressed: () {},child: Text('Row 01',
                style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent[700]),)),
                RaisedButton(onPressed: () {},child: Text('Row 02',
                style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent[700]),)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: ["Butterfty", "Dragonfly", "Beatle"].map((filterType){
                return FilterChip(
                  label: Text(filterType),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor:Colors.blueGrey,
                  selectedColor: Colors.purpleAccent,
                  checkmarkColor: Colors.white,
                  selected: _filters.contains(filterType),
                  onSelected: (val){
                    setState((){
                      if (val){
                        _filters.add(filterType);
                      }else{
                        _filters.removeWhere((name) {
                          return name == filterType;
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ),

            ElevatedButton(
              onPressed: (){},
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(180,10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){},
                child: Text(
                  "Sign up with Facebook",
                  style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  minimumSize: Size(150,5),
                  primary: Colors.white,
                ),
              ),
            ),

          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
