import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/add_deck_dialog.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/deck_widget.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryScreen> {
  Deck deck = Deck(
      id: 1,
      name: 'Cooking',
      isPublic: false,
      description:
          'a a a a a a a a a a a a aaa aa cooking and kitchen related things',
      like: 10,
      userID: 1);

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
              FindBar(),
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AddDeckDialog();
                          });
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 670,
                  width: 330,
                  child: ListView(
                    children: [
                      DeckWidget(deck: deck),
                      DeckWidget(
                          deck: Deck(
                              id: 2,
                              name: "Hello a a a a a a a aaa a a ",
                              description: "how to say hello in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(
                          deck: Deck(
                              id: 3,
                              name: "Hello",
                              description:
                                  "how to say a a a a a a a a a a a a a a a a a a a a a a â  â  a  in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(
                          deck: Deck(
                              id: 4,
                              name: "Hello",
                              description: "how to say hello in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(deck: deck),
                      DeckWidget(
                          deck: Deck(
                              id: 2,
                              name: "Hello a a a a a a a aaa a a ",
                              description: "how to say hello in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(
                          deck: Deck(
                              id: 3,
                              name: "Hello",
                              description:
                                  "how to say a a a a a a a a a a a a a a a a a a a a a a â  â  a  in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(
                          deck: Deck(
                              id: 4,
                              name: "Hello",
                              description: "how to say hello in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(deck: deck),
                      DeckWidget(
                          deck: Deck(
                              id: 2,
                              name: "Hello a a a a a a a aaa a a ",
                              description: "how to say hello in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(
                          deck: Deck(
                              id: 3,
                              name: "Hello",
                              description:
                                  "how to say a a a a a a a a a a a a a a a a a a a a a a â  â  a  in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                      DeckWidget(
                          deck: Deck(
                              id: 4,
                              name: "Hello",
                              description: "how to say hello in many languages",
                              isPublic: true,
                              like: 10,
                              userID: 1)),
                    ],
                  )),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomBar(index: 1),
    );
  }
}