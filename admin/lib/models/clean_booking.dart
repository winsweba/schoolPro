import 'package:cloud_firestore/cloud_firestore.dart';

class CleanBookig {
  final String name;
  final String phone;
  final String location;
  final String additional;

  //TODO Add  this
  final String cleanupName;
  final Timestamp timestamp;


    CleanBookig({
      this.name, 
      this.phone, 
      this.location, 
      this.additional,

      //TODO Add  this
      this.cleanupName,
      this.timestamp,

    });

  factory CleanBookig.fromFirestore(Map<String, dynamic> json){
    return CleanBookig(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      additional: json['additional'].toString(),

      //TODO Add  this
      cleanupName: json['cleanupName'].toString(),
      timestamp: json['timestamp'],

    );
  }
}
