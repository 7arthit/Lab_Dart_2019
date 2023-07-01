import 'package:flutter/material.dart';
import '../model/profile_model.dart';

class cl_create extends StatefulWidget{
  int len = 0;

  cl_create(int length){
    this.len = length;
  }

  @override
  State<cl_create> createState() => _cl_createState(len);
}

class _cl_createState extends State<cl_create>{

  int len = 0;
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

  _cl_createState(int len){
    this.len = len;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Form'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                PictureIcon(),
                textHeader('Student Information'),
                textFromF('studentID','Input studentID',studentID),
                textFromF('First name','Input First name',firstName),
                textFromF('Last name','Input Last name',lastName),
                textFromF('Nick name','Input Nick name',nickName),
                textFromF('Day of Birth','Input Day of Birth ( 1 - 31 )',birthDay),
                textFromF('Month of Birth','Input Month of Birth ( Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec )',monthBirth),
                textFromF('Year of Birth','Input Year of Birth ( 1988 - 2022 )',birthYear),
                textFromF('Age','Input Age ( 1 - 100 )',Age),
                textFromF('Year Class','Input Year Class ( 1 - 8 )',yearClass),
                textFromF('Branch name','Input Branch name',branchName),
                textFromF('University name','Input University name',universityName),
                textFromF('Number Phone','Input Number Phone',numPhone),
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
                          print(studentID.text);
                          print(firstName.text);
                          print(lastName.text);
                          print(nickName.text);
                          print(birthDay.text);
                          print(monthBirth.text);
                          print(birthYear.text);
                          print(Age.text);
                          print(yearClass.text);
                          print(branchName.text);
                          print(universityName.text);
                          print(numPhone.text);

                          ProfileModel profile = new ProfileModel(
                              len,
                              int.parse(studentID.text),//
                              firstName.text,
                              lastName.text,
                              nickName.text,
                              int.parse(birthDay.text),
                              monthBirth.text,
                              int.parse(birthYear.text),
                              int.parse(Age.text),
                              int.parse(yearClass.text),
                              branchName.text,
                              universityName.text,
                              int.parse(numPhone.text));
                          Navigator.pop(context,profile);
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