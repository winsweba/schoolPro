import 'package:flutter/material.dart';
import 'package:flutter_appdsds/screens/car_home_page.dart';
import 'package:flutter_appdsds/screens/clean_home_page.dart';
import 'package:flutter_appdsds/screens/laundry_home_page.dart';
import 'package:flutter_appdsds/widget/bottom.dart';

class HomeMainScreen extends StatefulWidget {
  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.pink, Colors.lightGreenAccent],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: Text(
            "Admin",
            style: TextStyle(
                fontSize: 55.0, color: Colors.white,),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: "CarW",
              ),
              Tab(
                icon: Icon(
                  Icons.perm_contact_calendar,
                  color: Colors.white,
                ),
                text: "Cleanup",
              ),
              Tab(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: "Laundry",
              ),
              Tab(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: "Aprovals",
              ),
            ],
            indicatorColor: Colors.white38,
            indicatorWeight: 5.0,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Colors.pink,
                Colors.lightGreenAccent,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: TabBarView(
            children: [
              CarHomePage(),
              CleanHomePage(),
              LaundryHomePage(),
              BottomNav(),
            ],
          ),
        ),
        
      ),
    );
  }
}
