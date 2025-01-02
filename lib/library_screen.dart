import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/deck.dart';
import 'package:mobile_flash_card/utils/define.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryScreen> {
  void _nothing() {}

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
                Container(
                  width: 330,
                  height: 45,
                  child: TextField(
                    cursorColor: Define.strongPurple,
                    cursorWidth: 2,
                    style: TextStyle(color: Define.strongPurple, fontSize: 18),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Define.strongPurple,
                        size: 35,
                      ),
                      iconColor: Define.strongPurple,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Define.strongPurple, width: 2),
                          borderRadius: BorderRadius.circular(30)),

                    ),
                  ),
                ),
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
                SizedBox(height: 15),
                Deck(id: 1, name: "Cooking", description: "aaaaaaaaaaaa aaa aa cooking and kitchen related things", isPublic: false),
                SizedBox(height: 15),
                Deck(id: 2, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 3, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 4, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 5, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 6, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 7, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 8, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 9, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 15),
                Deck(id: 10, name: "Hello", description: "how to say hello in many languages", isPublic: true),
                SizedBox(height: 100,)
              ],
            ),
          ),
        ));
  }
}
