import 'package:flutter/material.dart';
import 'package:mobile_flash_card/controller/heart_controller.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../controller/time_controller.dart';

class AppBarGame extends StatelessWidget {
  bool isGaming;
  TimeController timeController;
  HeartController heartController;

  AppBarGame(
      {super.key,
      required this.isGaming,
      required this.heartController,
      required this.timeController});

  String _formatTime(int totalSecond) {
    int minutes = totalSecond ~/ 60;
    int seconds = totalSecond % 60;
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(color: Define.strongBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isGaming
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Define.strongPurple,
                    size: 40,
                  ))
              : const SizedBox(width: 56),
          const SizedBox(width: 80),
          const Icon(
            Icons.schedule,
            color: Define.strongPurple,
            size: 30,
          ),
          const SizedBox(width: 5),
          Obx(() => Text(
                _formatTime(timeController.remainingTime.value),
                style: GoogleFonts.rubikBubbles(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
          const SizedBox(width: 80),
          Icon(
            Icons.favorite,
            color: Define.strongPurple,
            size: 30,
          ),
          const SizedBox(width: 5),
          Obx(() => Text(heartController.heart.value.toString(),
              style: GoogleFonts.rubikBubbles(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))),
        ],
      ),
    );
  }
}
