import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:covex/services/authProvider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'chooseUsername.dart';
import 'package:covex/services/loading.dart';
import 'package:covex/services/authenticate.dart';

class EmailPass extends StatefulWidget {
  final Function toggleView;
  EmailPass({ this.toggleView });

  @override
  _EmailPassState createState() => _EmailPassState();
}

class _EmailPassState extends State<EmailPass> {
  authProvider _auth = authProvider();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Passwords must have at least one special character')
  ]);

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String email = "";
  String password = "";
  String password2 = "";

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
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget> [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome to Covex",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "  Email",
                      hintStyle: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    validator: EmailValidator(errorText: 'Enter a valid email address'),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "  Password",
                      hintStyle: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    validator: passwordValidator,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "  Confirm Password",
                      hintStyle: TextStyle(
                          color: Colors.white
                      ),

                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validator: (val) => val != password ? "Enter the same password" : null,
                    onChanged: (val) {
                      setState(() {
                        password2 = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton.extended(
                    heroTag: "nextButton",
                    icon: Icon(Icons.navigate_next, color: Colors.white,),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => unPage(email: email,password:password),
                            ));
                        setState(() {
                          loading = true;
                        });
                      }
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => unPage(email: email,password:password),
//                        ));
                    },
                    label: Text("Next Step"),
                    backgroundColor: Color.fromRGBO(40, 41, 59, 1),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "toggleButton",
          tooltip: "Sign In",
          onPressed: () {
            setState(() {
              widget.toggleView();
            });
          },
          child: Icon(Icons.person),
          backgroundColor: Color.fromRGBO(88, 82, 255, 1),
        ),
      ),
    );
  }
}
