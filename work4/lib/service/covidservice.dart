import 'dart:convert';
import 'package:work4/model/covidfromjson.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Covidservice with ChangeNotifier {
  String api="https://static.easysunday.com/covid-19/getTodayCases.json";

  var home;

 Future<Covid?> getCovidData() async {
   final response = await http.get(Uri.parse(api));
   if (response.statusCode == 200){
     notifyListeners();
     var res = Covid.fromJson(jsonDecode(response.body));
     home = res;
     return res;
   } else {
     return null;
   }
 }

}