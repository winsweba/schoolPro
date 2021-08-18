import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nm/screens/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

import '../app.dart';

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new HomePage(),
      title: new Text('GeeksForGeeks',textScaleFactor: 2,),
      image: new Image.network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}




