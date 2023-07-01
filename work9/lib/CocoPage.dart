import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Page/cocoadd.dart';
import 'Page/cocoedit.dart';

class CocoPage extends StatefulWidget {
  @override
  State<CocoPage> createState() => _CocoPageState();
}

class _CocoPageState extends State<CocoPage> {
  late String _selectedItem;
  var categoryItemList = [];

  void initState() {
    getAllcategory();
    super.initState();
  }

  static const menuItems = <String>["Edit", "Delete"];

  final List<PopupMenuItem<String>> _popupMenuItems = menuItems.map(
          (String val) => PopupMenuItem<String>(value: val, child: Text(val))
  ).toList();

  Future<List> getAllcategory() async {
    Uri url = Uri.parse('http://cocoworks.cocopatch.com/cocotree.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        categoryItemList = jsonData;
      });
      return categoryItemList;
    } else {
      throw Exception('We are NOT! able to download the json data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text(
      //    'My Home',
      //    style: TextStyle(
      //        color: Colors.white
      //    ),
      //  ),
      //  centerTitle: true,
      //  elevation: 0,
      //  backgroundColor: Colors.green,
      //  titleSpacing: 0,
      //  flexibleSpace: Container(
      //    decoration: const BoxDecoration(),
      //  ),
      //),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              SizedBox(
                width: 360,
                height: 450,
                child: Container(
                  decoration:
                  BoxDecoration(
                      border: Border.all(color: Colors.green)
                  ),
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  child: FutureBuilder(
                      future: getAllcategory(),
                      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                        if (ConnectionState.active != null && !snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            itemCount: categoryItemList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                subtitle:
                                Text(categoryItemList[index]['coco_start']),
                                title:
                                Text(categoryItemList[index]['cocovari_name']),
                                trailing: PopupMenuButton(
                                  itemBuilder: (context) => _popupMenuItems,
                                  onSelected: (String val) {
                                    _selectedItem = val;
                                    if (_selectedItem == "Edit") {
                                      String coco_id = categoryItemList[index]['coco_id'];
                                      String cocovari_id = categoryItemList[index]['cocovari_id'];
                                      String coco_start = categoryItemList[index]['coco_start'];
                                      String coco_lat = categoryItemList[index]['coco_lat'];
                                      String coco_long = categoryItemList[index]['coco_long'];
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CocoeditPage(
                                            coco_id: coco_id,
                                            cocovari_id: cocovari_id,
                                            coco_start: coco_start,
                                            coco_lat: coco_lat,
                                            coco_long: coco_long,
                                          ),
                                        ),
                                      );
                                      //print(cocovari_id);
                                      //print(coco_lat + " " + coco_long);
                                    } else {
                                      setState(() {
                                        Uri url = Uri.parse('http://cocoworks.cocopatch.com/cocodelete.php');
                                        http.post(
                                            url, body: {'coco_id': categoryItemList[index]['coco_id'],
                                        });
                                      });
                                      print("You Deleted!");
                                    }
                                  },
                                ),
                                isThreeLine: true,
                                onTap: () { },
                              );
                            }
                        );
                      }
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 50,
                width: 300.0,
                child: ElevatedButton.icon(
                  label: const Text('Add Coconut tree'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CocoaddPage()
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 24.0,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
