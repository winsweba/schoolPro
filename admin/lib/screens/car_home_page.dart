import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appdsds/block/bookings_block.dart';
import 'package:flutter_appdsds/block/toast_messages.dart';
import 'package:flutter_appdsds/models/car_booking.dart';
import 'package:flutter_appdsds/screens/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CarHomePage extends StatefulWidget {
  

  @override
  _CarHomePageState createState() => _CarHomePageState();
}

class _CarHomePageState extends State<CarHomePage> {
  @override
  Widget build(BuildContext context){

    var washingBay = Provider.of<WashingBlock>(context);

     return Scaffold(
        body: StreamBuilder<List<CarBookig>>(
          stream:  washingBay.fetchUpcomingWashingBay,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return ListView.builder(
               padding: EdgeInsets.all(16),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                var bookingData = snapshot.data[index];
                var timing = DateTime.parse(bookingData.timestamp.toDate().toString());
                // DateTime timing = (snapshot.data['timestamp'].toDate().toString());
                return BookingCards(
                  name: bookingData.name,
                  phone: bookingData.phone,
                  location: bookingData.location,
                  carType: bookingData.carType,
                  washingBayName: bookingData.washingBayName,
                  timeAndDate: timing.toString(),
                );
              }
            );
          }
        ),
      );
  } 

 

}

class BookingCards extends StatefulWidget {
  final String name;
  final String phone;
  final String location;
  final String carType;
  final String washingBayName;
  final String timeAndDate;

  BookingCards(
    {this.name,
    this.phone,
    this.location,
    this.carType,
    this.washingBayName,
    this.timeAndDate
    }
  );

  @override
  State<BookingCards> createState() => _BookingCardsState();
}

class _BookingCardsState extends State<BookingCards> {

  Future<bool> showDialogForApprovingAd(selectedDoc) async
  {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title: Text(
            "Item Approval",
            style: TextStyle(fontSize: 24, letterSpacing: 2.0, fontWeight: FontWeight.bold),
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
              onPressed: ()
              {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text(
                "Approve Now",
              ),
              onPressed: ()
              {
                Map<String, dynamic> adsData =
                {
                  "status": "approved",
                };
                FirebaseFirestore.instance.collection("items")
                    .doc(selectedDoc)
                    .update(adsData).then((value)
                {
                  print("Ad Approved successfully.");

                  // Route newRoute = MaterialPageRoute(builder: (_) => HomeScreen());
                  // Navigator.pushReplacement(context, newRoute);
                  
                });
              },
            ),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    // var timing = DateTime.parse(timeAndDate.toDate().toString());
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8.0,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.timeAndDate,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.phone,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                widget.location,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                widget.carType,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                widget.washingBayName,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
  }
}