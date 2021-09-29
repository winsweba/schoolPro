// ignore: avoid_web_libraries_in_flutter

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nm/block/toast_message.dart';
import 'package:nm/screens/carwashscreen/home_page.dart';
import 'package:nm/screens/register.dart';

class SignIn extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignIn> {
  bool _isObscure = true;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Text('Sign in to Wash'),
        backgroundColor: Colors.lightBlue[200],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/aa.jpg'),
                  radius: 50.0,
                ),
              ),
              Divider(
                height: 50.0,
                color: Colors.white,
              ),

              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlue[200], width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlue[200], width: 2),
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.emailAddress,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                  prefixIcon: Icon(Icons.lock),
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlue[200], width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlue[200], width: 2),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.lightBlue[200],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (!emailTextEditingController.text.contains("@")) {
                    displayToastMessage("Email address is not Valid", context);
                  } else if (passwordTextEditingController.text.isEmpty) {
                    displayToastMessage("Password is Mand", context);
                  } else {
                    loginAndAuthenticateUser(context);
                  }
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: Text(
                  "Do not have an Account? Register Here.",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loginAndAuthenticateUser(BuildContext context) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('displayName', user.user.displayName);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      displayToastMessage("You are now Login ", context);
    } catch (e) {
      print(e.toString());
      displayToastMessage("Error:::: " + e.toString(), context);
    }
  }
}
