class LaundryData{
  final String image;
  final String descrbtion;
  final String laundryName;

  LaundryData({
    this.descrbtion,
    this.image,
    this.laundryName,
  });

  LaundryData.fromFirestore(Map<String,dynamic> firestore )
  : image = firestore['image'],
  descrbtion = firestore['descrbtion'],
  laundryName = firestore['laundryName'];
}