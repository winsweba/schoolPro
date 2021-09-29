import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appdsds/block/bookings_block.dart';
import 'package:flutter_appdsds/models/washing_but.dart';
import 'package:flutter_appdsds/screens/home_main.dart';
import 'package:flutter_appdsds/screens/signin.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> showDialogForApprovingAd(selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Item Approval",
              style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Do you want to approve this item ?"),
              ],
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  "Cancel",
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text(
                  "Approve Now",
                ),
                onPressed: () {
                  Map<String, dynamic> adsData = {
                    "status": "approved",
                  };
                  FirebaseFirestore.instance
                      .collection('washingbay')
                      .doc(selectedDoc)
                      .update(adsData)
                      .then((value) {
                    print("Ad Approved successfully.");

                    Route newRoute =
                        MaterialPageRoute(builder: (_) => HomeMainScreen());
                    Navigator.pushReplacement(context, newRoute);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("washingbay")
        .where("status", isEqualTo: "not approved")
        .get()
        .then((results) {
      setState(() {
        shops = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var washingBay = Provider.of<WashingBlock>(context);
    return Scaffold(
      body: (shops != null)  ? Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: shops.docs.length,
              itemBuilder: (BuildContext context, int i) {
                // return BuildImageInteractionCard(
                //   image: washingData.image,
                //   washingBayName: washingData.washingBayName,
                //   descrbtion: washingData.descrbtion,
                // );
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 8,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Ink.image(
                            image: NetworkImage(shops.docs[i].get("image")),
                            // image: NetworkImage(washingData.image),
                            height: 200,
                            child: InkWell(
                              onTap: () {
                                showDialogForApprovingAd(shops.docs[i].id);
                              },
                            ),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            left: 16,
                            child: Text(
                              shops.docs[i].get("washingBayName"),
                              // washingData.washingBayName,
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
                           shops.docs[i].get("descrbtion"),
                          // washingData.descrbtion,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      ): Center(child: CircularProgressIndicator(),),
      //
    );
  }
}


/////
///
///
QuerySnapshot shops;
