import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/deck.dart';

class FamousSet extends StatefulWidget {
  final Deck deck;

  const FamousSet({super.key, required this.deck});

  @override
  State<StatefulWidget> createState() => _SetState();
}

class _SetState extends State<FamousSet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Define.strongPurple, width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              width: 270,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${widget.deck.fortmatID()}: ${widget.deck.name}',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubikBubbles(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1, color: Define.strongPurple)),
                            child: const Image(
                                image: AssetImage('assets/images/fc.png'))),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Doris',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Define.strongPurple),
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.deck.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Define.strongPurple),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          widget.deck.like.toString(),
                          style: GoogleFonts.rubikBubbles(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: Define.strongPurple),
                        ),
                        const Icon(Icons.favorite, color: Define.strongPurple)
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: Define.nothing,
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                            padding: const EdgeInsets.only(left: 0),
                            backgroundColor: Define.lightPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(
                                color: Define.strongPurple, width: 1)),
                        child: const Icon(
                          Icons.add,
                          color: Define.strongPurple,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
