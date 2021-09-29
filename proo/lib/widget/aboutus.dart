import 'package:flutter/material.dart';

class ABOUT extends MaterialPageRoute<Null> {
  ABOUT()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('About Us'),
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
              '  The purpose of this project is to develop a car wash mobile application. This is to enable users to order for their cars to be washed and cleaned without any stress and time expenditure. This is also to provide cars and vehicles owners to know the available washing bays. Most people always find it difficult to know or locate the various washing bays in a particular region or area. Some workers such us bankers, business men, prominent persons etc. always want their car to be washed regularly but the problem is they don’t have the enough time for that, they are always busy with their job’s management. '

                  ,
              style: TextStyle(
                color:Colors.black,
                letterSpacing: 1.0,

                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0,),

          ],
        ),
      ),
    );
  });
}