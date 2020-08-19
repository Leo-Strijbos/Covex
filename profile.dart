import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covex/services/dbService.dart';

class profileBox extends StatefulWidget {
  @override
  _profileBoxState createState() => _profileBoxState();
}

class _profileBoxState extends State<profileBox> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuerySnapshot>(context);
    for (var doc in data.documents) {
      print(doc.data);
    }

    return Container(
//      child: Center(
//        child: Text("Profile"),
//      ),
    );
  }
}
