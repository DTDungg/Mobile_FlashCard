import 'package:flutter/material.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class ReviewScreen extends StatefulWidget {
  final Deck deck;

  const ReviewScreen({super.key, required this.deck});

  @override
  State<StatefulWidget> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  void _stopReview() {
    Get.back();
  }

  final controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
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
                    )),
                GestureDetector(
                    onTap: _stopReview,
                    child: const BlueButton(content: 'STOP', w: 100))
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: controller.flipcard,
                child: FlipCard(
                    rotateSide: RotateSide.right,
                    onTapFlipping: false,
                    axis: FlipAxis.vertical,
                    controller: controller,
                    frontWidget: Center(
                      child: Container(
                        width: 330,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Define.strongPurple,
                            width: 3
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            'Hello',
                            style: GoogleFonts.rubikBubbles(
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                color: Define.strongPurple),
                          ),
                        ),
                      ),
                    ),
                    backWidget: Center(
                      child: Container(
                        width: 330,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Define.strongPurple,
                                width: 3
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            'Xin chao',
                            style: GoogleFonts.rubikBubbles(
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                color: Define.strongPurple),
                          ),
                        ),
                      ),
                    ))),
            const SizedBox(height: 100,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlueButton(content: 'Back', w: 100),
                SizedBox(width: 100,),
                BlueButton(content: 'Next', w: 100)
              ],
            )
          ],
        ),
      ),

    );
  }
}
