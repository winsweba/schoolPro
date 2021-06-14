class Bookig {
  final String name;
  final String phone;
  final String location;
  final String carType;
  final String washingBayName;

    Bookig({
      this.name, 
      this.phone, 
      this.location, 
      this.carType,
      this.washingBayName});

  factory Bookig.fromFirestore(Map<String, dynamic> json){
    return Bookig(
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      location: json['location'].toString(),
      carType: json['carTyp'].toString(),
      washingBayName: json['washingBayName'].toString(),
    );
  }
}
