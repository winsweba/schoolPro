// ignore: avoid_web_libraries_in_flutter

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appdsds/block/toast_messages.dart';
import 'package:flutter_appdsds/screens/Register.dart';
import 'package:flutter_appdsds/screens/car_home_page.dart';
import 'package:flutter_appdsds/screens/home_main.dart';

class SignIn  extends StatefulWidget {


  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignIn> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Text('Sign in to washing bay'),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  )
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller:passwordTextEditingController ,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Passwold",
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  )
                ),
              ),
              SizedBox(height: 20.0),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.black45,
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                       onPressed: () async{
                        if (!emailTextEditingController.text.contains("@") )
                  {
                    displayToastMessage("Email address is not Valid", context);
                  }
                  else if (passwordTextEditingController.text.isEmpty )
                  {
                    displayToastMessage("Password is Mand", context);
                  }
                 else
                 {
                   loginAndAuthenticateUser(context);
                 }
                       },
              ),
              FlatButton(
                onPressed: () {
                 Navigator.push( context,
                          MaterialPageRoute(builder: (_) => SignUp()));
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
  void loginAndAuthenticateUser(BuildContext context) async{

    try {
            UserCredential user =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailTextEditingController.text,
              password: passwordTextEditingController.text,
            );
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // prefs.setString('displayName', user.user.displayName);

            
            Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeMainScreen()));

          displayToastMessage("You are now Login ", context);
          }catch (e) {
            print(e.toString());
            displayToastMessage("Error:::: " + e.toString(), context);
          }
  }
}

