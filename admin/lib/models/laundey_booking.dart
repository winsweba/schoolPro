import 'package:cloud_firestore/cloud_firestore.dart';

class LaundryBooking {
  final String name;
  final String phone;
  final String location;
  final String additional;

  //TODO Add  this
  final String laundryName;
  final Timestamp timestamp;


    LaundryBooking({
      this.name, 
      this.phone, 
      this.location, 
      this.additional,

      //TODO Add  this
      this.laundryName,
      this.timestamp,

    });

  factory LaundryBooking.fromFirestore(Map<String, dynamic> json){
    return LaundryBooking(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      additional: json['additional'].toString(),

      //TODO Add  this
      laundryName: json['laundryName'].toString(),
      timestamp: json['timestamp'],

    );
  }
}
