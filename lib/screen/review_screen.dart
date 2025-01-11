import 'package:flutter/material.dart';
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'package:mobile_flash_card/service/card_service.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class ReviewScreen extends StatefulWidget {
  final List<CardFromDB> cards;
  final String id;
  final String name;

  const ReviewScreen(
      {super.key, required this.cards, required this.id, required this.name});

  @override
  State<StatefulWidget> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  void _stopReview() {
    Get.back();
  }

  int index = 0;
  late CardFromDB cardFromDB;

  @override
  void initState() {
    super.initState();
    if (widget.cards.isNotEmpty) {
      cardFromDB = widget.cards[0]; // Gán thẻ đầu tiên
    }
  }

  _changeCard(int i) {
    setState(() {
      int newIndex = index + i;
      if (newIndex >= 0 && newIndex < widget.cards.length) {
        index = newIndex;
        cardFromDB = widget.cards[index];
      }else{
        Get.snackbar('Hello', 'no more card to review',backgroundColor: Define.lightPurple,colorText: Colors.white);
      }
    });
  }

  void _update(int i) {
    CardService().UpdateReviewedCard(widget.cards[index].cardId! ,( widget.cards[index].typeId! + i));
  }

  final controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) {
      return Center(
        child: Text(
          'No cards available',
          style: GoogleFonts.rubik(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Define.strongPurple),
        ),
      );
    }
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
                      "${widget.id}: ${widget.name}",
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
                                color: Define.strongPurple, width: 3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            '${cardFromDB.front}',
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
                        padding: EdgeInsets.all(10),
                        width: 330,
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Define.strongPurple, width: 3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          Text(
                            '${cardFromDB.back}',
                            style: GoogleFonts.rubikBubbles(
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                color: Define.strongPurple),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            '${cardFromDB.description}',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 28,
                                color: Define.strongPurple),
                          ),
                        ]),
                      ),
                    ))),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: ()=> _update(1),
                    icon: const Icon(Icons.sentiment_very_satisfied, color: Define.strongPurple,size: 40),
                ),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: ()=>_update(0),
                  icon: const Icon(Icons.sentiment_neutral, color: Define.strongPurple,size: 40),
                ),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: ()=>_update(-1),
                  icon: const Icon(Icons.sentiment_very_dissatisfied, color: Define.strongPurple,size: 40),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _changeCard(-1),
                  child: BlueButton(content: 'Back', w: 100),
                ),
                const SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: () => _changeCard(1),
                  child: BlueButton(content: 'Next', w: 100),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}
