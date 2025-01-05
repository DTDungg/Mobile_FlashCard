import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/define.dart';
import '../model/card.dart';

class CardWidget extends StatelessWidget {
  final CustomCard card;

  const CardWidget({super.key, required this.card});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 330,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Define.strongPurple, width: 1)),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.check_box_outline_blank),
                ),
                Text(
                  card.front,
                  style: GoogleFonts.rubikBubbles(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: Define.strongPurple),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
