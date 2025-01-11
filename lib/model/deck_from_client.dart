class DeckFromClient {
  DeckFromClient({
    required this.setName,
    required this.setDescription,
    required this.isPublic,
    required this.userId,
  });

  final String? setName;
  final String? setDescription;
  final bool? isPublic;
  final int? userId;

  factory DeckFromClient.fromJson(Map<String, dynamic> json){
    return DeckFromClient(
      setName: json["setName"],
      setDescription: json["setDescription"],
      isPublic: json["isPublic"],
      userId: json["userID"],
    );
  }

  Map<String, dynamic> toJson() => {
    "setName": setName,
    "setDescription": setDescription,
    "isPublic": isPublic,
    "userID": userId,
  };

}
