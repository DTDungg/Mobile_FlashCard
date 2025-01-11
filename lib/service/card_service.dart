import 'package:http/http.dart' as http;
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'dart:convert';

class CardService{
  final String baseUrl = 'https://10.0.2.2:7252/api/Card/reviewed?';

  Future<void> UpdateReviewedCard (int cardID, int typeID) async{
    final response = await http.get(Uri.parse('${baseUrl}cardID=$cardID&typeID=$typeID'));
      if(response.statusCode != 200){
        throw Exception("Update Failed");
      }
  }
}