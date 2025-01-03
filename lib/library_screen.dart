import 'package:flutter/material.dart';
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
  void _nothing() {}

  Deck deck = Deck(id: 1, name: 'Cooking', isPublic: false, description: 'aaaaaaaaaaaa aaa aa cooking and kitchen related things');

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
                        border:
                            Border.all(color: Define.strongPurple, width: 2)),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Define.strongPurple,
                      onPressed: _nothing,
                    )
                ),
                SizedBox(height: 15,),
                SizedBox(
                  height: 670,
                    width: 330,
                    child:ListView(
                      children: [
                        DeckWidget(deck: deck),
                        DeckWidget(deck: Deck(id: 2, name: "Hello", description: "how to say hello in many languages", isPublic: true)),
                        DeckWidget(deck: Deck(id: 3, name: "Hello", description: "how to say a a a a a a a a a a a a a a a a a a a a a a â  â  a  in many languages", isPublic: true)),
                        DeckWidget(deck: Deck(id: 4, name: "Hello", description: "how to say hello in many languages", isPublic: true)),
                      ],
                    )
                ),
              ],
            ),
          ),
        ));
  }
}
