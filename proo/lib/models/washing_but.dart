class WashingData{
  final String image;
  final String descrbtion;
  final String washingBayName;

  WashingData({
    this.descrbtion,
    this.image,
    this.washingBayName,
  });

  WashingData.fromFirestore(Map<String,dynamic> firestore )
  : image = firestore['image'],
  descrbtion = firestore['descrbtion'],
  washingBayName = firestore['washingBayName'];
}