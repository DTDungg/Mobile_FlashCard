import 'package:flutter/material.dart';
import 'package:mobile_flash_card/model/card_from_client.dart';
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'package:mobile_flash_card/model/deck_from_client.dart';
import 'package:mobile_flash_card/screen/card_screen.dart';
import 'package:mobile_flash_card/service/card_service.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import '../model/deck.dart';

class AddCardScreen extends StatefulWidget {
  //final List<CardFromDB> cards;
  final Deck deck;

  const AddCardScreen({super.key, required this.deck});

  @override
  State<StatefulWidget> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {

  final TextEditingController frontController = TextEditingController();
  final TextEditingController backController = TextEditingController();
  final TextEditingController describeController = TextEditingController();

  void _stopReview() {
    Get.back();
  }

  //int index = 0;
  //late CardFromDB cardFromDB;

  //@override
  // void initState() {
  //   super.initState();
  //   if (widget.cards.isNotEmpty) {
  //     cardFromDB = widget.cards[0]; // Gán thẻ đầu tiên
  //   }
  // }

  // _changeCard(int i) {
  //   setState(() {
  //     int newIndex = index + i;
  //     if (newIndex >= 0 && newIndex < widget.cards.length) {
  //       index = newIndex;
  //       cardFromDB = widget.cards[index];
  //     }else{
  //       Get.snackbar('Hello', 'no more card to review',backgroundColor: Define.lightPurple,colorText: Colors.white);
  //     }
  //   });
  // }

  // void _update(int i) {
  //   CardService().UpdateReviewedCard(widget.cards[index].cardId! ,( widget.cards[index].typeId! + i));
  // }

  final controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    // if (widget.card == null) {
    //   return Center(
    //     child: Text(
    //       'No cards available',
    //       style: GoogleFonts.rubik(
    //           fontWeight: FontWeight.w400,
    //           fontSize: 24,
    //           color: Define.strongPurple),
    //     ),
    //   );
    // }
    return Scaffold(
      extendBody: true,
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
              ],
            ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.all(0),
              height: 450,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    controller: frontController,
                    decoration: InputDecoration(
                      hintText: 'Word',
                      hintStyle: GoogleFonts.rubikBubbles(
                          color: Define.lightPurple,
                          fontSize: 32,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  TextField(
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    controller: backController,
                    decoration: InputDecoration(
                      hintText: 'Meaning',
                      hintStyle: GoogleFonts.rubikBubbles(
                          color: Define.lightPurple,
                          fontSize: 32,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  TextField(
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    controller: describeController,
                    decoration: InputDecoration(
                        hintText: 'Describe',
                        hintStyle: GoogleFonts.rubikBubbles(
                          color: Define.lightPurple,
                          fontSize: 32,
                          fontWeight: FontWeight.w400
                        ),
                    ),
                  ),

                ],
              ),
            ),
            // GestureDetector(
            //     onTap: controller.flipcard,
            //     child: FlipCard(
            //         rotateSide: RotateSide.right,
            //         onTapFlipping: false,
            //         axis: FlipAxis.vertical,
            //         controller: controller,
            //         frontWidget: Center(
            //           child: Container(
            //             width: 330,
            //             height: 200,
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 border: Border.all(
            //                     color: Define.strongPurple, width: 3),
            //                 borderRadius: BorderRadius.circular(20)),
            //             child: Center(
            //               child: Text(
            //                 '${cardFromDB.front}',
            //                 style: GoogleFonts.rubikBubbles(
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: 32,
            //                     color: Define.strongPurple),
            //               ),
            //             ),
            //           ),
            //         ),
            //         backWidget: Center(
            //           child: Container(
            //             padding: EdgeInsets.all(10),
            //             width: 330,
            //             height: 300,
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 border: Border.all(
            //                     color: Define.strongPurple, width: 3),
            //                 borderRadius: BorderRadius.circular(20)),
            //             child: Column(children: [
            //               Text(
            //                 '${cardFromDB.back}',
            //                 style: GoogleFonts.rubikBubbles(
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: 32,
            //                     color: Define.strongPurple),
            //               ),
            //               Text(
            //                 overflow: TextOverflow.ellipsis,
            //                 maxLines: 4,
            //                 '${cardFromDB.description}',
            //                 style: GoogleFonts.rubik(
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: 28,
            //                     color: Define.strongPurple),
            //               ),
            //             ]),
            //           ),
            //         ))),


            const SizedBox(
              height: 50,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       onPressed: ()=> _update(1),
            //       icon: const Icon(Icons.sentiment_very_satisfied, color: Define.strongPurple,size: 40),
            //     ),
            //     const SizedBox(width: 10,),
            //     IconButton(
            //       onPressed: ()=>_update(0),
            //       icon: const Icon(Icons.sentiment_neutral, color: Define.strongPurple,size: 40),
            //     ),
            //     const SizedBox(width: 10,),
            //     IconButton(
            //       onPressed: ()=>_update(-1),
            //       icon: const Icon(Icons.sentiment_very_dissatisfied, color: Define.strongPurple,size: 40),
            //     ),
            //   ],
            // ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () async {
                      try {
                        await CardService().createNewCard(CardFromClient(front: frontController.text, back: backController.text, description: describeController.text, setId: widget.deck.id));
                        Get.snackbar('Success','Successfull add new card' ,colorText: Colors.white, backgroundColor: Define.lightPurple);
                        frontController.text = '';
                        backController.text = '';
                        describeController.text = '';
                      } catch (e) {
                        throw Exception('Failed to load data');
                      }
                    },
                  child: Container(
                    width: 350,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Define.lightPurple,
                        border: Border.all(
                            color: Define.strongPurple,
                            width: 1
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: GoogleFonts.rubikBubbles(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple),
                      ),
                    ),
                  ),
                    // style: ElevatedButton.styleFrom(
                    //     backgroundColor: Define.lightPurple,
                    //     side: const BorderSide(color: Define.strongPurple, width: 1),
                    //     elevation: 5),
                    // child: Text('Save',
                    //     style: GoogleFonts.rubikBubbles(
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 24,
                    //       color: Define.strongPurple,
                    //     ))
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Get.off(CardScreen(deck: widget.deck));
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.rubikBubbles(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Define.strongPurple),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),

              ],
            )
          ],
        ),
      ),
    );
  }


}
