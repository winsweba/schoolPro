class Details {
  final String name;
  final String phone;
  final String location;
  final String carType;
  final String uid;

    Details({
      this.uid, 
      this.name, 
      this.phone, 
      this.location, 
      this.carType});

  factory Details.fromJson(Map<String, dynamic> json){
    return Details(
      uid: json['UID'].toString(),
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      carType: json['carType'].toString(),
    );
  }
}
