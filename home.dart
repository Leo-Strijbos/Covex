import 'package:covex/services/authProvider.dart';
import 'package:flutter/material.dart';
import 'feed.dart';
import 'profile_page.dart';

class homeHierarchy extends StatefulWidget {
  @override
  _homeHierarchyState createState() => _homeHierarchyState();
}

class _homeHierarchyState extends State<homeHierarchy> {
  int _currentIndex = 0;
  final tabs = [
    feed(),
    Center(child: Text("Featured"),),
    Center(child: Text("Search"),),
    Profile()
  ];
  final appbars = [
    null,
    AppBar(title: Text("Featured"),backgroundColor: Color.fromRGBO(40, 41, 59, 1),centerTitle: true,),
    AppBar(title: Text("Find Friends"),backgroundColor: Color.fromRGBO(40, 41, 59, 1),centerTitle: true,),
    AppBar(title: Text("Profile"),backgroundColor: Color.fromRGBO(40, 41, 59, 1),centerTitle: true,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbars[_currentIndex],
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            title: Text("Home", style: TextStyle(color: Colors.blue),),
            icon: Icon(Icons.home, color: Colors.black,),
            activeIcon: Icon(Icons.home, color: Colors.white,),
            backgroundColor: Color.fromRGBO(40, 41, 59, 1),
          ),
          BottomNavigationBarItem(
              title: Text("Search", style: TextStyle(color: Colors.blue),),
              icon: Icon(Icons.bubble_chart, color: Colors.black,),
              activeIcon: Icon(Icons.bubble_chart, color: Colors.redAccent[800],),
              backgroundColor: Color.fromRGBO(0, 210, 154, 1)
          ),
          BottomNavigationBarItem(
              title: Text("Find People", style: TextStyle(color: Colors.blue),),
              icon: Icon(Icons.search, color: Colors.black,),
              activeIcon: Icon(Icons.search, color: Colors.black,),
            backgroundColor: Color.fromRGBO(240, 183, 34, 1)
          ),
          BottomNavigationBarItem(
              title: Text("Profile", style: TextStyle(color: Colors.blue),),
              icon: Icon(Icons.person, color: Colors.black,),
              activeIcon: Icon(Icons.person, color: Colors.yellow,),
              backgroundColor: Color.fromRGBO(120, 82, 255, 1)
          )
        ],
      ),
    );
  }
}
