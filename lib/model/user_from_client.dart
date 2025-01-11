class UserFromClient {
  UserFromClient({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String? userName;
  final String? email;
  final String? password;

  factory UserFromClient.fromJson(Map<String, dynamic> json){
    return UserFromClient(
      userName: json["userName"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "email": email,
    "password": password,
  };

}
