class CardFromDB {
  CardFromDB({
    required this.cardId,
    required this.front,
    required this.back,
    required this.description,
    required this.lastModify,
    required this.setId,
    required this.cardFromDbSet,
    required this.typeId,
    required this.type,
  });

  final int? cardId;
  final String? front;
  final String? back;
  final String? description;
  final DateTime? lastModify;
  final int? setId;
  final dynamic cardFromDbSet;
  final int? typeId;
  final dynamic type;

  factory CardFromDB.fromJson(Map<String, dynamic> json){
    return CardFromDB(
      cardId: json["cardID"],
      front: json["front"],
      back: json["back"],
      description: json["description"],
      lastModify: DateTime.tryParse(json["lastModify"] ?? ""),
      setId: json["setID"],
      cardFromDbSet: json["set"],
      typeId: json["typeID"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "cardID": cardId,
    "front": front,
    "back": back,
    "description": description,
    "lastModify": lastModify?.toIso8601String(),
    "setID": setId,
    "set": cardFromDbSet,
    "typeID": typeId,
    "type": type,
  };

}
