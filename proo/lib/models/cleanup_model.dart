class CleanupDetails {
  final String name;
  final String phone;
  final String location;
  final String additional;

  //TODO Add  this
  final String cleanupName;
  final String timestamp;


    CleanupDetails({
      this.name, 
      this.phone, 
      this.location, 
      this.additional,

      //TODO Add  this
      this.cleanupName,
      this.timestamp,

    });

  factory CleanupDetails.fromJson(Map<String, dynamic> json){
    return CleanupDetails(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      additional: json['additional'].toString(),

      //TODO Add  this
      cleanupName: json['cleanupName'].toString(),
      timestamp: json['timestamp'].toString(),

    );
  }
}
