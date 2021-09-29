import 'package:flutter/material.dart';
import 'package:nm/screens/payment/EXT.dart';
import 'package:nm/screens/payment/INT.dart';

class Mode extends StatefulWidget {
  @override
  _ModeState createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Mode'),
        elevation: 5.0,
        centerTitle: true,
        backgroundColor: Colors.lightBlue[200],
      ),
        body: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink.image(
                        image: NetworkImage(
                          'https://cdn.dribbble.com/users/1732368/screenshots/8016169/iron_clothes.gif',
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                //TODO Add  this
                                  builder: (context) => ext()),
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
                          '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                            fontSize: 20,
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
                child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink.image(
                        image: NetworkImage(
                          'https://cdn.dribbble.com/users/530738/screenshots/4198694/laundrytime_3_by_martin_kundby_motiondesigner.gif',
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                //TODO Add  this
                                  builder: (context) => ext()),
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
                          '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                            fontSize: 20,
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

