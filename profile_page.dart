import 'package:flutter/material.dart';
import 'package:covex/services/authProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:covex/services/dbService.dart';
import 'package:covex/models/profile.dart';
import 'package:covex/models/newUser.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final authProvider _auth = authProvider();

  String firstName = "";
  String lastName = "";
  String userName = "";


  @override
  Widget build(BuildContext context) {
//    Future<FirebaseUser> uid = _auth.getUID();
    declareData();

    return Container(
      child: Column(
        children: <Widget>[
          Text("$firstName"),
          Text("$lastName"),
          Text("$userName"),
        ],
      ),
//        decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage('Assets/Untitled.png'),
//              fit: BoxFit.cover
//          ),
//        ),
//        child: profileBox(),
//        child: Scaffold(
//          appBar: AppBar(
//            title: Text(
//              "$firstName",
//              style: TextStyle(
//                color: Colors.black,
//              ),
//            ),
//            centerTitle: true,
//            backgroundColor: Color.fromRGBO(40, 41, 59, 1),
//          ),
////          body: profileBox(),
//          body: Container(
//            child: Text("$firstName"),
//          ),
//        ),

    );

  }
//  Future<FirebaseUser> getUser() async {
//    return await _auth.getUID();
//  }
//  Future<String> getUID(user) async {
//    return user.uid;
//  }
  void declareData() async {
    Map userData = await _auth.gettingData();
    setState(() {
      firstName = userData["firstName"];
      lastName = userData["lastName"];
      userName = userData["userName"];
    });
    print("First name is $firstName");
  }
}
