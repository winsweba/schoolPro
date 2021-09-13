import 'dart:html';

import 'package:flutter/material.dart';

class anim extends StatefulWidget {
  const anim({Key key}) : super(key: key);

  @override
  _animState createState() => _animState();
}

class _animState extends State<anim> {
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
        children: [

          buildImageCard1(),
         

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
          onTap: () {

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
          'Wash and Iron',
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


