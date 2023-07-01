import 'dart:io';

class ProfileModel{
  late int id = 0;
  late String firstname;
  late String lastname;
  late String email;
  late String phone;
  late String image;

  profileMap() {
    var mapping = Map<String, dynamic>();
    //mapping['id'] = id;
    mapping['firstname'] = firstname;
    mapping['lastname'] = lastname;
    mapping['email'] = email;
    mapping['phone'] = phone;
    mapping['image'] = image;

    return mapping;
  }
}