import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nm/screens/payment/EXT&INT.dart';
import 'package:nm/screens/payment/EXT.dart';
import 'package:nm/screens/payment/INT.dart';
import 'package:nm/widget/Drawer.dart';

import 'home_page.dart';

class carwashmode extends StatefulWidget {
  const carwashmode({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _carwashmodeState createState() => _carwashmodeState();
}

class _carwashmodeState extends State<carwashmode> {
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
                          'https://www.autoguide.com/blog/wp-content/uploads/2020/05/best-car-detailing-products-1280x720.jpg',
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
                          'Exterior wash only (15GHC)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                            fontSize: 10,
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
                          'http://incubar.net/wp-content/uploads/2020/09/200826.002-2.jpg',
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                //TODO Add  this
                                  builder: (context) => int()),
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
                          'Enterior wash only (10GHC)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                            fontSize: 10,
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
                          'https://i.ibb.co/hf3mWSK/ext-and-int.png',
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                //TODO Add  this
                                  builder: (context) => extin()),
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
                          'Exterior & interior wash only (20 GHC)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                            fontSize: 10,
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
