import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nm/block/toast_message.dart';
import 'package:nm/screens/home_page.dart';
import 'package:nm/screens/laundry_home.dart';
import 'package:nm/screens/sign_in.dart';

class MainDrawer extends StatelessWidget {

  @override
    Widget build(BuildContext context){
  return Drawer(
    child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Colors.lightBlue[200],
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  decoration:BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage('https://i.guim.co.uk/img/media/001b9bd4675078646384935edce599ceb33f0e7f/0_247_4200_2520/master/4200.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=12c5d53fab5cdbc28a1de07d7ede2cc0',
                    ),
                      fit: BoxFit.fill,
                  ),
                ),
                ),
                Text('Washing Bay',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          onTap: () {
            FirebaseAuth.instance.signOut();
            displayToastMessage("You are now Logged Out", context);
            Navigator.push( context,
                          MaterialPageRoute(builder: (_) => SignIn()));
            // Navigator.of(context).pushReplacementNamed(context,
            //               MaterialPageRoute(builder: (_) => SignIn()));
            // Navigator.pop(context);
            // Navigator.of(context).push(REGISTRATION());
          },
          leading: Icon(
            Icons.assignment_ind_rounded,
            color: Colors.black45,
          ),
          title: Text("Logout"),
        ),
        ListTile(
          onTap: () {
            //  Laundry
            Navigator.push( context,
                          MaterialPageRoute(builder: (_) => HomePageLon()));
          },
          leading: Icon(
            Icons.airport_shuttle_sharp,
            color: Colors.black45,
          ),
          title: Text("Help"),
        ),
        ListTile(
          onTap: () {
            // Washing
            Navigator.push( context,
                          MaterialPageRoute(builder: (_) => HomePage()));
          },
          leading: Icon(
            Icons.airport_shuttle_outlined,
            color: Colors.black45,
          ),
          title: Text("About Us"),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(CONTACT());
          },
          leading: Icon(
            Icons.add_call,
            color: Colors.black45,
          ),
          title: Text("Contact"),
        ),
      ],
    ),
  );
  }
}

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
      body: Center(
        child: Text('Help'),
      ),
    );
  });
}

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
      body: Center(
        child: Text('About Us'),
      ),
    );
  });
}

class CONTACT extends MaterialPageRoute<Null> {
  CONTACT()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Contact'),
        elevation: 5.0,
        centerTitle: true,
      ),
      body: Center(
        child: Text('Contact'),
      ),
    );
  });
}
