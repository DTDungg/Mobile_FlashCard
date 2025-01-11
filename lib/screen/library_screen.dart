import 'package:flutter/material.dart';
import 'package:mobile_flash_card/model/deck_from_db.dart';
import 'package:mobile_flash_card/service/deck_service.dart';
import 'package:mobile_flash_card/utils/add_deck_dialog.dart';
import 'package:mobile_flash_card/utils/deck_widget.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key, required this.userID});
  final int userID;

  @override
  State<StatefulWidget> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryScreen> {
  late Future<List<DeckFromDb>> futureDeck;

  @override
  void initState() {
    super.initState();
    futureDeck = DeckService().fetchAllDeck(widget.userID);
  }

  void _updateDecks() {
    setState(() {
      futureDeck = DeckService().fetchAllDeck(widget.userID);
    });
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
              const FindBar(),
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
                            return AddDeckDialog(userID: widget.userID);
                          });
                      setState(() {
                        futureDeck = DeckService().fetchAllDeck(widget.userID);
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
                              );
                            });

                        //   ListView(
                        //   children: [
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 2,
                        //             name: "Hello a a a a a a a aaa a a ",
                        //             description:
                        //                 "how to say hello in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 3,
                        //             name: "Hello",
                        //             description:
                        //                 "how to say a a a a a a a a a a a a a a a a a a a a a a â  â  a  in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 4,
                        //             name: "Hello",
                        //             description:
                        //                 "how to say hello in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 2,
                        //             name: "Hello a a a a a a a aaa a a ",
                        //             description:
                        //                 "how to say hello in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 3,
                        //             name: "Hello",
                        //             description:
                        //                 "how to say a a a a a a a a a a a a a a a a a a a a a a â  â  a  in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 4,
                        //             name: "Hello",
                        //             description:
                        //                 "how to say hello in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 2,
                        //             name: "Hello a a a a a a a aaa a a ",
                        //             description:
                        //                 "how to say hello in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 3,
                        //             name: "Hello",
                        //             description:
                        //                 "how to say a a a a a a a a a a a a a a a a a a a a a a â  â  a  in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //     DeckWidget(
                        //         deck: Deck(
                        //             id: 4,
                        //             name: "Hello",
                        //             description:
                        //                 "how to say hello in many languages",
                        //             isPublic: true,
                        //             like: 10,
                        //             userID: 1)),
                        //   ],
                        // );
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
