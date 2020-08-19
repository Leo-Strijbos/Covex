import 'package:provider/provider.dart';
import 'package:covex/screens/home.dart';
import 'authenticate.dart';
import 'package:flutter/material.dart';
import 'package:covex/models/newUser.dart';
import 'package:covex/screens/chooseFullName.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user.uid);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return homeHierarchy();
    }

  }
}