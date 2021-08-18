import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nm/models/laundry_model.dart';
import 'package:nm/models/washing_but.dart';

Future<void> userSetup(String name, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'name': name, 'email': email, 'uid': uid});
  return;
}

Future<void> infoUserSetup(
    String name, String phone, String location, String carTyp,String washingBayName/*//TODO Add  this*/ ) async {
  CollectionReference users = FirebaseFirestore.instance.collection('request');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'phone': phone,
    'location': location,
    'carTyp': carTyp,

    //TODO Add  this
    'washingBayName': washingBayName,

    'timestamp': FieldValue.serverTimestamp()
  });
  return;
}

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Stream<List<WashingData>> fetchUpcomingWashingBay() {
    return _db
        .collection('washingbay')
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) => snapshot
            .map((doc) => WashingData.fromFirestore(doc.data()))
            .toList());
  }

  Stream<List<LaundryData>> fetchUpcomingLaundry() {
    return _db
        .collection('laundry')
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) => snapshot
            .map((doc) => LaundryData.fromFirestore(doc.data()))
            .toList());
  }
}
