// import 'package:mobile_flash_card/model/user_from_client.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class LoginService {
//   Future<int> login(UserFromClient user) async {
//     String baseUrl = "https://10.0.2.2:7252/api/User/login";
//
//     final response = await http.post(Uri.parse(baseUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(user.toJson()));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else if (response.statusCode == 404) {
//       throw Exception('Not found');
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
