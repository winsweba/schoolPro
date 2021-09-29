import 'package:flutter/material.dart';
import 'package:flutter_appdsds/aprove_screen/cleanupservices.dart';
import 'package:flutter_appdsds/aprove_screen/home_page.dart';
import 'package:flutter_appdsds/aprove_screen/laundry_home.dart';
import 'package:flutter_appdsds/block/bookings_block.dart';
import 'package:flutter_appdsds/models/cleanupservices.dart';
import 'package:flutter_appdsds/models/washing_but.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _seletedItem = 0;
  // var _pages = [HomePage(), HomePageclean(), HomePageLon()];

  @override
  Widget build(BuildContext context) {
    var washingBay = Provider.of<WashingBlock>(context);
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.home),
              onTap: () {
                print("...............................");

                Route newRoute =
                    MaterialPageRoute(builder: (context) => HomePage());
                Navigator.push(context, newRoute);
              },
            ),
            label: 'Car W',
          ),
          BottomNavigationBarItem(
              icon: GestureDetector(
                child: Icon(Icons.photo),
                onTap: () {
                  Route newRoute =
                      MaterialPageRoute(builder: (context) => HomePageclean());
                  Navigator.push(context, newRoute);
                },
              ),
              label: 'Clean Up'),
          BottomNavigationBarItem(
              icon: GestureDetector(
                child: Icon(Icons.account_circle),
                onTap: () {
                  Route newRoute =
                      MaterialPageRoute(builder: (context) => HomePageLon());
                  Navigator.push(context, newRoute);
                },
              ),
              label: 'Laundry'),
        ],
        currentIndex: _seletedItem,
        onTap: (index) {
          setState(() {
            _seletedItem = index;
          });
        },
      ),
    );
  }
}

