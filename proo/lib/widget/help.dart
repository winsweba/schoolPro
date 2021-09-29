import 'package:flutter/material.dart';

class HELP extends MaterialPageRoute<Null> {
  HELP()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Help'),
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


            SizedBox(height: 10.0,),

                Text(
                  ' Search the shop you desire for your services.And select it. ',
                  style: TextStyle(
                    color:Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 18.0,
                  ),
                ),




            SizedBox(height: 6.0,),


                Text(
                  'Fill the required forms and submit it.',
                  style: TextStyle(
                    color:Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 18.0,
                  ),
                ),




            SizedBox(height: 10.0,),


                  Text(
                    'Make the require payment of your service.',
                    style: TextStyle(
                      color:Colors.black,
                      letterSpacing: 1.0,
                      fontSize: 18.0,
                    ),
                  ),

            SizedBox(height: 10.0,),

                  Text(
                    'Kindly wait for a call from the admin side.',
                    style: TextStyle(
                      color:Colors.black,
                      letterSpacing: 1.0,
                      fontSize: 18.0,
                    ),
                  ),
                ]

            ),

      )

        );

  });
}