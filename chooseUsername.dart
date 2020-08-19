import 'package:flutter/material.dart';
import 'chooseFullName.dart';
import 'regEmailPass.dart';
import 'package:covex/services/dbService.dart';

class unPage extends StatefulWidget {
  String email;
  String password;
  unPage({this.email, this.password});

  @override
  _unPageState createState() => _unPageState();
}

class _unPageState extends State<unPage> {
  String username;
  String error = "";
  bool validity;

  @override
  Widget build(BuildContext context) {
    return Container(
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

          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                "  Pick a Username",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65, right: 60),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onChanged: (val) {
                    username = val;
                  },
                ),
              ),
              FloatingActionButton.extended(
                  heroTag: "nextButton",
                  icon: Icon(Icons.navigate_next, color: Colors.white,),
                  label: Text("Next Step"),
                  backgroundColor: Color.fromRGBO(40, 41, 59, 100),
                  onPressed: () async {
                    final validity = await validateAndSubmit(username);
                    if (validity == false) {
                      setState(() {
                        error = "Username already taken.";
                      });
                    }
                    else if (username.length > 12) {
                      setState(() {
                        error = "Usernames should be 12 or less characters long.";
                      });
                    }
                    else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                fullName(email: widget.email,
                                  password: widget.password,
                                  username: username),
                          ));
                    }
                  }
              ),
              SizedBox(
                height: 30,
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
        floatingActionButton: FloatingActionButton(
          heroTag: "backButton",
          tooltip: "Go Back",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailPass(),
                ));
          },
          child: Icon(Icons.arrow_back_ios),
          backgroundColor: Color.fromRGBO(82, 88, 255, 1),
        ),
      ),
    );
  }

  Future<bool> validateAndSubmit(username) async {
    return await usernameData().usernameCheck(username);
  }
}
