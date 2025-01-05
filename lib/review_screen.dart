import 'package:flutter/material.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


class ReviewScreen extends StatefulWidget{
  final Deck deck;

  const ReviewScreen({super.key, required this.deck});

  @override
  State<StatefulWidget> createState() => _ReviewScreenState();

}

class _ReviewScreenState extends State<ReviewScreen>{

  void _stopReview() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 280,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "${widget.deck.fortmatID()}: ${widget.deck.name}",
                      style: GoogleFonts.rubikBubbles(
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                          color: Define.strongPurple),
                    )
                ),
                GestureDetector(
                  onTap: _stopReview,
                child: BlueButton(content: 'STOP', w: 100))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(index:1),
    );
  }


}