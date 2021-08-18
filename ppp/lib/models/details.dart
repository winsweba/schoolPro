class Details {
  final String name;
  final String phone;
  final String location;
  final String carType;

  //TODO Add  this
  final String washingBayName;
  final String timestamp;


    Details({
      this.name, 
      this.phone, 
      this.location, 
      this.carType,

      //TODO Add  this
      this.washingBayName,
      this.timestamp,

    });

  factory Details.fromJson(Map<String, dynamic> json){
    return Details(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      carType: json['carType'].toString(),

      //TODO Add  this
      washingBayName: json['washingBayName'].toString(),
      timestamp: json['timestamp'].toString(),

    );
  }
}
