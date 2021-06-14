import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appdsds/models/booking.dart';


Future<void> userSetup(String name, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('AppUsers');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'name': name, 'email': email, 'uid': uid});
  return;
}

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Stream<List<Bookig>> fetchUpcomingWashingBay() {
    return _db
        .collection('request')
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) => snapshot
            .map((doc) => Bookig.fromFirestore(doc.data()))
            .toList());
  }
}