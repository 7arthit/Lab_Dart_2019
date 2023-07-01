import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:developer';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({Key? key}) : super(key : key);

  @override
  State<FacebookLogin> createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {

  String name = "";
  String img = "https://virl.bc.ca/wp-content/uploads/2019/01/AccountIcon2.png";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FB Login'),
      ),
      body: Center(
        child: Card(
          color: Colors.lightBlueAccent.shade100,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.network(
                img,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(name),
                subtitle: Text(
                  email,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final LoginResult result =
                      await FacebookAuth.instance.login();
                  if (result.status == LoginStatus.success) {
                    final AccessToken accessToken = result.accessToken!;
                    log(accessToken.token);
                    final userData = await FacebookAuth.instance.getUserData();
                    log(userData.toString());
                    setState(() {
                      name = userData['name'];
                      email = userData['email'];
                      img = userData['picture']['data']['url'];
                    });
                  }
                },
                child: Text('Facebook Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}