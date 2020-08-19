import 'package:flutter/material.dart';
import 'package:covex/services/authProvider.dart';
import 'package:covex/services/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final authProvider _auth = authProvider();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

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
          padding: EdgeInsets.only(left: 65, top: 60, right: 60),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                    "Welcome to Covex",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 30,
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
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "  Password",
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                FloatingActionButton.extended(
                  heroTag: "nextButton",
                  icon: Icon(Icons.check, color: Colors.white,),
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Could not sign in with those credentials';
                        loading = false;
                      });
                    }
                  },
                  label: Text("Sign In"),
                  backgroundColor: Color.fromRGBO(40, 41, 59, 1),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.assignment),
          tooltip: "Register",
          backgroundColor: Color.fromRGBO(82, 88, 255, 1),
          onPressed: () {
            setState(() {
              loading = true;
              widget.toggleView();
            });
          },
        ),
//      backgroundColor: Colors.brown[100],
//      appBar: AppBar(
//        backgroundColor: Colors.brown[400],
//        elevation: 0.0,
//        title: Text('Sign in to Brew Crew'),
//        actions: <Widget>[
//          FlatButton.icon(
//            icon: Icon(Icons.assignment),
//            label: Text('Register'),
//            onPressed: () => widget.toggleView(),
//          ),
//        ],
//      ),
//      body: Container(
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//        child: Form(
//          key: _formKey,
//          child: Column(
//            children: <Widget>[
//              SizedBox(height: 20.0),
//              TextFormField(
//                validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                onChanged: (val) {
//                  setState(() => email = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              TextFormField(
//                obscureText: true,
//                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
//                onChanged: (val) {
//                  setState(() => password = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              RaisedButton(
//                  color: Colors.pink[400],
//                  child: Text(
//                    'Sign In',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  onPressed: () async {
//                    if(_formKey.currentState.validate()){
//                      setState(() {
//                        loading = true;
//                      });
//                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//                      if(result == null) {
//                        setState(() {
//                          error = 'Could not sign in with those credentials';
//                          loading = false;
//                        });
//                      }
//                    }
//                  }
//              ),
//              SizedBox(height: 12.0),
//              Text(
//                error,
//                style: TextStyle(color: Colors.red, fontSize: 14.0),
//              ),
//            ],
//          ),
//        ),
//      ),
      ),
    );
  }
}