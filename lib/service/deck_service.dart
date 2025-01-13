import 'package:http/http.dart' as http;
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'package:mobile_flash_card/model/deck_from_client.dart';
import 'dart:convert';

import 'package:mobile_flash_card/model/deck_from_db.dart';

import '../model/deck.dart';

class DeckService{
  final String baseUrl = 'https://10.0.2.2:7252/api/Set';

  //lấy thông tin làm bảng
  Future<List<DeckFromDb>> fetchAllDeck(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/user/$id'));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json)=> DeckFromDb.fromJson(json)).toList();
    }if(response.statusCode == 404){
      return List.empty();
    }
    else{
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
    }
  }

  Future<List<DeckFromDb>> deckOfOtherUser(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/otheruser/$id'));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json)=> DeckFromDb.fromJson(json)).toList();
    }if(response.statusCode == 404){
      return List.empty();
    }
    else{
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
    }
  }

  Future createNewDeck(DeckFromClient deck) async{
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(deck.toJson()));
    if(response.statusCode != 200 && response.statusCode != 404){
      throw Exception('Failed to load data');
    }
  }

  Future deleteDeck(int id) async{
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if(response.statusCode == 200){
      return;
    }else if (response.statusCode == 404) {
      throw Exception('Deck not found: $id');
    } else {
    throw Exception('Failed to delete deck: ${response.statusCode} - ${response.body}');
    }
  }

  Future updateNewDeck(int id, DeckFromClient deck) async{
    final response = await http.put(Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(deck.toJson()));
    if(response.statusCode != 200 && response.statusCode != 404){
      throw Exception('Failed to load data');
    }
  }

  Future <List<DeckFromDb>> getFamousSet(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/famous/$id'));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json)=> DeckFromDb.fromJson(json)).toList();
    }if(response.statusCode == 404){
      return List.empty();
    }
    else{
      throw Exception("Lỗi: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> increaseLike(int id) async{
    final response = await http.put(Uri.parse('$baseUrl/like/$id'));
    if(response.statusCode == 200){
      return;
    }else if (response.statusCode == 404) {
      throw Exception('Deck not found: $id');
    } else {
      throw Exception('Failed to delete deck: ${response.statusCode} - ${response.body}');
    }
  }

}