import 'package:http/http.dart' as http;
import 'package:mobile_flash_card/model/card_from_client.dart';
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'dart:convert';

class CardService{
  final String baseUrl = 'https://10.0.2.2:7252/api/Card';

  Future<void> UpdateReviewedCard (int cardID, int typeID) async{
    final response = await http.get(Uri.parse('$baseUrl/reviewed?cardID=$cardID&typeID=$typeID'));
      if(response.statusCode != 200){
        throw Exception("Update Failed");
      }
  }

  Future<List<CardFromDB>> fetchAllCardOfDeck(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/deck/$id'));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => CardFromDB.fromJson(json)).toList();
    }if(response.statusCode == 404){
      return List.empty();
    }else{
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
    }
  }

  Future createNewCard(CardFromClient card) async{
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(card.toJson()));
    if(response.statusCode != 200 && response.statusCode != 404) {
      throw Exception('Failed to load data');
    }
  }

  Future<void> DeleteCard (int cardID) async{
    final response = await http.delete(Uri.parse('$baseUrl/$cardID'));
    if(response.statusCode != 200){
      throw Exception("Delete Failed");
    }
  }

  Future<void> UpdateCard(int id, CardFromClient card) async{
    final response = await http.put(Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(card.toJson()));
    if(response.statusCode != 200 && response.statusCode != 404) {
      throw Exception('Failed to load data');
    }  }
}
