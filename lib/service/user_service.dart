import 'dart:convert';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:http/http.dart' as http;

import '../model/user_from_client.dart';

class UserService{
  final String baseUrl = 'https://10.0.2.2:7252/api/User';

  Future<UserFromDB> fetchUser(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if(response.statusCode == 200){
      return UserFromDB.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Lỗi của tôi');
    }

  }

  Future<int> login(UserFromClient user) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  Future<List<UserFromDB>> topUser() async{
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      List<dynamic> users = jsonDecode(response.body);
      return users.map((json) => UserFromDB.fromJson(json)).toList();
    } if(response.statusCode == 404){
      return List.empty();
    } else{
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
    }
  }
  
  Future<void> updateGift(int id, int sl) async{
    final response = await http.put(Uri.parse('$baseUrl/gift/$id&$sl'));

    if(response.statusCode != 200 && response.statusCode != 404)
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
  }
}