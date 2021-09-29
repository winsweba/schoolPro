import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nm/screens/carwashscreen/home_page.dart';
import 'package:nm/screens/payment/EXT.dart';
import 'package:nm/screens/payment/INT.dart';
import 'package:nm/screens/payment/homeclean.dart';
import 'package:nm/screens/payment/officeclean.dart';

class cleanmode extends StatefulWidget {
  const cleanmode({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _cleanmodeState createState() => _cleanmodeState();
}

class _cleanmodeState extends State<cleanmode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose mode'),
        backgroundColor: Colors.lightBlue[200],
        elevation: 4.0,
        centerTitle: true,

        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      //TODO Add  this
                        builder: (context) => HomePage()),
                  );
                },
                child: Icon(
                  Icons.home,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
      Card(
      clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 6.0,
        child: Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(
                  'https://www.peopleready.com/wp-content/uploads/2021/04/img_office-cleaning_600x450.png',
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                        //TODO Add  this
                        builder: (context) => officeclean()),
                    );

                  },
                ),
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Office cleaning (20GHC)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                    fontSize: 12,
                  ),
                ),
              ),

            ]
        ),

      ),

          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 6.0,
            child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: NetworkImage(
                      'https://www.greenpeace.org/static/planet4-philippines-stateless/2020/03/f72c19ee-img_1981.jpg',
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                            //TODO Add  this
                            builder: (context) => homeclean()),
                        );
                      },
                    ),
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    left: 16,
                    child: Text(
                      'Home cleaning (20GHC)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                        fontSize: 12,
                      ),
                    ),
                  ),

                ]
            ),

          ),
      ]
      )
    );
  }
}
