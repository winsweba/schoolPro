class UserData {
  final String uid;
  final String name;
  final String email;

  const UserData ({
    this.uid,
    this.name,
    this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json){
    return UserData(
      uid: json['UID'].toString(),
      name: json['name'].toString(),
      email: json['email'].toString(),
    );
  }
}