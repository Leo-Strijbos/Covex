import 'package:flutter/material.dart';
import 'services/wrapper.dart';
import 'package:provider/provider.dart';
import 'models/newUser.dart';
import 'services/authProvider.dart';
import 'services/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: authProvider().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

