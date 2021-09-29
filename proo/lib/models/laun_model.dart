class LaunDetails {
  final String name;
  final String phone;
  final String location;
  final String additional;

  //TODO Add  this
  final String laundryName;
  final String timestamp;


    LaunDetails({
      this.name, 
      this.phone, 
      this.location, 
      this.additional,

      //TODO Add  this
      this.laundryName,
      this.timestamp,

    });

  factory LaunDetails.fromJson(Map<String, dynamic> json){
    return LaunDetails(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      additional: json['additional'].toString(),

      //TODO Add  this
      laundryName: json['laundryName'].toString(),
      timestamp: json['timestamp'].toString(),

    );
  }
}
