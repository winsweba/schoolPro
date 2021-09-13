import 'package:flutter/material.dart';
import 'package:nm/block/auth_block.dart';
import 'package:nm/block/washing_block.dart';
import 'package:nm/screens/home_page.dart';
import 'package:nm/screens/splashscreen.dart';
import 'package:provider/provider.dart';

final washingBlock = WashingBlock();

class MyApp extends StatefulWidget {
 

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context)  {

    // return MaterialApp(
    //   home: HomePage(),
    //     theme: ThemeData(
    //       scaffoldBackgroundColor: Colors.white,
    //     ),
    // );

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
      home: Splash2(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
    );
  }
}
