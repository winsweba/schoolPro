import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appdsds/block/bookings_block.dart';
import 'package:flutter_appdsds/screens/Register.dart';
import 'package:flutter_appdsds/screens/car_home_page.dart';
import 'package:flutter_appdsds/screens/home_main.dart';
import 'package:flutter_appdsds/screens/signin.dart';
import 'package:provider/provider.dart';

final washingBlock = WashingBlock();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
         Provider(create: (context) => washingBlock,)
      ],
        child: PlatformApp(),
      );
      } 
   @override
  void dispose() {
    washingBlock.dispose();
    super.dispose();
  }
}



class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "booking",
        home:  FirebaseAuth.instance.currentUser == null ? SignIn() : HomeMainScreen(),
    );
  }
}