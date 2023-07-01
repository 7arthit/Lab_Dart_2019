import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work4/service/covidservice.dart';
import 'package:work4/widget/data_card.dart';
import 'package:work4/widget/text_card.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {

  void initState(){
  Provider.of<Covidservice>(context, listen: false).getCovidData();
  setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var home = Provider.of<Covidservice>(context).home;
    var death = home?.deaths;
    var recover = home?.recovered;
    var confirm = home?.confirmed;
    var update = home?.updateDate;

    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 9,
            ),
            Text(
                'Covid Case In Thailand : On The $update'
            ),
            Text(
                'Recover $recover : Confirm $confirm : Death : $death'
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(2),
                        topRight: Radius.circular(2))),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                      children: <Widget>[
                        Divider(),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: ListTile(
                                  title: Text("Last Updated : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text('$update',
                                      style: TextStyle()),
                         ))
                        ],
                      ),
                      Datacard(
                        children: <Widget>[
                          textcard(
                            label: 'Recovery Rate',
                            numbers: home != null
                            ? "${((recover / (recover + death)) * 100).toStringAsFixed(2)} %"
                            : 'No Data',
                            color: Colors.green,
                          ),
                          textcard(
                            label: 'Death Rate',
                            numbers: home != null
                            ? "${((death / (recover + death)) * 100).toStringAsFixed(2)} %"
                            : 'No Data',
                            color: Colors.red,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
