import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appdsds/models/car_booking.dart';
import 'package:flutter_appdsds/models/clean_booking.dart';
import 'package:flutter_appdsds/models/cleanupservices.dart';
import 'package:flutter_appdsds/models/laundey_booking.dart';
import 'package:flutter_appdsds/models/laundry_model.dart';
import 'package:flutter_appdsds/models/washing_but.dart';


Future<void> userSetup(String name, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('AppUsers');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'name': name, 'email': email, 'uid': uid});
  return;
}

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  
  Stream<List<CarBookig>> fetchUpcomingWashingBay() {
    return _db
        .collection('request')
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) => snapshot
            .map((doc) => CarBookig.fromFirestore(doc.data()))
            .toList());
  }

  Stream<List<CleanBookig>> fetchUpcomingCleanups() {
    return _db
        .collection('cleanupRequest')
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) => snapshot
            .map((doc) => CleanBookig.fromFirestore(doc.data()))
            .toList());
  }

  Stream<List<LaundryBooking>> fetchUpcomingLaundry() {
    return _db
        .collection('laundryRequest')
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) => snapshot
            .map((doc) => LaundryBooking.fromFirestore(doc.data()))
            .toList());
  }



//// Aproving Show

  // Stream<List<WashingData>> fetchUpcomingWashingBayA() {
  //   return _db
  //       .collection('washingbay').where("status", isEqualTo: "not approved",)
  //       .snapshots()
  //       .map((query) => query.docs)
  //       .map((snapshot) => snapshot
  //           .map((doc) => WashingData.fromFirestore(doc.data()))
  //           .toList());
  // }

  // Stream<List<LaundryData>> fetchUpcomingLaundryA() {
  //   return _db
  //       .collection('laundry')
  //       .snapshots()
  //       .map((query) => query.docs)
  //       .map((snapshot) => snapshot
  //           .map((doc) => LaundryData.fromFirestore(doc.data()))
  //           .toList());
  // }

  // Stream<List<CleanupData>> fetchUpcomingCleanup() {
  //   return _db
  //       .collection('cleanup')
  //       .snapshots()
  //       .map((query) => query.docs)
  //       .map((snapshot) => snapshot
  //       .map((doc) => CleanupData.fromFirestore(doc.data()))
  //       .toList());
  // }

}