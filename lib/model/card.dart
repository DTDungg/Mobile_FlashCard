class Card{
  final int id;
  final String front;
  final String back;
  final String? describe;
  final int type;

  Card({
    required this.id,
    required this.front,
    required this.back,
    required this.describe,
    required this.type,
});
  factory Card.fromJson(Map<String, dynamic> json){
    return Card(id: json["id"], front: json["front"], back: json["back"], describe: json["describe"], type: json["type"]);
  }

  Map<String, dynamic> toJson() =>{
    "id": id,
    "front": front,
    "back": back,
    "describe": describe,
    "type": type
  };
}