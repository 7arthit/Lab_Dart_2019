import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class autoComplete extends StatefulWidget {
  const autoComplete({Key? key}) : super(key: key);

  @override
  State<autoComplete> createState() => _autoCompleteState();
}

class _autoCompleteState extends State<autoComplete> {
  List<String> places = [];
  String name = "Please Selected.";

  void initState() {
    findplace();
  }

  void findplace()async {
    Uri url = Uri.parse('https://raw.githubusercontent.com/kongvut/thai-province-data/master/api_province.json');
    var response = await http.get(url);
    var data = json.decode(response.body);
    try {
      for (int i=0 ; i<data.toString().length;i++)
      {
        setState(() {
          places.add(data[i]['name_th'].toString());
        });
      }
    }
    catch (error){
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoComplete'),
      ),
      body: ListView(
        children: [
          new Container(
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.blueAccent
              )
            ),
            child:
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue){
                if (textEditingValue.text == ''){
                  return const Iterable<String>.empty();
                }
                return places.where((String option){
                  return option.contains(textEditingValue.text);
                });
              },
                onSelected: (String selection) {
                  debugPrint('You just selected $selection');
                  setState(() {
                    name = selection;
                  });
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted
                ) {
                  return TextField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                   ),
                    style:const TextStyle(color: Colors.blueGrey,fontSize: 18),
                  );
              }
            ),
          )
        ],
      ),
    );
  }
}


