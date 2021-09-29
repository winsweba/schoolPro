import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nm/block/auth_block.dart';
import 'package:nm/block/toast_message.dart';
import 'package:nm/main.dart';
import 'package:nm/screens/carwashscreen/home_page.dart';
import 'package:nm/screens/sign_in.dart';
import 'package:nm/servers/firestore_service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authBloc = Provider.of<AuthBolc>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          title: Text('Sign up to Wash'),
          backgroundColor: Colors.lightBlue[200],
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
              controller: nameTextEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Your name",
                prefixIcon: Icon(
                  Icons.assignment_ind,
                ),
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

            SizedBox(
              height: 10.0,
            ),

            TextField(
              controller: emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: true,
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

            SizedBox(
              height: 10.0,
            ),

            TextField(
              controller: passwordTextEditingController,
              keyboardType: TextInputType.text,
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
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (nameTextEditingController.text.length < 3) {
                  displayToastMessage(
                      "Name must be at lest 3 characters.", context);
                } else if (!emailTextEditingController.text.contains("@")) {
                  displayToastMessage("Email address is not Valid", context);
                } else if (passwordTextEditingController.text.length < 6) {
                  displayToastMessage(
                      "Password must be at lest 6 characters.", context);
                } else {
                  registerNewUser(context);
                }
              },
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignIn()));
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
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));

      displayToastMessage("Thank you for Signning up ", context);
    } catch (e) {
      print(e.toString());
      displayToastMessage("Error:::: " + e.toString(), context);
    }
  }
}
