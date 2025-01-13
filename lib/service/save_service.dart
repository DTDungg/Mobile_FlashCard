import 'dart:convert';
import 'package:mobile_flash_card/model/save_from_client.dart';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:http/http.dart' as http;

import '../model/user_from_client.dart';

class SaveService {
  final String baseUrl = 'https://10.0.2.2:7252/api/Save';

  Future<void> CreateSave(SaveFromClient save) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(save.toJson()));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Failed to load data');
    }
  }
}