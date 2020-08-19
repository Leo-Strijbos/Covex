import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';


class feed extends StatefulWidget {
  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  List pages = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          itemBuilder: (context, position) => pages[position],
          itemCount: pages.length,
          scrollDirection: Axis.vertical,
        )
    );;
  }
}
