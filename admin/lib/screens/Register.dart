import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appdsds/block/toast_messages.dart';
import 'package:flutter_appdsds/screens/home_page.dart';
import 'package:flutter_appdsds/screens/signin.dart';
import 'package:flutter_appdsds/servers/firestore_servers.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authBloc = Provider.of<AuthBolc>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          title: Text('Sign in to washing bay'),
        ),
        body: pageBody(
          context,
        ));
  }

  Widget pageBody(
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Form(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),

            TextField(
              controller: nameTextEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Your name",
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  )),
            ),

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
                  )),
            ),

            TextField(
              controller: passwordTextEditingController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  )),
            ),
            SizedBox(height: 20.0),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.black45,
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {

                if (nameTextEditingController.text.length < 3 )
                  {
                    displayToastMessage("Name must be at lest 3 characters.", context);
                  }

                  else if (!emailTextEditingController.text.contains("@") )
                  {
                    displayToastMessage("Email address is not Valid", context);
                  }
                  else if (passwordTextEditingController.text.length < 6 )
                  {
                    displayToastMessage("Password must be at lest 6 characters.", context);
                  }

                  else
                {
                  registerNewUser(context);
                  
                }

              },
            ),
            FlatButton(
                onPressed: () {
                 Navigator.push( context,
                          MaterialPageRoute(builder: (_) => SignIn()));
                },
                child: Text(
                  "Already have an Account? Login Here.",
                ),
              )
          ],
        ),
      ),
    );
  }

  void registerNewUser(BuildContext context) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      User updateUser = FirebaseAuth.instance.currentUser;
      updateUser.updateProfile(displayName: nameTextEditingController.text);
      userSetup(
          nameTextEditingController.text, emailTextEditingController.text);
          displayToastMessage("Thank you for Signning up ", context);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
    } catch (e) {
      print(e.toString());
      displayToastMessage("Error:::: " + e.toString(),context);
    }
  }
}
