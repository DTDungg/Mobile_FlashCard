import 'package:flutter/material.dart';
import 'package:mobile_flash_card/controller/search_controller.dart';
import 'package:mobile_flash_card/controller/user_controller.dart';
import 'package:mobile_flash_card/model/deck_from_db.dart';
import 'package:mobile_flash_card/service/deck_service.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/famous_set.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';
import 'package:mobile_flash_card/utils/user_rank.dart';
import 'package:get/get.dart';

import '../model/deck.dart';
import '../model/user_from_db.dart';
import '../service/user_service.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  late Future<List<UserFromDB>> futureUserRank;
  late Future<List<DeckFromDb>> futureDeck;
  late Future<List<DeckFromDb>> decks;
  UserIDController userID = Get.put(UserIDController());
  SearchXController searchXController = Get.put(SearchXController());
  @override
  void initState() {
    super.initState();
    futureUserRank = UserService().topUser();
    futureDeck = decks = DeckService().getFamousSet(userID.userID.value);
  }

  void upDateScreen() {
    setState(() {
      futureUserRank = UserService().topUser();
      futureDeck = DeckService().getFamousSet(userID.userID.value);
    });
  }

  void search() async{
    String text = searchXController.community.trim().toLowerCase();
    if (text.isEmpty) {
      setState(() {
        futureDeck = decks;
      });
    } else {
      // Giải quyết `decks` và lọc kết quả tìm kiếm
      final resolvedDecks = await decks;
      setState(() {
        futureDeck = Future.value(
          resolvedDecks.where((deck) => deck.setName!.toLowerCase().contains(text)).toList(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'LeaderBoard',
                textAlign: TextAlign.start,
                style: GoogleFonts.rubikBubbles(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Define.strongPurple),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 240,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FutureBuilder<List<UserFromDB>>(
                      future: futureUserRank,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Lỗi : ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          List<UserFromDB> users = snapshot.data!;
                          if (users.isEmpty) {
                            return const Center(
                              child: Text(
                                "have no user",
                                style: TextStyle(color: Define.strongPurple),
                              ),
                            );
                          }
                          return ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                UserFromDB user = users[index];
                                return UserRank(
                                    userColor: index < 3
                                        ? Define.lightBlue
                                        : Colors.white,
                                    rank: (index + 1),
                                    avatar: user.avatar!,
                                    name: user.userName!,
                                    gift: user.gift!);
                              });
                        } else {
                          return const Text('No data available');
                        }
                      })),
              const SizedBox(height: 20),
              Text(
                'Famous set',
                style: GoogleFonts.rubikBubbles(
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: Define.strongPurple),
              ),
              const SizedBox(height: 5),
              FindBar(update: search, index: 3),
              const SizedBox(height: 10),
              Container(
                width: 345,
                height: 435,
                child: FutureBuilder(
                    future: futureDeck,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Lỗi : ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<DeckFromDb> decks = snapshot.data!;
                        if (decks.isEmpty) {
                          return const Center(
                            child: Text(
                              "have no deck",
                              style: TextStyle(color: Define.strongPurple),
                            ),
                          );
                        }
                        return ListView.builder(
                            itemCount: decks.length,
                            itemBuilder: (context, index) {
                              DeckFromDb deck = decks[index];
                              return FamousSet(
                                deck: Deck(
                                    id: deck.setId!,
                                    name: deck.setName!,
                                    isPublic: deck.isPublic!,
                                    description: deck.setDescription!,
                                    like: deck.liked!,
                                    userID: deck.userId!),
                                like: upDateScreen,
                              );
                            });
                      } else {
                        return const Text('No data available');
                      }
                    })
                ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
