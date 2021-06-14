import 'package:flutter_appdsds/models/booking.dart';
import 'package:flutter_appdsds/servers/firestore_servers.dart';

class WashingBlock{
  final db = FirestoreService();

  Stream<List<Bookig>> get fetchUpcomingWashingBay => db.fetchUpcomingWashingBay();

  dispose(){
    
  }
}