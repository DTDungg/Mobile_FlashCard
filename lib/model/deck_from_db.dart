class DeckFromDb {
  DeckFromDb({
    required this.setId,
    required this.setName,
    required this.setDescription,
    required this.isPublic,
    required this.liked,
    required this.userId,
    required this.user,
    required this.cards,
    required this.saves,
  });

  final int? setId;
  final String? setName;
  final String? setDescription;
  final bool? isPublic;
  final int? liked;
  final int? userId;
  final dynamic user;
  final dynamic cards;
  final dynamic saves;

  factory DeckFromDb.fromJson(Map<String, dynamic> json){
    return DeckFromDb(
      setId: json["setID"],
      setName: json["setName"],
      setDescription: json["setDescription"],
      isPublic: json["isPublic"],
      liked: json["liked"],
      userId: json["userID"],
      user: json["user"],
      cards: json["cards"],
      saves: json["saves"],
    );
  }

  String fortmatID() {
    if (setId! < 10) {
      return "00$setId";
    }else if (setId! < 100) {
      return "0$setId";
    }else {
      return setId.toString();
    }
  }

  Map<String, dynamic> toJson() => {
    "setID": setId,
    "setName": setName,
    "setDescription": setDescription,
    "isPublic": isPublic,
    "liked": liked,
    "userID": userId,
    "user": user,
    "cards": cards,
    "saves": saves,
  };

}
