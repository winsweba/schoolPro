import 'dart:js';

import 'package:flutter/material.dart';
import 'package:nm/screens/home_page.dart';
import 'package:nm/screens/register.dart';
import 'package:nm/screens/sign_in.dart';
import 'package:nm/screens/splashscreen.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes( RouteSettings settings){
    switch(settings.name){

      case "/landing":
      return MaterialPageRoute(builder: (context) => HomePage());
      case "/signup":
      return MaterialPageRoute(builder: (context) => SignUp());
      case "/login":
      return MaterialPageRoute(builder: (context) => SignIn());
    }
    
  }
}