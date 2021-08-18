import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nm/block/washing_block.dart';
import 'package:nm/models/application_user.dart';
import 'package:nm/models/laundry_model.dart';
import 'package:nm/models/washing_but.dart';
import 'package:nm/screens/register.dart';
import 'package:nm/widget/Drawer.dart';
import 'package:nm/screens/details.dart';
import 'package:nm/screens/sign_in.dart';
import 'package:provider/provider.dart';

class HomePageLon extends StatefulWidget {
  @override
  _HomePageLonState createState() => _HomePageLonState();
}

class _HomePageLonState extends State<HomePageLon> {
  @override
  Widget build(BuildContext context) {
    var laundry = Provider.of<WashingBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Washing Bay"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[200],
        elevation: 4.0,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: StreamBuilder<List<LaundryData>>(
          stream: laundry.fetchUpcomingLaundry,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );

            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var laundryData = snapshot.data[index];
                return BuildImageInteractionCard(
                  image: laundryData.image,
                  washingBayName: laundryData.laundryName,
                  descrbtion: laundryData.descrbtion,
                );
              },
            );
          }),
    );
  }
}

class BuildImageInteractionCard extends StatelessWidget {
  final String image;
  final String descrbtion;
  final String washingBayName;

  BuildImageInteractionCard({
    this.descrbtion,
    this.image,
    this.washingBayName,
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
                height: 240,
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
                          builder: (context) => DetailsScreen(washingBayName),
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
                  washingBayName,
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
