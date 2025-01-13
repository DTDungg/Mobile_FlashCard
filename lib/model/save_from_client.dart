class SaveFromClient {
  SaveFromClient({
    required this.userId,
    required this.setId,
  });

  final int? userId;
  final int? setId;

  factory SaveFromClient.fromJson(Map<String, dynamic> json){
    return SaveFromClient(
      userId: json["userID"],
      setId: json["setID"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userID": userId,
    "setID": setId,
  };

}
