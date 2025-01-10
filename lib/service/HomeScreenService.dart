import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/chart.dart';

class HomeScreenService{
  final String baseUrl = 'https://10.0.2.2:7252/api/Home/2';

  //lấy thông tin làm bảng
  Future<List<Chart>> fetchAllChart() async{
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json)=> Chart.fromJson(json)).toList();
    }else{
      throw Exception("Tôi có lỗi");
    }
  }
}