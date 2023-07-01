import 'package:flutter/material.dart';
import 'package:work5/create_form/cl_create.dart';
import 'package:work5/create_form/cl_edit.dart';
import 'package:work5/database/db_service.dart';
import '../model/profile_model.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2>{

  List<ProfileModel> proList = new List.filled(0, ProfileModel(),growable: true);

  getAllData() async {
    proList = <ProfileModel>[];
    var service = DBService();
    var profiles = await service.readData();
    profiles.forEach((pro){
      print(pro);
      setState(() {
        var proModel = ProfileModel();
        proModel. id = pro['id']!;
        proModel. firstname = pro[' firstname']!;
        proModel. lastname = pro[' Lastname']!;
        proModel.email = pro['email']!;
        proModel.phone = pro['phone ']!;
        proModel. image = pro[' image']!;
        proList.add(proModel);
      });
    });
  }
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            Navigator.push(
              context,
                new MaterialPageRoute(builder: (context) => new cl_create()),
            ).then((value) {
              getAllData();
              setState(() {});
            });
          },
              icon: Icon(Icons.add_circle_outline)
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: proList.length,
          itemBuilder: (BuildContext buildContext, int index){
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(proList[index].firstname),
              subtitle: Text(proList[index].lastname),
              trailing: Wrap(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>
                          new cl_edit.setText(proList,index),
                        ),
                      ).then((value){
                        if(value == null){

                        }else{
                          proList = value;
                        }
                        setState(() {});
                      });
                    },
                  ),
                  IconButton(
                    onPressed:()async{
                      var service = DBService();
                      var result = await service.deleteData(proList[index].id);
                      getAllData();
                      setState(() {});
                  }, icon: Icon(Icons.delete))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
