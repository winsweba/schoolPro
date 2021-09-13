import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nm/screens/payment/ext&int.dart';
import 'package:nm/screens/payment/extonly.dart';

class carwashmode extends StatefulWidget {
  const carwashmode({Key key, this.title }) : super(key: key);

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
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      //TODO Add  this
                      builder: (context) => ext(),
                    ),
                  );
                },
                child: const Text('Exterior car wash only      GHC20'),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              RaisedButton(
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      //TODO Add  this
                      builder: (context) => exin(),
                    ),
                  );
                },
                child: const Text('Exterior & Interior car wash     GHC30'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
