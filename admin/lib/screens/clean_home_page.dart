import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appdsds/block/bookings_block.dart';
import 'package:flutter_appdsds/block/toast_messages.dart';
import 'package:flutter_appdsds/models/car_booking.dart';
import 'package:flutter_appdsds/models/clean_booking.dart';
import 'package:flutter_appdsds/screens/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CleanHomePage extends StatefulWidget {
  

  @override
  _CleanHomePageState createState() => _CleanHomePageState();
}

class _CleanHomePageState extends State<CleanHomePage> {
  @override
  Widget build(BuildContext context){

    var cleanups = Provider.of<WashingBlock>(context);

     return Scaffold(
        body: StreamBuilder<List<CleanBookig>>(
          stream:  cleanups.fetchUpcomingCleanups,
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
                  additional: bookingData.additional,
                  cleanupName: bookingData.cleanupName,
                  timeAndDate: timing.toString(),
                );
              }
            );
          }
        ),
      );
  } 


}

class BookingCards extends StatelessWidget {
  final String name;
  final String phone;
  final String location;
  final String additional;
  final String cleanupName;
  final String timeAndDate;

  BookingCards(
    {this.name,
    this.phone,
    this.location,
    this.additional,
    this.cleanupName,
    this.timeAndDate
    }
  );

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
                timeAndDate,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phone,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                location,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                additional,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                cleanupName,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
  }
}