import 'package:flutter/material.dart';
import 'package:mobile_flash_card/controller/user_controller.dart';
import 'package:mobile_flash_card/service/user_service.dart';
import 'package:mobile_flash_card/utils/app_bar_game.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../controller/heart_controller.dart';
import '../controller/time_controller.dart';

class GameResult extends StatefulWidget {
  final bool isWin;

  const GameResult({super.key, required this.isWin});

  @override
  State<StatefulWidget> createState() => _GameResultState();
}

class _GameResultState extends State<GameResult> {
  TimeController timeController = Get.put(TimeController());
  HeartController heartController = Get.put(HeartController());
  UserIDController userIDController = Get.put(UserIDController());
  late int userID;

  @override
  void initState() {
    super.initState();
    userID = userIDController.userID.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarGame(
                isGaming: false,
                heartController: heartController,
                timeController: timeController),
            const SizedBox(height: 100),
            Container(
              child: widget.isWin
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text(
                            'You win!',
                            style: GoogleFonts.rubikBubbles(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 80,
                              shadows: [
                                Shadow(
                                  offset: Offset(3.0, 3.0), // Vị trí bóng
                                  blurRadius: 3.0, // Độ mờ của bóng
                                  color: Define.strongPurple, // Màu bóng
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text('You have receive 2 gifts !!!',
                              style: GoogleFonts.rubikBubbles(
                                fontWeight: FontWeight.w400,
                                color: Define.strongPurple,
                                fontSize: 28,
                              )),
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
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                        ])
                  : Column(
                    children: [
                      SizedBox(height: 150,),
                      Center(
                          child: Text(
                            'You lose!',
                            style: GoogleFonts.rubikBubbles(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 80,
                              shadows: [
                                Shadow(
                                  offset: Offset(3.0, 3.0), // Vị trí bóng
                                  blurRadius: 3.0, // Độ mờ của bóng
                                  color: Define.strongPurple, // Màu bóng
                                ),
                              ],
                            ),
                          ),),
                    ],
                  ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Define.strongBlue,
                    side: const BorderSide(color: Define.strongPurple, width: 1),
                    elevation: 5),
                onPressed: () {
                  if(widget.isWin)
                    UserService().updateGift(userID, 2);
                  Get.off(BottomBar(selectedIndex: 0));
                  timeController.initialTime.value = 120;
                  timeController.remainingTime.value = 120;
                  timeController.pauseTimer();
                  heartController.heart.value = 5;

                },
                child: Text('One more game',
                    style: GoogleFonts.rubikBubbles(
                      fontWeight: FontWeight.w500,
                      color: Define.strongPurple,
                      fontSize: 28,
                    )))
          ],
        ),
      ),
    );
  }
}
