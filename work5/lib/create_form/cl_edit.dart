import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work5/database/db_service.dart';
import '../model/profile_model.dart';

class cl_edit extends StatefulWidget {
  List<ProfileModel> profileList = <ProfileModel>[];
  int id = 0;

  cl_edit.setText(List<ProfileModel> proList, int id){
    this.profileList = proList;
    this.id = id;
  }

  @override
  State<cl_edit> createState() => _cl_editState(id);
}

class _cl_editState extends State<cl_edit> {
  List<ProfileModel> profileList = <ProfileModel>[];
  //List<ProfileModel> proList = new List.filled(0, ProfileModel(), growable: true);
  late int id;

  //_cl_editState(List<ProfileModel> profileList, int idx) {
    //proList = profileList;
    //id = idx;
    //firstname.text = profileList[id].firstname;
    //lastname.text = profileList[id].lastname;
    //email.text = profileList[id].email;
    //phone.text = profileList[id].phone;
    //image.text = profileList[id].image;
  //}

  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var image = TextEditingController();
  var img;
  DBService service = new DBService();
  late ProfileModel pro;

  final ImagePicker picker = ImagePicker();


  _cl_editState(int id) {
    this.id = id;
    getDataProfile(id);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Form'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                PictureIcon(),
                textHeader('General info'),
                textFromF('First Name','Input First Name of insect',firstname),
                textFromF('Last Name','Input Last Name of insect',lastname),
                textFromF('Email','Input Email of insect',email),
                textFromF('Phone','Input Phone of insect',phone),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          'Add Data',
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        onPressed: () {
                          DBService service = new DBService();
                          ProfileModel profile = new ProfileModel();//
                          profile.firstname = firstname.text;
                          profile. lastname = lastname.text;
                          profile.email = email.text;
                          profile.phone = phone.text;
                          profile.image = image.text;
                          var data = profile.profileMap();

                          service.insertData(data);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding textFromF(String lText,String hText,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lText,
          hintText: hText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }

  Padding textHeader(String hText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        hText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  Container PictureIcon() {
    return Container(
        width: 150,
        height: 50,
        child: Column(
          children: <Widget>[
            (image.text!= '')
                ?
            Image.memory(base64.decode(image.text),fit: BoxFit.fill,)
                : Icon(Icons.insert_photo),
            IconButton(
                icon: const Icon(Icons.camera_alt,),
                onPressed: () async {
                  PickedFile? pickedFile = await ImagePicker().getImage(
                    source: ImageSource.gallery,
                    maxWidth:1800, maxHeight: 1800,
                  );
                  String bit = base64.encode(await pickedFile!.readAsBytes());
                  image.text = bit;
                  if(pickedFile != null){
                    setState(() {
                      image.text = bit;
                    });
                  }
                }
            )
          ],
        )
    );
  }
  void getDataProfile(int id) async {
    var profile = await service.readDataById(id);
    profile.foreach((pro) {
      setState(() {
        firstname.text = pro[' firstname'];
        lastname.text = pro[ ' Lastname'];
        email.text = pro['email'];
        phone.text = pro['phone'];
        image.text = pro[' image'];
      });
    });
  }
}