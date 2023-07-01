import 'package:flutter/material.dart';
import 'package:work4/create_form/cl_create.dart';
import 'package:work4/create_form/cl_edit.dart';
import '../model/profile_model.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  List<ProfileModel> proList = new List.filled(0, ProfileModel.empty(),growable: true);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> cl_create(proList.length),
              ),
            ).then((value) {proList.add(value);
            setState((){});
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
              title: Text(proList[index].firstName_li),
              subtitle: Text(proList[index].branchName_li),
              trailing: Wrap(
                children: <Widget> [
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
                    icon: Icon(Icons.delete),
                    onPressed: (){
                    proList.removeWhere(
                            (element) => element.id == proList[index].id);
                    setState(() {});
                  }, )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
