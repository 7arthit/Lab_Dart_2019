import 'package:flutter/material.dart';

import '../model/profile_model.dart';

class cl_edit extends StatefulWidget {
  List<ProfileModel> profileList = new List.filled(0, ProfileModel.empty(),growable: true);
  int id = 0;

  cl_edit.setText(List<ProfileModel> proList, int id){
    this.profileList = proList;
    this.id = id;
  }

  @override
  State<cl_edit> createState() => _cl_editState(profileList,id);
}

class _cl_editState extends State<cl_edit> {
  List<ProfileModel> proList = new List.filled(0, ProfileModel.empty(),growable: true);
  int id = 0;

  _cl_editState(List<ProfileModel> profileList,int idx){
    proList = profileList;
    id = idx;
    studentID.text = profileList[id].studentID_li.toString();//
    firstName.text = profileList[id].firstName_li;
    lastName.text = profileList[id].lastName_li;
    nickName.text = profileList[id].nickName_li;
    birthDay.text = profileList[id].birthDay_li.toString();
    monthBirth.text = profileList[id].monthBirth_li;
    birthYear.text = profileList[id].birthYear_li.toString();
    Age.text = profileList[id].Age_li.toString();
    yearClass.text = profileList[id].yearClass_li.toString();
    branchName.text = profileList[id].branchName_li;
    universityName.text = profileList[id].universityName_li;
    numPhone.text = profileList[id].numPhone_li.toString();
  }
  var studentID = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var nickName = TextEditingController();
  var birthDay = TextEditingController();
  var monthBirth = TextEditingController();
  var birthYear = TextEditingController();
  var Age = TextEditingController();
  var yearClass = TextEditingController();
  var branchName = TextEditingController();
  var universityName = TextEditingController();
  var numPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create_form'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                PictureIcon(),
                textHeader('Student Information'),
                textFormF('studentID','Input studentID',studentID),
                textFormF('First name','Input First name',firstName),
                textFormF('Last name','Input Last name',lastName),
                textFormF('Nick name','Input Nick name',nickName),
                textFormF('Day of Birth','Input Day of Birth ( 1 - 31 )',birthDay),
                textFormF('Month of Birth','Input Month of Birth ( Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec )',monthBirth),
                textFormF('Year of Birth','Input Year of Birth ( 1988 - 2022 )',birthYear),
                textFormF('Age','Input Age ( 1 - 100 )',Age),
                textFormF('Year Class','Input Year Class ( 1 - 8 )',yearClass),
                textFormF('Branch name','Input Branch name',branchName),
                textFormF('University name','Input University name',universityName),
                textFormF('Number Phone','Input Number Phone',numPhone),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          'Add Data',
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        onPressed: (){
                          var edit = proList.firstWhere((element) => element.id == id);
                          edit.studentID_li = int.parse(studentID.text);
                          edit.firstName_li = firstName.text;
                          edit.lastName_li = lastName.text;
                          edit.nickName_li = nickName.text;
                          edit.birthDay_li = int.parse(birthDay.text);
                          edit.monthBirth_li = monthBirth.text;
                          edit.birthYear_li = int.parse(birthYear.text);
                          edit.Age_li = int.parse(Age.text);
                          edit.yearClass_li = int.parse(yearClass.text);
                          edit.branchName_li = branchName.text;
                          edit.universityName_li = universityName.text;
                          edit.numPhone_li = int.parse(numPhone.text);
                          Navigator.pop(context,proList);
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

  Padding textFormF(String lText, String hText ,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,//
        decoration: InputDecoration(
          labelText: lText,
          hintText: hText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
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
          color: Colors.blue,
        ),
      ),
    );
  }

  Padding PictureIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.account_circle_outlined,
        size: 100,
      ),
    );
  }
}