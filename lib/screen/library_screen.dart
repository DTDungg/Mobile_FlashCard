import 'package:flutter/material.dart';
import 'package:mobile_flash_card/controller/search_controller.dart';
import 'package:mobile_flash_card/model/deck_from_db.dart';
import 'package:mobile_flash_card/service/deck_service.dart';
import 'package:mobile_flash_card/utils/add_deck_dialog.dart';
import 'package:mobile_flash_card/utils/deck_widget.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryScreen> {
  late Future<List<DeckFromDb>> futureDeck;
  UserIDController userID = Get.put(UserIDController());
  var selectedValue = null;
  SearchXController searchController = Get.put(SearchXController());
  late Future<List<DeckFromDb>> decks ;

  @override
  void initState() {
    super.initState();
    futureDeck = decks = DeckService().fetchAllDeck(userID.userID.value);
  }

  void _updateDecks() {
    setState(() {
      futureDeck = DeckService().fetchAllDeck(userID.userID.value);
    });
  }

  void search() async {
    String text = searchController.library.trim().toLowerCase();
    // Nếu ô tìm kiếm trống, hiển thị lại toàn bộ danh sách
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              FindBar(update: search, index: 1),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 330,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Define.strongPurple, width: 2)),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Define.strongPurple,
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AddDeckDialog(userID: userID.userID.value);
                          });
                      setState(() {
                        futureDeck = DeckService().fetchAllDeck(userID.userID.value);
                      });
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 670,
                width: 330,
                child: FutureBuilder<List<DeckFromDb>>(
                    future: futureDeck,
                    builder: (context, snapshot) {
                      //dữ liệu chưa về
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Lỗi : ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<DeckFromDb> deck = snapshot.data!;
                        if (deck.isEmpty) {
                          return const Center(
                            child: Text(
                              "No deck found",
                              style: TextStyle(color: Define.strongPurple),
                            ),
                          );
                        }
                        return ListView.builder(
                            itemCount: deck.length,
                            itemBuilder: (context, index) {
                              DeckFromDb deckItem = deck[index];
                              return DeckWidget(
                                deck: Deck(
                                    id: deckItem.setId!,
                                    name: deckItem.setName!,
                                    isPublic: deckItem.isPublic!,
                                    description: deckItem.setDescription!,
                                    like: deckItem.liked!,
                                    userID: deckItem.userId!),
                                onDelete: _updateDecks,
                                edit: _updateDecks,
                              );
                            });
                      } else {
                        return const Text('No data available');
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}