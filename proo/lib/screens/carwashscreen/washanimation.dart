import 'package:flutter/material.dart';
import 'package:nm/screens/carwashscreen/carwashmode.dart';

class anim extends StatefulWidget {
  @override
  _animState createState() => _animState();
}

class _animState extends State<anim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proceed to Payment'),
        elevation: 5.0,
        centerTitle: true,
        backgroundColor: Colors.lightBlue[200],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildImageCard1(),
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          RaisedButton(
            color: Colors.lightBlue[200],
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  //TODO Add  this
                  builder: (context) => carwashmode(),
                ),
              );
            },
            child: const Text('Click to Proceed'),
          ),
        ],
      ),
    );
  }
}

Widget buildImageCard1() => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage(
              'https://cdn.dribbble.com/users/479967/screenshots/2838999/comp_1_9.gif',
            ),
            child: InkWell(
              onTap: () {},
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
        ],
      ),
    );
