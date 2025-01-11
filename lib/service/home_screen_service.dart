import 'package:http/http.dart' as http;
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'dart:convert';

import '../model/chart.dart';

class HomeScreenService{
  final String baseUrl = 'https://10.0.2.2:7252/api/Home';

  //lấy thông tin làm bảng
  Future<List<Chart>> fetchAllChart(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json)=> Chart.fromJson(json)).toList();
    }if(response.statusCode == 404){
      return List.empty();
    }
    else{
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
    }
  }

  //lấy thông tin card can review
  Future<List<CardFromDB>> fetchAllCard(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/card/$id'));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json)=> CardFromDB.fromJson(json)).toList();
    }if(response.statusCode == 404){
      return List.empty();
    }else{
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
    }
  }

}