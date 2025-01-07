import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/app_bar_game.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:mobile_flash_card/utils/simple_deck.dart';

import '../controller/heart_controller.dart';
import '../controller/time_controller.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TimeController timeController = Get.put(TimeController());
  HeartController heartController = Get.put(HeartController());
  RxInt gift = 100.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarGame(
              isGaming: false,
              heartController: heartController,
              timeController: timeController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.blueAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: const Icon(
                    Icons.card_giftcard,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Obx(() => Text(
                      gift.toString(),
                      style: GoogleFonts.rubikBubbles(
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                          color: Define.strongPurple),
                    ))
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side:
                        const BorderSide(color: Define.strongPurple, width: 1)),
                onPressed: () {
                  timeController.setTime();
                  gift--;
                },
                child: Text(
                  '1 gift for 30 more seconds',
                  style: GoogleFonts.rubikBubbles(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Define.strongBlue),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side:
                        const BorderSide(color: Define.strongPurple, width: 1)),
                onPressed: () {
                  heartController.addHeart();
                  gift--;
                },
                child: Text(
                  '    1 gift for 5 more hearts    ',
                  style: GoogleFonts.rubikBubbles(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Define.strongBlue),
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Text(
                  'Select a set so start!',
                  style: GoogleFonts.rubikBubbles(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Define.strongPurple),
                ),
              ),
            ),
            SizedBox(
              width: 380,
              height: 600,
              child: ListView(
                padding: EdgeInsets.only(top: 5, bottom: 80),
                children: [
                  SimpleDeck(name: 'Cooking', describe: 'cooking and kitchen relatedthings'),
                  SimpleDeck(name: 'Cooking a a a a a a a a a a', describe: 'cooking and kitchen relatedthings'),
                  SimpleDeck(name: 'Cooking a a a a a a a a aa a aa a a a a a', describe: 'cooking and kitchen relatedthings a a a a a a a a a'),
                  SimpleDeck(name: 'Cooking', describe: 'cooking and kitchen relatedthings a a a a a a a a a aa '),
                  SimpleDeck(name: 'Cooking', describe: 'cooking and kitchen relatedthings'),
                  SimpleDeck(name: 'Cooking', describe: 'cooking and kitchen relatedthings'),
                  SimpleDeck(name: 'Cooking a a a a a a a a aa a aa a a a a a', describe: 'cooking and kitchen relatedthings a a a a a a a a a'),
                ],
              ),
            )
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomBar(index: 0),
    );
  }
}
