import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nm/screens/carwashscreen/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

import '../app.dart';

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new HomePage(),
      title: new Text('Wash',textScaleFactor: 2,),
      image: new Image.asset('assets/aa.jpg'),
      loadingText: Text("Loading"),
      photoSize: 90.0,
      loaderColor: Colors.blue,
    );
  }
}




