import 'package:flutter/material.dart';
import 'package:mobile_flash_card/screen/play_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SimpleDeck extends StatelessWidget{
  final String name;
  final String describe;
  final int deckID;

  const SimpleDeck({super.key, required this.name, required this.describe, required this.deckID});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: (){Get.to(PlayScreen(deckID: deckID));},
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Define.strongPurple,
              width: 1
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubikBubbles(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Define.strongPurple
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        describe,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.rubik(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),

    );
  }

}