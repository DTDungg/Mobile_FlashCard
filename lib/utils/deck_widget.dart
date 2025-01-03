import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/card_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:get/get.dart';

class DeckWidget extends StatefulWidget {
  final Deck deck;

  const DeckWidget(
      {super.key,
      required this.deck});

  @override
  State<StatefulWidget> createState() => _DeckState();
}

class _DeckState extends State<DeckWidget> {

  void _goToDeckDetail() {
    Get.to(CardScreen(idName: widget.deck.fortmatID() + ": "+ widget.deck.name, isPublic: widget.deck.isPublic));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 330,
        child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Define.strongPurple, width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 230,
                        child: GestureDetector(
                          onTap: _goToDeckDetail,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "${widget.deck.fortmatID()}: ${widget.deck.name}",
                            style: GoogleFonts.rubikBubbles(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Define.strongPurple),
                          ),
                        ),
                      ),
                      Icon(
                        widget.deck.isPublic ? Icons.public : Icons.lock,
                        color: Define.strongPurple,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.draw,
                        color: Define.strongPurple,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.deck.description,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Define.strongPurple),
                    ),
                  )
                ],
              ),
            )));
  }
}
