class Deck{
  Deck({
    required this.id,
    required this.name,
    required this.isPublic,
    required this.description,
    required this.like,
    required this.userID
});

  final int id;
  final String name;
  final bool isPublic;
  final String description;
  final int like;
  final int userID;

  String fortmatID() {
    if (id < 10) {
      return "00$id";
    }else if (id < 100) {
      return "0$id";
    }else {
      return id.toString();
    }
  }

  factory Deck.fromJson(Map<String, dynamic> json){
    return Deck(id: json["id"], name: json["name"], isPublic: json["isPublic"], description: json["description"], like: json["like"], userID: json["userID"]);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isPublic": isPublic,
    "description": description,
    "like": like,
    "userID": userID
  };

}