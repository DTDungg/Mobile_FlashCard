class CardFromClient {
  CardFromClient({
    required this.front,
    required this.back,
    required this.description,
    required this.setId,
  });

  final String? front;
  final String? back;
  final String? description;
  final int? setId;

  factory CardFromClient.fromJson(Map<String, dynamic> json){
    return CardFromClient(
      front: json["front"],
      back: json["back"],
      description: json["description"],
      setId: json["setID"],
    );
  }

  Map<String, dynamic> toJson() => {
    "front": front,
    "back": back,
    "description": description,
    "setID": setId,
  };

}
