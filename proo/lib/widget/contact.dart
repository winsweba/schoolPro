import 'package:flutter/material.dart';

class contact extends MaterialPageRoute<Null> {
  contact()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Contact Us'),
        elevation: 5.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/aa.jpg'),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 50.0,
              color: Colors.white,
            ),

            Text(
                'CALL US ON',
              style: TextStyle(
                    color:Colors.black,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
        ),
            ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
               Icon(
                 Icons.call,
                 color: Colors.black,
               ),
                Text(
                  '+233508057229',
                  style: TextStyle(
                    color:Colors.black,
                    letterSpacing: 1.0,
                     fontSize: 18.0,
                  ),
                ),
              ]

             ,
      ),
            SizedBox(height: 6.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                Text(
                  '+233548514223',
                  style: TextStyle(
                    color:Colors.black,
                    letterSpacing: 1.0,
                     fontSize: 18.0,
                  ),
                ),
              ]

              ,
            ),

             SizedBox(height: 15.0,),
            Text(
              'MAIL US ON',
              style: TextStyle(
                color:Colors.black,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
        SizedBox(height: 10.0,),
        Row(
          children: <Widget>[
            Icon(
              Icons.mail,
              color: Colors.black,
            ),
            Text(
              'henrymettle@gmail.com',
              style: TextStyle(
                color:Colors.black,
                letterSpacing: 1.0,
                fontSize: 18.0,
              ),
            ),
          ]

        ),

            Row(
                children: <Widget>[
                  Icon(
                    Icons.mail_outline,
                    color: Colors.black,
                  ),
                  Text(
                    'mettlehenry573@gmail.com',
                    style: TextStyle(
                      color:Colors.black,
                      letterSpacing: 1.0,
                       fontSize: 18.0,
                    ),
                  ),
                ]

            ),

             ],
        ),
      ),
    );
  });
}