import 'package:covex/services/loading.dart';
import 'package:flutter/material.dart';
import 'package:covex/services/authProvider.dart';
import 'chooseUsername.dart';

class fullName extends StatefulWidget {
  String email;
  String password;
  String username;


  fullName({this.email, this.password, this.username});

  @override
  _fullNameState createState() => _fullNameState();
}

class _fullNameState extends State<fullName> {
  final authProvider _auth = authProvider();
  final _formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";

  bool loading = false;

  String message = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Assets/Untitled.png'),
            fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 65, right: 60),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Just one last step...",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "First Name",
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (val) {
                    setState(() {
                      firstName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (val) {
                    setState(() {
                      lastName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton.extended(
                  heroTag: "registerButton",
                  icon: Icon(Icons.done, color: Colors.white,),
                  label: Text("Register"),
                  backgroundColor: Color.fromRGBO(40, 41, 59, 100),
                  onPressed: () async {
                    dynamic result = await _auth.registerWithEmailAndPassword(widget.email, widget.password, firstName, lastName, widget.username);
                    if(result == null) {
                      print("Unable to log in.");
                      setState(() {
                        error = "Email already in use. Please use a different email.";
                      });
                    }
                    else if (result != null) {
                      print("Registered");
                      setState(() {
                        message = "All done! Close the app and reopen it to launch the app!";
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "backButton",
          tooltip: "Go Back",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => unPage(email: widget.email, password: widget.password,),
                ));
          },
          child: Icon(Icons.arrow_back_ios),
          backgroundColor: Color.fromRGBO(82, 88, 255, 1),
        ),
      ),
    );
  }
}
