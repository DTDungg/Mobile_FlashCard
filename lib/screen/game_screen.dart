import 'package:flutter/material.dart';
import 'package:mobile_flash_card/controller/user_controller.dart';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:mobile_flash_card/service/user_service.dart';
import 'package:mobile_flash_card/utils/app_bar_game.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:mobile_flash_card/utils/simple_deck.dart';

import '../controller/heart_controller.dart';
import '../controller/time_controller.dart';
import '../model/deck_from_db.dart';
import '../service/deck_service.dart';

class GameScreen extends StatefulWidget {
  final int userID;
  const GameScreen({super.key, required this.userID});

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late Future<List<DeckFromDb>> futureDeck;
  late Future<UserFromDB> userFromDB;
  RxInt gift = 0.obs;

  @override
  void initState() {
    super.initState();
    futureDeck = DeckService().fetchAllDeck(widget.userID);
    userFromDB = UserService().fetchUser(widget.userID);
    userFromDB.then((user) {
      gift.value = user.gift ?? 0;
    });
  }
  TimeController timeController = Get.put(TimeController());
  HeartController heartController = Get.put(HeartController());
  UserIDController userIDController = Get.put(UserIDController());


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
            const SizedBox(
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
                const SizedBox(
                  width: 5,
                ),
                Obx(() => Text(
                      gift.value.toString(),
                      style: GoogleFonts.rubikBubbles(
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                          color: Define.strongPurple),
                    )
                )
              ],
            ),
            const SizedBox(height: 10),
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
                  gift.value--;
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
              child: FutureBuilder<List<DeckFromDb>>(
                  future: futureDeck,
                  builder: (context, snapshot) {
                    //dữ liệu chưa về
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Lỗi : ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<DeckFromDb> deck = snapshot.data!;
                      if (deck.isEmpty) {
                        return const Center(
                          child: Text(
                            "No deck found",
                            style: TextStyle(color: Define.strongPurple),
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: deck.length,
                          itemBuilder: (context, index) {
                            DeckFromDb deckItem = deck[index];
                            return SimpleDeck(name: deckItem.setName!, describe: deckItem.setDescription!, deckID: deckItem.setId!,);
                          });
                    } else {
                      return const Text('No data available');
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
