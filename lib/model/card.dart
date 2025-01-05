class CustomCard{
  final int id;
  final String front;
  final String back;
  final String? describe;
  final int type;

  CustomCard({
    required this.id,
    required this.front,
    required this.back,
    required this.describe,
    required this.type,
});
  factory CustomCard.fromJson(Map<String, dynamic> json){
    return CustomCard(id: json["id"], front: json["front"], back: json["back"], describe: json["describe"], type: json["type"]);
  }

  Map<String, dynamic> toJson() =>{
    "id": id,
    "front": front,
    "back": back,
    "describe": describe,
    "type": type
  };
}