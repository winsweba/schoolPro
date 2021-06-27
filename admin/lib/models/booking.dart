import 'package:cloud_firestore/cloud_firestore.dart';

class Bookig {
  final String name;
  final String phone;
  final String location;
  final String carType;
  final String washingBayName;
  final Timestamp timestamp;

    Bookig({
      this.name, 
      this.phone, 
      this.location, 
      this.carType,
      this.washingBayName,
      this.timestamp});

  factory Bookig.fromFirestore(Map<String, dynamic> json){
    return Bookig(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      carType: json['carTyp'].toString(),
      washingBayName: json['washingBayName'].toString(),
      timestamp: json['timestamp'],
      // timestamp: DateTime.parse(json['timestamp'].toDate.toString()),
    );
  }
}
