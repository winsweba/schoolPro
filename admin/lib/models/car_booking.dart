import 'package:cloud_firestore/cloud_firestore.dart';

class CarBookig {
  final String name;
  final String phone;
  final String location;
  final String carType;
  final String washingBayName;
  final Timestamp timestamp;

    CarBookig({
      this.name, 
      this.phone, 
      this.location, 
      this.carType,
      this.washingBayName,
      this.timestamp});

  factory CarBookig.fromFirestore(Map<String, dynamic> json){
    return CarBookig(
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
