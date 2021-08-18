import 'package:nm/models/laundry_model.dart';
import 'package:nm/models/washing_but.dart';
import 'package:nm/servers/firestore_service.dart';

class WashingBlock{
  final db = FirestoreService();

  Stream<List<WashingData>> get fetchUpcomingWashingBay => db.fetchUpcomingWashingBay();
  Stream<List<LaundryData>> get fetchUpcomingLaundry => db.fetchUpcomingLaundry();

  dispose(){
    
  }
}