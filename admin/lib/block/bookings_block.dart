import 'package:flutter_appdsds/models/car_booking.dart';
import 'package:flutter_appdsds/models/clean_booking.dart';
import 'package:flutter_appdsds/models/cleanupservices.dart';
import 'package:flutter_appdsds/models/laundey_booking.dart';
import 'package:flutter_appdsds/models/laundry_model.dart';
import 'package:flutter_appdsds/models/washing_but.dart';
import 'package:flutter_appdsds/servers/firestore_servers.dart';

class WashingBlock{
  final db = FirestoreService();

  Stream<List<CarBookig>> get fetchUpcomingWashingBay => db.fetchUpcomingWashingBay();

  Stream<List<CleanBookig>> get fetchUpcomingCleanups => db.fetchUpcomingCleanups();

  Stream<List<LaundryBooking>> get fetchUpcomingLaundry => db.fetchUpcomingLaundry();

  // Stream<List<WashingData>> get fetchUpcomingWashingBayA => db.fetchUpcomingWashingBayA();
  // Stream<List<LaundryData>> get fetchUpcomingLaundryA => db.fetchUpcomingLaundryA();
  // Stream<List<CleanupData>> get fetchUpcomingCleanupA => db.fetchUpcomingCleanup();

  dispose(){
    
  }
}