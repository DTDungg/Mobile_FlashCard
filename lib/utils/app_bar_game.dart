import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarGame extends StatefulWidget {
  const AppBarGame({super.key});

  @override
  State<StatefulWidget> createState() => AppBarGameState();
}

class AppBarGameState extends State<AppBarGame> {
  bool isGaming = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 380,
      decoration: const BoxDecoration(color: Define.strongBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isGaming
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isGaming = !isGaming;
                    });
                  },
                  icon: const Icon(Icons.close, color: Define.strongPurple))
              : const SizedBox(width: 40),
          const SizedBox(width: 50),
          const Icon(Icons.schedule,color: Define.strongPurple),
          Text(
            '02:00',
            style: GoogleFonts.rubikBubbles(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
