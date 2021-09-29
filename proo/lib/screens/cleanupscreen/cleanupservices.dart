import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nm/block/washing_block.dart';
import 'package:nm/models/application_user.dart';
import 'package:nm/models/cleanupservices.dart';
import 'package:nm/models/laundry_model.dart';
import 'package:nm/models/washing_but.dart';
import 'package:nm/screen_admin/cleanup_admin.dart';
import 'package:nm/screens/cleanupscreen/cleanup_search_screen.dart';
import 'package:nm/screens/cleanupscreen/cleanupdetails.dart';
import 'package:nm/screens/laundryscreen/laundryanimation.dart';
import 'package:nm/screens/register.dart';
import 'package:nm/widget/Drawer.dart';
import 'package:nm/screens/carwashscreen/details.dart';
import 'package:nm/screens/sign_in.dart';
import 'package:provider/provider.dart';

import '../laundryscreen/Laundrydetails.dart';

class HomePageclean extends StatefulWidget {
  @override
  _HomePagecleanState createState() => _HomePagecleanState();
}

class _HomePagecleanState extends State<HomePageclean> {
  @override
  Widget build(BuildContext context) {
    var Cleanup = Provider.of<WashingBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Laundry Shops"),
        actions: [
          IconButton(
            icon: Icon(Icons.search, ),
            onPressed: () {
              Route newRoute = MaterialPageRoute(builder: (context) => CleanupSearchScreen());
        Navigator.pushReplacement(context, newRoute);
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.lightBlue[200],
        elevation: 4.0,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: StreamBuilder<List<CleanupData>>(
          stream: Cleanup.fetchUpcomingCleanup,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );

            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var CleanupData = snapshot.data[index];
                return BuildImageInteractionCard(
                  image: CleanupData.image,
                  cleanupName: CleanupData.cleanupName,
                  descrbtion: CleanupData.descrbtion,
                );
              },
            );
          },),
          floatingActionButton: FloatingActionButton(
        tooltip: 'Add post',
        child: Icon(Icons.add),
        onPressed: () {
          Route newRoute =
              MaterialPageRoute(builder: (context) => CleanupAdminScreen());
          Navigator.push(context, newRoute);
        },
      ),
    );
  }
}

class BuildImageInteractionCard extends StatelessWidget {
  final String image;
  final String descrbtion;
  final String cleanupName;

  BuildImageInteractionCard({
    this.descrbtion,
    this.image,
    this.cleanupName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 8,
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(image),
                height: 200,
                child: InkWell(
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser == null) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignIn()));
                    } else {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          //TODO Add  this
                          builder: (context) => CleanupDetails(cleanupName),
                        ),
                      );
                    }
                  },
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  cleanupName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              descrbtion,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
