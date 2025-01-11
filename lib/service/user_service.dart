import 'dart:convert';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:http/http.dart' as http;

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
}