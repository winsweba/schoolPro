class CleanupData{
  final String image;
  final String descrbtion;
  final String cleanupName;

  CleanupData({
    this.descrbtion,
    this.image,
    this.cleanupName,
  });



  CleanupData.fromFirestore(Map<String, dynamic> firestore)
      : image = firestore['image'],
        descrbtion = firestore['descrbtion'],
        cleanupName = firestore['cleanupName'];
}